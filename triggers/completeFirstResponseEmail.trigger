trigger completeFirstResponseEmail on EmailMessage (after insert) {
    try{
    String milestoneName = 'First Response';
    // lookup milestone
    MilestoneType mt = [select id from MilestoneType where name=:milestoneName];
    if (mt == null) {return;}

    // collect distinct parent case ids
    Set<Id> caseIds = new Set<Id>();
    for (EmailMessage em : Trigger.new){
        // consider an outbound email to the contact on the case a valid first response
        String firstResponseSubject = 'New Case Confirmation for Case #' + em.Parent.CaseNumber;
 //        if((em.ToAddress == em.Parent.Contact.Email)&&(em.Incoming==false))&&(em.Parent.SlaExitDate==null && em.Parent.SlaStartDate<= System.now()))
        if(em.Incoming==false)
            caseIds.add(em.parentId);
    } // end for
    if (caseIds.isEmpty()==false){
        List<CaseMilestone> cmsToUpdate = [select id from CaseMilestone where caseId in :caseIds and milestoneTypeId=:mt.id and completionDate = null];
        if(cmsToUpdate.isEmpty()==false){
            for (CaseMilestone cm : cmsToUpdate) {
                cm.completionDate = System.now();
            }
            update cmsToUpdate;
        } // end if
    } // end if
 } // end try
 catch (Exception e){

 } // end catch
 finally{
 // Do nothing
 } // end finally
}