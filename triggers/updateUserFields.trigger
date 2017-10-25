trigger updateUserFields on Opportunity (before insert, before update) {

	Opportunity updateOpp = trigger.new[0];
	User thisUser = [select Id, Territory__c from User where Id = :updateOpp.OwnerId];
	
	updateOpp.Territory__c = thisUser.Territory__c;

}