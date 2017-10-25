trigger updateNumOfEscalatedCases on Case (after delete, after insert, after update) {
//List<Account> accts = [select Id, of_Escalated_Cases__c from Account];
	List<String> aids = new list<string>();
	List<Account> accts  = [select Id, of_Escalated_Cases__c from Account];
	List<Account> acctsToUpdate = new List<Account>();
	
	if(trigger.isDelete){
		for(Case c: trigger.old){
			if(c.AccountId != null && c.Status == 'Escalated'){
				for(Account a : accts){
					if(a.id == c.AccountId){
						a.of_Escalated_Cases__c = a.of_Escalated_Cases__c - 1;
						acctsToUpdate.add(a); 
					}
				}
			}
		}
		update acctsToUpdate; 
	} 
	
	if(!trigger.isDelete){
		for(Case c : trigger.new)
		{
			if(c.accountID != null)
				aids.add(c.accountID);
		}
		
		accts.clear();
		accts= [select id, of_escalated_cases__c, (select id from Cases where status = 'Escalated') from Account where id in :aids];
		
		for(Account a : accts)
		{
			a.of_escalated_cases__c = a.Cases.size();
		}
		
		update accts;
	}
	
	
	
	
	/*if(trigger.isInsert){
		for(Case c: trigger.new){
			if(c.AccountId != null && c.Status == 'Escalated'){
				for(Account a : accts){
					if(a.id == c.AccountId){
						if(a.of_Escalated_Cases__c == null){
							a.of_Escalated_Cases__c = 1;
							acctsToUpdate.add(a);
						} else {
							a.of_Escalated_Cases__c = a.of_Escalated_Cases__c + 1;
							acctsToUpdate.add(a);
						}
					}
				}
			}
		}
	}
	
	if(trigger.isUpdate){
		for(Case c: trigger.new){
			Case cOLD = trigger.oldmap.get(c.id);
			if(c.Status != cOLD.Status && c.AccountId != null){
				if(c.Status == 'Escalated' && cOLD.Status != 'Escalated'){
					//system.assert(false, accts);
					for(Account a : accts){
						if(a.id == c.AccountId){
							if(a.of_Escalated_Cases__c == null){
								a.of_Escalated_Cases__c = 1;
								acctsToUpdate.add(a);
							} else {
								a.of_Escalated_Cases__c++;
								acctsToUpdate.add(a);
							}
						}
					}
				}
				
				if(c.Status != 'Escalated' && cOLD.Status == 'Escalated'){
					for(Account a : accts){
						if(a.id == c.AccountId){
							a.of_Escalated_Cases__c = a.of_Escalated_Cases__c - 1;
							acctsToUpdate.add(a);
						}
					}
				}
			}
		}
	}
	
	update acctsToUpdate;
	*/
}