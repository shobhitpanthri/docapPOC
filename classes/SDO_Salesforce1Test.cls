@isTest
private class SDO_Salesforce1Test {
    
    static testMethod void loginS1(){
        User u = [Select Name, Username From User Where Id=:UserInfo.getUserId()];
        ApexPages.currentPage().getParameters().put('name',u.Name);
        
        SDO_Salesforce1 sdo = new SDO_Salesforce1();
        sdo.loginS1();
        
    }
    
}