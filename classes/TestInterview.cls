@isTest
private class TestInterview {

    static testMethod void myUnitTest() {
        Candidate__c c = new Candidate__c(Name = 'Test', Email__c = 'test@gmail.com');
        Insert c;
        Position__c p = new Position__c(Name = 'Test', Min_Pay__c = 100, Max_Pay__c = 1000);
        Insert p;
        Interview__c interview = new Interview__c(Candidate__c = c.id, Position__c = p.id, Interview_Time__c = DateTime.now(), Scheduled_Window__c = 30);
        insert interview;
       
        System.assert(interview.Title__c != '');
    }

}