public with sharing class TickerDisplayController {
	
	public List<Ticker_Item__c> tickerItems {get;set;}
	public String background {get;set;}
	public String subject {get;set;}
	public String description {get;set;}
	
	public TickerDisplayController() {
		tickerItems = [SELECT Id, Subject__c, Description__c,URL__c FROM Ticker_Item__c];	
		List<Ticker_Settings__c > tickersettings = [SELECT Name, Value__c FROM Ticker_Settings__c];
		
		for(Ticker_Settings__c ts : tickersettings){
			if(ts.Name == 'Subject Color'){
				subject = ts.Value__c;
			}
			if(ts.Name == 'Background Color'){
				background = ts.Value__c;
			}
			if(ts.Name == 'Description Color'){
				description = ts.Value__c;
			}
		}
		
	}

}