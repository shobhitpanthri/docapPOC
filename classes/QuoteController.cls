public class QuoteController{
    SFDC_520_Quote__c q = new SFDC_520_Quote__c();
    Opportunity o; 
    Account a;  
    User u = new User();
    List<OpportunityLineItem> oli = new List<OpportunityLineItem>(); 
    List<SFDC_520_QuoteLine__c> qli = new List<SFDC_520_QuoteLine__c>();
    List<SFDC_520_QuoteLine__c> qbli = new List<SFDC_520_QuoteLine__c>();  
    Date valid, given; 
    SFDC_520_Quote__c theQ; 
    Savepoint sp = Database.setSavepoint(); 
    
    public Opportunity getO(){
        return o;
    }
    
    public Account getA(){
        return a;   
    }
    
    public User getU(){
        return u; 
    }
    
    public SFDC_520_Quote__c getQ(){
        return q;   
    }
    
    public List<SFDC_520_QuoteLine__c> getQbli(){
        return qbli;    
    }
    
    //** START CODE FOR DYNAMIC PARTNER QUOTE LOGOS
    
    public String PartnerLogoURL;
    User PartnerUser = new User();
    
    public String getPartnerLogo() {
    	return PartnerLogoURL;
    }
    
    public Boolean ShowPartnerLogo = false;
    
    public Boolean getShowPartnerLogo() {
    	return ShowPartnerLogo;
    }
    
    public Boolean ShowInternalLogo = false;
    
    public Boolean getShowInternalLogo() {
    	return ShowInternalLogo;
    }
    
    //** END CODE FOR DYNAMIC PARTNER QUOTE LOGOS 
    
    public void init(){
        //Get Opportunity and Account information
            
            u = [Select Phone, Name, Email, ContactId From User where Id = :UserInfo.getUserId()]; 
            
            
            //** START CODE FOR DYNAMIC PARTNER QUOTE LOGOS
                       
            ShowPartnerLogo = false;
            
            if( u.ContactId != null ){
            	User PartnerUser= [select Contact.AccountId from User where id= :UserInfo.getUserId() limit 1];
            	try {
            		Attachment att = [Select ParentId, Name, Id From Attachment where ParentId = :PartnerUser.Contact.AccountId and Name like '%Logo%' limit 1];
    				PartnerLogoURL = '/servlet/servlet.FileDownload?file='+att.Id;
            		ShowPartnerLogo = true;
            		ShowInternalLogo = false;
            	}
            	catch(Exception e) {
            		ShowPartnerLogo = false;
            		ShowInternalLogo = true;
            	}
    			
            }
            else {
            	ShowPartnerLogo = false;
            	ShowInternalLogo = true;
            }
            
            //** END CODE FOR DYNAMIC PARTNER QUOTE LOGOS 
            
        
        if(System.currentPageReference().getParameters().get('Id') != null)
        {
            o = [Select Id, Amount, Name, AccountId from Opportunity where Id = :System.currentPageReference().getParameters().get('Id')];  
            //OPPORTUNITY LINE ITEM Select 
            oli = [Select UnitPrice, TotalPrice, Quantity, PricebookEntry.Name, PricebookEntry.Product2Id, ListPrice, Discount__c, Description 
                   From OpportunityLineItem
                   Where OpportunityId = :o.Id]; 
            a = [Select Id, Name, BillingStreet, BillingState, BillingPostalCode, BillingCountry, BillingCity  from Account where Id = :o.AccountId];
            
            
            //Make Quote information;
            makeQuote();
            makeQLine();
            
        }
        
        else if(System.currentPageReference().getParameters().get('qId') != null)
        {
            q = [Select Id, Name, valid_Until__c, Quote_Amount__c, Presented_Date__c, Opportunity__c from SFDC_520_Quote__c where Id = :System.currentPageReference().getParameters().get('qId')];
            o = [Select Id, Amount, Name, AccountId from Opportunity where Id = :q.Opportunity__c]; 
            //OPPORTUNITY LINE ITEM Select 
            oli = [Select UnitPrice, TotalPrice, Quantity, PricebookEntry.Name, PricebookEntry.Product2Id, ListPrice, Discount__c, Description 
                   From OpportunityLineItem
                   Where OpportunityId = :o.Id]; 
            a = [Select Id, Name, BillingStreet, BillingState, BillingPostalCode, BillingCountry, BillingCity  from Account where Id = :o.AccountId];
            
            
            
                                                                   
            
            given = q.Presented_Date__c;
            valid = q.valid_Until__c;
            theQ = q;
            
            qbli = [Select Unit_Price__c, Unit_Net_Price__c, Sales_Discount__c, Quote__c, Qty_Ordered__c, Name, Id, Ext_Price__c, Ext_Net_Price__c, Description__c 
                From SFDC_520_QuoteLine__c 
                where Quote__c = :q.Id]; 
        }   
            
        if(  System.currentPageReference().getParameters().get('a') == 't')
        {
              /* Get the page definition */
              PageReference pdfPage =   Page.Quote;
              pdfPage.getParameters().put('qId',q.Id);              
              /* set the quote id on the page definition */
                    
              /* generate the pdf blob */
              Blob pdfBlob = pdfPage.getContent();
                    
              SFDC_520_Quote__c getThis = [Select Id, Name, Opportunity__c from SFDC_520_Quote__c where Id = :q.Id];
            
                                            
              
              /* create the attachment against the quote */
              Attachment a = new Attachment(parentId = getThis.Opportunity__c, name= getThis.Name +'.pdf', body = pdfBlob);
                    
              /* insert the attachment */
              insert a;
        }
    }
    
    public void makeQuote()
    {
        Date d = Date.today(); 
        given = d;
        valid = d.addDays(30);
        q.Valid_Until__c = valid; 
        q.Quote_Amount__c = 30; // FILL THIS OUT 
        //q.Primary__c = true;
        q.Presented_Date__c = d; 
        q.Opportunity__c = System.currentPageReference().getParameters().get('Id');
        //q.Approval_Stage__c = '';
        insert q;  
        theQ = [select Name from SFDC_520_Quote__c where Id = :q.Id];
    }
    
    public SFDC_520_Quote__c getTheQ(){return theQ;}
    
    public void makeQLine(){
        Double Counter =0; 
        
        for(OpportunityLineItem line: oli)
        { 
            SFDC_520_QuoteLine__c qline = new SFDC_520_QuoteLine__c(); 
            qline.Unit_Price__c = line.ListPrice;
             
        
            //qline.Unit_Net_Price__c = qline.Unit_Price__c - ( line.Discount__c * qline.Unit_Price__c);
            if(line.Discount__c == null || line.Discount__c == 0)
            {
                qline.Sales_Discount__c = 0;    
            }
            else{
                qline.Sales_Discount__c = line.Discount__c;
            } 
            Counter += line.Quantity * (line.ListPrice - (line.ListPrice * (qline.Sales_Discount__c * 0.01)) );
            qline.Quote__c = q.Id;
            qline.Qty_Ordered__c = line.Quantity; 
            qline.Product2__c =  line.PricebookEntry.Product2Id;
            
            //qline.Ext_Price__c =50 // THIS ONE; 
            //qline.Ext_Net_Price__c = qline.Unit_Net_Price__c * line.Quantity;
            qline.Description__c = line.PricebookEntry.Name;                    
        
            
            qli.add(qline);
            
        }
        
        q.Quote_Amount__c = Counter;
        update q; 
        insert qli; 
        
        qbli = [Select Unit_Price__c, Unit_Net_Price__c, Sales_Discount__c, Quote__c, Qty_Ordered__c, Name, Id, Ext_Price__c, Ext_Net_Price__c, Description__c 
                From SFDC_520_QuoteLine__c 
                where Quote__c = :q.Id]; 
    
        
                
    }
    
    public String getGiven()
    {
        return given.Month()+'/'+given.Day()+'/'+given.Year();
    }

    public String getValid()
    {
        return valid.Month()+'/'+valid.Day()+'/'+valid.Year();
    }

}//end Class