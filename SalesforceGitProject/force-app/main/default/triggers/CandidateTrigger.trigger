trigger CandidateTrigger on CandidatePortal__c (before insert,before update,before delete,after insert,after update) {
    
    /* Map<String,TriggerActiveInactive__c>TestActive=TriggerActiveInactive__c.getAll();
if(TestActive.size()>0 && TestActive.get('MakeActive').isActive__c)
return;*/
    
    if(trigger.isBefore && (Trigger.isUpdate ||Trigger.isInsert)) {
        CandidateTriggerHandler.checkExpectedSalary(Trigger.new);
        System.debug('Before insert');
        System.debug('Trigger.net'+Trigger.new);
        
    }
    
    if(Trigger.isBefore && Trigger.isUpdate) {
        CandidateTriggerHandler.checkActive(Trigger.new);   
        System.debug('before update');
        System.debug('Trigger.new'+Trigger.new);
    } 
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        CandidateTriggerHandler.ChangeApplicationDate(Trigger.new);
        System.debug('Trigger.new'+Trigger.new);
    }
    
}