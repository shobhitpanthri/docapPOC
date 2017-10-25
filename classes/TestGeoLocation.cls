@isTest
private class TestGeoLocation {

    static testMethod void myUnitTest() {
        locController c = new locController();
        c.valueLong = '100';
        c.valueLat = '100';
        c.thisIssue = new Issue__c();
       
        c.iFoundYou();
       
     //   System.assert(interview.Title__c != '');
    }

}