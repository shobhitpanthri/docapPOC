trigger updateTitle on Interview__c (before insert, before update) {
            Interview__c[] interviews = Trigger.new;
            Interview__c thisInterview = interviews.get(0);
            
            thisInterview.title__c = thisInterview.Interview_Time__c.format('h:mma').toLowerCase() + ' - ' + thisInterview.Interview_Time__c.addMinutes(Integer.valueOf(thisInterview.Scheduled_Window__c)).format('h:mma').toLowerCase();

}