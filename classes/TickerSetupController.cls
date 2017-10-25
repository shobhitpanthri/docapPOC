public with sharing class TickerSetupController {
	
	public String background {get;set;}
	public String subject {get;set;}
	public String description {get;set;}
	public List<Ticker_Settings__c> settings;
	
	public TickerSetupController(){
		settings = [SELECT Name,Value__c FROM Ticker_Settings__c];
		if(settings.size() == 0){
			background='#FFFFFF';
			subject='#000000';
			description='#000000';
		}else{
			for(Ticker_Settings__c ts : settings){
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
	
	public PageReference save(){	
		if(settings.size() == 0){
			Ticker_Settings__c subjectColor = new Ticker_Settings__c(Name='Subject Color',Value__c=subject);
			Ticker_Settings__c backgroundColor = new Ticker_Settings__c(Name='Background Color',Value__c=background);
			Ticker_Settings__c descriptionColor = new Ticker_Settings__c(Name='Description Color',Value__c=description);
			List<Ticker_Settings__c> newSettings = new List<Ticker_Settings__c>();
			newSettings.add(subjectColor);
			newSettings.add(backgroundColor);
			newSettings.add(descriptionColor);
			insert newSettings;
			settings = new List<Ticker_Settings__c>();
			settings.add(subjectColor);
			settings.add(backgroundColor);
			settings.add(descriptionColor);
		}else{
			for(Ticker_Settings__c ts : settings){
				if(ts.Name == 'Subject Color'){
					ts.Value__c = subject;
				}
				if(ts.Name == 'Background Color'){
					ts.Value__c = background;
				}
				if(ts.Name == 'Description Color'){
					ts.Value__c = description;
				}
			}
		}
		
		update settings;
		return new PageReference('/apex/TickerDisplay');
		
	}
}