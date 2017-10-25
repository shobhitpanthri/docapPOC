public class CTIAnywhereExtension {


    public String getPopUrl() {
        String popUrl;        
        popUrl = CTIAnywhere__c.getInstance().PopRecordId__c;     
        return popUrl;
    }
    
    
    @isTest
    private static void mockTest() {
        CTIAnywhereExtension thisClass = new CTIAnywhereExtension();
        thisClass.getPopUrl();
    }

}