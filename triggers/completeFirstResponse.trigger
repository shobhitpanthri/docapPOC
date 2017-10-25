trigger completeFirstResponse on CaseComment (after insert) {
    String milestoneName = 'First Response';
     List<MilestoneType> mst = [select id from MilestoneType where name=:milestoneName];
     MilestoneType mt = new MilestoneType();
     if (mst.isEmpty()) {return;}
     else { mt = mst[0]; }
    
     Set<Id> caseIds = new Set<Id>();
     for (CaseComment cc : Trigger.new){
         Case cTmp = [select id, SlaStartDate, SlaExitDate from case where id = :cc.ParentId limit 1];
        // consider a public comment a valid response
        if((cc.IsPublished == true) && (cTmp.SlaStartDate <= System.now()) && (cTmp.SlaExitDate == null))
                 caseIds.add(cc.parentId);
     }
     
     if (caseIds.isEmpty()==false){
         List<CaseMilestone> cmsToUpdate = [select id from CaseMilestone where caseId in :caseIds and milestoneTypeId=:mt.id and completionDate = null];
         if(cmsToUpdate.isEmpty()==false){
             for (CaseMilestone cm : cmsToUpdate) {
                 cm.completionDate = System.now();
             }
             update cmsToUpdate;
         }
     }
}