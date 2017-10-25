trigger updateNumOpenCases on Case (before delete, before insert, before update) {
	List<Account> accts = [select Id, Open_Caes__c from Account];
	List<Account> acctsToUpdate = new List<Account>();
	
	if(trigger.isDelete){
		for(Case c: trigger.old){
			if(c.AccountId != null && !c.Status.contains('Closed')){
				for(Account a : accts){
					if(a.id == c.AccountId){
						a.Open_Caes__c = a.Open_Caes__c - 1;
						acctsToUpdate.add(a);
					}
				}
			}
		}
	}
	
	if(trigger.isInsert){
		for(Case c: trigger.new){
			if(c.AccountId != null && !c.Status.contains('Closed')){
				for(Account a : accts){
					if(a.id == c.AccountId){
						if(a.Open_Caes__c == null){
							a.Open_Caes__c = 1;
							acctsToUpdate.add(a);
						} else {
							a.Open_Caes__c = a.Open_Caes__c + 1;
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
				if(!c.Status.contains('Closed') && cOLD.Status.contains('Closed')){
					for(Account a : accts){
						if(a.id == c.AccountId){
							if(a.Open_Caes__c == null){
								a.Open_Caes__c = 1;
								acctsToUpdate.add(a);
							} else {
								a.Open_Caes__c = a.Open_Caes__c + 1;
								acctsToUpdate.add(a);
							}
						}
					}
				}
				
				if(c.Status.contains('Closed')){
					for(Account a : accts){
						if(a.id == c.AccountId){
							a.Open_Caes__c = a.Open_Caes__c - 1;
							acctsToUpdate.add(a);
						}
					}
				}
			}
		}
	}
	
	update acctsToUpdate;
}