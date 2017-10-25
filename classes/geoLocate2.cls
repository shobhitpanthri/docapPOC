public class geoLocate2 {

public Decimal lat{get;set;}
public Decimal lon{get;set;}

public Issue__c thisIssue {get;set;}

    public geoLocate2(ApexPages.StandardController stdController) {
            this.thisIssue = (Issue__c)stdController.getRecord();

    }
    
    public void go(){
  //  if(Apexpages.currentpage().getParameters().get('lonValue') != null){

            thisIssue.Geolocation__longitude__s = Integer.valueOf(ApexPages.currentPage().getParameters().get('lonValue'));
            thisIssue.Geolocation__latitude__s = Integer.valueOf(ApexPages.currentPage().getParameters().get('latValue'));
            
            lat = thisIssue.Geolocation__latitude__s;
            lon = thisIssue.Geolocation__longitude__s;
            
 //       }
    }

}