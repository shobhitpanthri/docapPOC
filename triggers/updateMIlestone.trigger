trigger updateMIlestone on CaseComment (after insert) {
    String milestoneName = 'First Response';
    MilestoneType mt = [select id from MilestoneType where name=:milestoneName];
    if (mt == null) {return;}
    
    List<CaseMilestone> cms = new List<CaseMilestone>();
    for(CaseComment cc: trigger.new){
        if(cc.isPublished == true){
            CaseMilestone cm = [select Id, isCompleted from CaseMilestone where CaseId =: cc.ParentId and MilestoneTypeId =: mt.id];
            cm.completionDate = cc.CreatedDate;
            cms.add(cm);
        }
    }
    
    update cms;
}