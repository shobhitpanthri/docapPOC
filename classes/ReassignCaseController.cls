public with sharing class ReassignCaseController {
  
  
  Id currentId;
  public Case currentCase {get;set;}
  public List<QueueSobject> queues {get;set;}
  public Map<String,Id> queueMap = new Map<String,Id>();
  
  public ReassignCaseController(ApexPages.StandardController controller){
    currentId = controller.getId();
    currentCase = [SELECT Id,Priority,Type FROM Case WHERE Id = :currentId];
    queues = [SELECT Id, Queue.Name,QueueId, SobjectType FROM QueueSobject];
    
    for(QueueSobject q : queues){
      queueMap.put(q.Queue.Name,q.QueueId);
    }
    
  }
  
  
  public PageReference autoRun(){
    if((currentCase.Priority == 'Medium' || currentCase.Priority == 'Low') && (currentCase.Type=='Technical Issue' || currentCase.Type=='Feature Request')){
      currentCase.ownerId = queueMap.get('Product Management');
    } else if((currentCase.Priority == 'Medium' || currentCase.Priority == 'Low') && (currentCase.Type=='Usage' || currentCase.Type=='Documentation' || currentCase.Type=='Question')){
      currentCase.ownerId = queueMap.get('General Queue');
    } else if (currentCase.Priority == 'High' || currentCase.Priority == 'Critical'){
      currentCase.ownerId = queueMap.get('Tier 2 Escalation Queue');
    }
    
    update currentCase;
    return new PageReference('/'+currentId);
  }
}