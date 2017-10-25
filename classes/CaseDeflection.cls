public with sharing class CaseDeflection {
    
    public Contact con  { get; set; }
    public Case c { get; set; }
    public boolean submitted { get; set; }
    public boolean throwError { get; set;}
    
    public CaseDeflection() { 
        c = new Case();
        con = new Contact();
        User u = [select FirstName, LastName, Email, Phone from User where Id =: UserInfo.getUserID() ];
        con.Email__c = u.Email;
        con.First_Name__c = u.FirstName;
        con.Last_name__c = u.LastName;
        con.Phone__c = u.Phone;
        submitted = false;  
        throwError = false;     
    }
    
    public pageReference doSearch() {
        /*This simply refreshes the page*/
        return null;
    }
    
    public pageReference doSubmit() {        
        if(c.subject == null || con.Last_Name__c == null){
            throwError = true;
            return null;
        }
        
        /*con.FirstName = con.First_Name__c;  
        con.Email = con.Email__c;
        con.LastName = con.Last_name__c;
        con.Phone = con.Phone__c;
        insert con;
        c.contactid = con.id;
        
        c.Reason='New Problem';
        c.origin = 'Web';
        c.Status = 'On Hold';   
        insert c;        
        c = [select id, casenumber from Case where id = :c.id];*/
        submitted = true;
        throwError = false;
        
        List<RecordType> myRecType = [select Id from RecordType where Name= '*Technical Issue - Knowledge*']; 
        String recType = '';
        if(myRecType.size() > 0){
        	recType = myRecType[0].Id;
        } else {
        	throwError = true;
        	return null;
        }
        return new PageReference('/500/e?retURL=%2Fapex%2FCaseDeflection&RecordType='+recType+'&ent=Case&cas5='+c.Type); 
    }
    
    /*public pageReference goBackHome(){
        pageReference pr = new PageReference('/'+c.id); 
        return pr;
    }*/
}