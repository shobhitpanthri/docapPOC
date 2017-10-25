public class locController {



public String valueLong { get; set; }
public String valueLat { get; set; }
public Issue__c thisIssue {get;set;}

private final SObject parent;

public locController(ApexPages.StandardController stdController) {
    this.thisIssue = (Issue__c)stdController.getRecord();
    thisIssue.Geolocation__longitude__s = Decimal.valueof(valueLong);
    
    
}

public locController() {
}


public PageReference iFoundYou() {
    thisIssue.Geolocation__longitude__s = Decimal.valueof(valueLong);
    thisIssue.Geolocation__latitude__s = Decimal.valueof(valueLat);
    return null;
}

}