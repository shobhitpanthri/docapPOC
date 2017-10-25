trigger escalateCase on FeedItem (after insert) {
    String caseKeyPrefix = Case.sObjectType.getDescribe().getKeyPrefix();
    List<Case> myCases = new List<Case>();
    List<CaseComment> myComments = new List<CaseComment>();
    List<EntitySubscription> myFollowers = new List<EntitySubscription>();

    Boolean flag = false;
    
    for(FeedItem fi: trigger.new){
        String sId = String.valueOf(fi.parentId);

        if(sId.startsWith(caseKeyPrefix)){
            if((fi.Body != null) && (fi.Body.contains('!escalate')||fi.body.contains('!Escalate'))){
                Case c = [select Status, Id, isEscalated from Case where Id =: fi.ParentId];
                c.Status = 'Escalated';
                c.isEscalated = true;
                myCases.add(c);
                
                CaseComment cprivate = new CaseComment();
                cprivate.commentBody = 'Internal Escalation Notice: Case escalated to Tier 2 for immediate attention. Please update case with notes and related Knowledge Articles and communicate to customer as needed';
                cprivate.ParentId = c.Id;
                cprivate.CreatedById = fi.CreatedById;
                myComments.add(cprivate);
                
                CaseComment cpublic = new CaseComment();
                cpublic.commentBody = 'Case Update: Case has been escalated to our Tier 2 Team and you should be contacted shortly. Thank you for your patience.';
                cpublic.ParentId = c.Id;
                cpublic.CreatedById = fi.CreatedById;
                cpublic.IsPublished = true;
                myComments.add(cpublic);
                
                EntitySubscription es = new EntitySubscription();
                es.ParentId = c.Id;
                es.SubscriberId = fi.CreatedById;
                myFollowers.add(es);
                
                flag = true;
            }
        }
    }
    
    if(flag == true){
        update myCases;
        insert myComments;
        insert myFollowers;
    }
}