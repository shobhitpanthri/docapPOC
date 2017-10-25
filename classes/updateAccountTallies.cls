public with sharing class updateAccountTallies {
	public pageReference myMethod(){
		List<Account> acctsEsc= [select id, of_escalated_cases__c, (select id from Cases where status = 'Escalated') from Account];
		for(Account a : acctsEsc){
			a.of_escalated_cases__c = a.Cases.size();
		}
		update acctsEsc;
		
		List<Account> acctsOpen= [select id, Open_Caes__c, (select id from Cases where status != 'Closed in Portal' and status != 'Closed - First Call' and status != 'Closed') from Account];
		for(Account a : acctsOpen){
			a.Open_Caes__c = a.Cases.size();
		}
		update acctsOpen; 
		return new PageReference('/0013000000ZsR1W?macRedirectFlag=1&macRecordId=0013000000ZsR1W&macRecordName=United%20Partners*&macSearchString=united%20par&macPosition=3&macSearchArea=header&');
	} 
}