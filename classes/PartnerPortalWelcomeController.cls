public class PartnerPortalWelcomeController {

    // start channel manager welcome code provided by will moxley
    // taken from master prm demo org
    User PartnerUser; 

    public User getPartnerUser() {
         if(PartnerUser==null)
         {
             PartnerUser= [select u.Contact.AccountId,u.Contact.Account.Owner.Name,u.Contact.Account.Owner.Email from User u where u.id= :UserInfo.getUserId() limit 1];
         }
             
         return PartnerUser;
    }
    // end channel manager welcome code
    
    public List<Opportunity> olist {get;set;}
    public String opptyPie {get;set;}
    public String mapURL1{get;set;} 
    public String mapURL2{get;set;}
    public String mapURL3{get;set;}
    
    public List<Lead> lList {get;set;}
    public String leadURL {get;set;}
    
    
    public String UserId = UserInfo.getUserId();
    public String UserName = UserInfo.getName();
    User u = [Select id,contactId,Contact.AccountId from User where id = :UserId];
    public String acctId = u.Contact.AccountId;
    
    // constructor initializes page and determines whether to show datatable or error message
    public PartnerPortalWelcomeController() {
        
        olist = [Select Id, Amount, StageName, Owner.AccountId, IsClosed From Opportunity Where Owner.AccountId = :acctId];
        Decimal pipeline = 0;
        Decimal closedval = 0;
        Decimal lostval = 0;
        Integer closecount = 0;
        Integer Highcount = 0;
        Integer Criticalcount = 0;
        Integer Mediumcount = 0;
        Integer Lowcount = 0;
        Integer casecount = 0;
        Integer tnumber = 1;
        Integer leadcount =0;
        Decimal qualification=0;
        Decimal needsanalysis=0;
        Decimal iddecisionmakers=0;
        Decimal proposalpricequote=0;
        Decimal negotiationreview=0;
        Decimal oppTotal=0;
                
        
        String pString = '$'+pipeline.format();
        String cString = '$'+closedval.format();

        
        llist = [Select Id, OwnerId, IsConverted From Lead Where OwnerId = :UserId AND IsConverted=false];
        
        //ccList = [Select Id, IsClosed, Priority, AccountId From Case Where AccountId =:acctId AND IsClosed = true];
        if(olist.size()>0){
        for(Opportunity opp :olist){
            oppTotal += opp.Amount;
            
            if(opp.isClosed ==false){
                pipeline += opp.Amount;
            }
            if(opp.StageName =='Closed Lost'){
                lostval += opp.Amount;  
            }
            if(opp.isClosed == true){
                closedval += opp.Amount;
            }
            if(opp.StageName=='Qualification'){
                qualification += opp.Amount;
            }
            if(opp.StageName=='Needs Analysis'){
                needsanalysis += opp.Amount;
            }
            if(opp.StageName=='Id. Decision Makers'){
                iddecisionmakers += opp.Amount;
            }
            if(opp.StageName=='Proposal/Price Quote'){
                proposalpricequote +=opp.Amount;
            }
            if(opp.StageName=='Negotiation/Review'){
                negotiationreview += opp.Amount;
            }
        }}else{
            oppTotal = 50000;
            pipeline = 10000;
            closedval = 30000;
            lostval = 10000;
            qualification=4000;
            needsanalysis=2000;
            iddecisionmakers=1000;
            proposalpricequote=1000;
            negotiationreview=2000;
        }
        
        Decimal q = (qualification/oppTotal)*100;
        Decimal needs = (needsanalysis/oppTotal)*100;
        Decimal id = (iddecisionmakers/oppTotal)*100;
        Decimal prop = (proposalpricequote/oppTotal)*100;
        Decimal neg = (negotiationreview/oppTotal)*100;
        Decimal won = (closedval/oppTotal)*100;
        Decimal lost = (lostval/oppTotal)*100;
        
        leadcount = llist.size();
        
        //system.assert(false, Highcount);
        
        Decimal totalPipe = (pipeline*.0001)*2; 
        mapURL1 = 'http://chart.apis.google.com/chart?chxl=1:|%240|%24250k|%24500k&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=Partner+Pipeline&chco=000000,FF0000|FFFF1F|00AA00&chl=$'+pipeline.format()+'&chd=t:'+totalPipe;
    
        Decimal totallost = (lostval*.0001)*2;
        mapURL2 = 'http://chart.apis.google.com/chart?chxl=1:|%240|%24250k|%24500k&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=Closed+Lost&chco=000000,00AA00|FFFF1F|FF0000&chl=$'+lostval+'&chd=t:'+totallost;
        
        Decimal totalclosed = (closedval*.0001)*2;
        mapURL3 = 'http://chart.apis.google.com/chart?chxl=1:|%240|%24250k|%24500k&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=Closed+Won&chco=000000,FF0000|FFFF1F|00AA00&chl=$'+closedval.format()+'&chd=t:'+totalclosed;
        
        
        opptyPie = 'http://chart.apis.google.com/chart?chs=300x225&chxt=x,y&chd=t:'+qualification+','+needsanalysis+','+iddecisionmakers+','+proposalpricequote+','+negotiationreview+','+closedval+','+lostval+
        '&chxr=0,0,10000&chxl=0:|1|2|3|4|5|6|7&chdl=1+Qualification|2+Needs+Analysis|3+Id+Decision+Makers|4+Proposal|5+Negotiation|6+Closed+Won|7+Closed+Lost&chtt=Opportunities+by+Stage&chxs=0,676767,11.5,-0.167,l,676767cht=bhs&chco=008000&';
        
        /*http://chart.apis.google.com/chart?chxr=0,0,10000&chxs=0,676767,11.5,-0.167,l,676767&chxt=x,y&chs=300x150&cht=bhs&chco=008000&chd=s:QdoW*/
        
        leadURL = 'http://chart.apis.google.com/chart?chxl=1:|0|10|20&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=My+Leads&chds=0,20&chco=000000,FF0000|FFFF1F|00AA00&chl='+leadcount+'&chd=t:'+leadcount;     
    
        
        // * start init functions for partner stats
        // comment out line below if you don't want to show expiring deal reg partner stat in left sidebar
        initExpiringDealRegs();
        
        // comment out line below if you don't want to show active leads partner stat in left sidebar
        initActiveLeads();
        // * end init functions for partner stats
        
        // comment out line below if you don't want to show lead inbox
        initLeadInbox();
        
        // comment out line below if you don't want to show approval requests
        initApprovalRequests();
        
        // comment out line below if you don't want to show popular solutions
        initTopSolutions();
        
        // comment out line below if you don't want to show ideas
        initPopularIdeas();
        
    }
    
    // *** START APEX CODE TO RETRIEVE PARTNER STATS.
    // comment out this section if you don't want to show partner stats
    
    
    // * START CODE FOR EXPIRING DEAL REGS STAT
    
    public Integer ExpiringRegs;
    public RecordType PartnerOpportunityRecordType;
    // --> The next line is org specific
    // You MUST configure the RecordTypeId and LeadSource in the SOQL query below to map to the proper Deal Registration RecordType Id and Lead Source in your org
    public void initExpiringDealRegs() {
        
        PartnerOpportunityRecordType = [Select Id From RecordType where Name like 'Indirect (Partner)'];
        
        if(PartnerOpportunityRecordType != null){
            ExpiringRegs = [Select count()from Opportunity where LeadSource='Deal Registration' AND RecordTypeId=:PartnerOpportunityRecordType.Id AND ownerid=:UserId AND IsClosed = False];
        }
    }
    
    public Integer getExpiringDealRegs() {
        return ExpiringRegs;
    }
    
    // * END CODE FOR EXPIRING DEAL REGS STAT
    
    
    // * START CODE FOR ACTIVE LEADS STAT
    
    public Integer ActiveLeads;
    public void initActiveLeads() {
        ActiveLeads = [Select count()from Lead where IsConverted=FALSE AND ownerid=:UserId];
    }
    
    public Integer getActiveLeads() {
        return ActiveLeads;
    }
    
    // * END CODE FOR ACTIVE LEADS STAT
    
    // *** END APEX CODE TO RETRIEVE PARTNER STATS
    
    
    
    // *** START APEX CODE TO RETRIEVE LEAD INBOX.
    // comment out this section if you don't want to show lead inbox
    
    ID LeadId;
    
    public void setLeadId(ID value){
        LeadId = value;
    }
    public ID getLeadId(){
        return LeadId;
    }


    Boolean Redirect = false;
    
    Public PageReference AcceptLead() {
        
        LeadId = System.currentPageReference().getParameters().get('LeadId');
        
        Lead l = [Select id from Lead where id = :LeadId limit 1];
        
        l.OwnerId = UserId;
        update l;  
        
        Redirect = True;
        
        PageReference page = new PageReference('/apex/PartnerPortalWelcome');
        page.getParameters().put('lead_id',l.Id);
        
        page.setRedirect(true);
        return page;
    }
    
    public void setRedirect(Boolean value) {
        Redirect = value;
    }
 
    public Boolean getRedirect() {
        return Redirect;
    }


    public List<Lead> LeadInbox; 
    
    public Boolean ShowLeadInbox {
        get { return ShowLeadInbox; }
        set { ShowLeadInbox = value; }   
    }
    
    public String LeadInboxMessage {
        get { return LeadInboxMessage; }
        set { LeadInboxMessage = value; }    
    }
    
    public void initLeadInbox() {
        
        LeadInbox = [select Id, Name, Title, City, Company, toLabel(Industry), CreatedDate, IsConverted, IsUnreadByOwner, OwnerId, Owner.Type, LeadSource, ConvertedOpportunityId, ConvertedOpportunity.Name from Lead Where IsConverted=false and Owner.Type='Queue' order by CreatedDate desc limit 5];
    
        // return an error if no leads in queues.
       if(LeadInbox.isEmpty()){
           ShowLeadInbox = false;
           LeadInboxMessage = 'No leads in queues found.';
       }
       else{
           ShowLeadInbox = true;
           LeadInboxMessage = '';
       }
    }
    
    public list<Lead> getLeadInbox() {
        return LeadInbox;
    }
    // *** END APEX CODE TO RETRIEVE LEAD INBOX
    
    
    // comment out this section if you don't want to show approval requests
    // wrapper class to store Approval Requests in a generic SObject instead of an ProcessInstanceStep SObject so we can show it in the portal
    public class ApprovalRequests {
        
        public ProcessInstanceStep pi {
            get { return pi; }
            set { pi = value; }
        }
        
        
        public String TargetObjectName {
            get { return TargetObjectName; }
            set { TargetObjectName = value; }
        }
        
        public String TargetObjectType {
            get { return TargetObjectType; }
            set { TargetObjectType = value; }
        }
        
        public String SubmittedDate {
            get { return SubmittedDate; }
            set { SubmittedDate = value; }
        }
        
        // constructor for AccountTeam SObject
        public ApprovalRequests(ProcessInstanceStep p){
            pi = p;
            TargetObjectName = pi.ProcessInstance.TargetObject.Name;
            TargetObjectType = pi.ProcessInstance.TargetObject.Type;
            
            // convert the Submitted Date to a more readable format
            Datetime Temp = Datetime.newInstance(pi.CreatedDate.year(), pi.CreatedDate.month(), pi.CreatedDate.day());
            SubmittedDate = Temp.format('MMMM dd, yyyy');           
            
        }
        
        
    }
    
    List<ProcessInstanceStep> Requests = new List<ProcessInstanceStep>();
    List<ApprovalRequests> ApprovalRequests = new List<ApprovalRequests>();
    
    public Boolean ShowApprovalRequests {
        get { return ShowApprovalRequests; }
        set { ShowApprovalRequests = value; }   
    }
    
    public String ApprovalRequestsMessage {
        get { return ApprovalRequestsMessage; }
        set { ApprovalRequestsMessage = value; }    
    }
    
    public void initApprovalRequests() {
        
        // get list of approval requests
        requests = [SELECT Id, ProcessInstance.TargetObject.Name, ProcessInstance.TargetObject.Type, ProcessInstance.Status, CreatedDate, ProcessInstance.Id, ProcessInstance.TargetObjectId FROM ProcessInstanceStep WHERE (StepStatus = 'Started') AND (ActorId=:UserId) AND (ProcessInstance.TargetObject.Name != '') ORDER BY CreatedDate DESC LIMIT 5];
        
    
        // assemble approval requests in generic sobject ApprovalRequests
        for(ProcessInstanceStep Request : Requests){
            ApprovalRequests ar = new ApprovalRequests(Request);
            ApprovalRequests.add(ar);   
        }
    
        // return an error if no approval requests.
       if(ApprovalRequests.isEmpty()){
           ShowApprovalRequests = false;
           ApprovalRequestsMessage = 'No approval requests found.';
       }
       else{
           ShowApprovalRequests = true;
           ApprovalRequestsMessage = '';
       }
    }
    
    public list<ApprovalRequests> getApprovalRequests() {
        return ApprovalRequests;
    }
    // *** END APEX CODE TO RETRIEVE APPROVAL REQUESTS
    
    
    // *** START APEX CODE TO RETRIEVE TOP SOLUTIONS.
    // comment out this section if you don't want to show top solutions
    public List<Solution> TopSolutions; 
    
    public Boolean ShowTopSolutions {
        get { return ShowTopSolutions; }
        set { ShowTopSolutions = value; }   
    }
    
    public String TopSolutionsMessage {
        get { return TopSolutionsMessage; }
        set { TopSolutionsMessage = value; }    
    }
    
    public void initTopSolutions() {
    
        TopSolutions = [select id,SolutionName,TimesUsed,LastModifiedDate from Solution order by TimesUsed desc limit 3];
    
        // return an error if no solutions.
       if(TopSolutions.isEmpty()){
           ShowTopSolutions = false;
           TopSolutionsMessage = 'No solutions found.';
       }
       else{
           ShowTopSolutions = true;
           TopSolutionsMessage = '';
       }
    }
    
    public list<Solution> getTopSolutions() {
        return TopSolutions;
    }
    // *** END APEX CODE TO RETRIEVE TOP SOLUTIONS

    
    // *** START APEX CODE TO RETRIEVE IDEAS
    // comment out this section if you don't want to show ideas
    public List<Idea> PopularIdeas; 
    
    public Boolean ShowPopularIdeas {
        get { return ShowPopularIdeas; }
        set { ShowPopularIdeas = value; }   
    }
    
    public String PopularIdeasMessage {
        get { return PopularIdeasMessage; }
        set { PopularIdeasMessage = value; }    
    }
    
    public void initPopularIdeas() {
    
        PopularIdeas = [select id,Title,Category,VoteTotal from Idea order by VoteTotal desc limit 3];
    
        // return an error if no ideas.
       if(PopularIdeas.isEmpty()){
           ShowPopularIdeas = false;
           PopularIdeasMessage = 'No ideas found.';
       }
       else{
           ShowPopularIdeas = true;
           PopularIdeasMessage = '';
       }
    }
    
    public list<Idea> getPopularIdeas() {
        return PopularIdeas;
    }
    // *** END APEX CODE TO RETRIEVE IDEAS

}