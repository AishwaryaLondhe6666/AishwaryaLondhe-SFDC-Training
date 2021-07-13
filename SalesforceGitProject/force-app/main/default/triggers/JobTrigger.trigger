trigger JobTrigger on JobOpportunities__c (before insert,before delete,before update) {
    
    /* if(Trigger.isBefore && (Trigger.isInsert||Trigger.isUpdate||Trigger.isDelete)||Trigger.isUndelete){
System.debug('Before Trigger');
System.debug('Trigger.old'+Trigger.old);
System.debug('Trigger.oldMap'+Trigger.oldMap);
System.debug('Trigger.new'+Trigger.new);
System.debug('Trigger.newMap'+Trigger.newMap);
}
else if(Trigger.isAfter && (Trigger.isInsert ||Trigger.isUpdate||Trigger.isDelete||Trigger.isUndelete)){

System.debug('---After Trigger');
System.debug('Trigger.old'+Trigger.old);
System.debug('Trigger.oldMap'+Trigger.oldMap);
System.debug('Trigger.new'+Trigger.new);
System.debug('Trigger.newMap'+Trigger.newMap);
} */
    if(trigger.isDelete && Trigger.isBefore) {
        JobOpportunityHandler.activeJob(Trigger.old);  
    }
    
    if(trigger.isBefore && (Trigger.isUpdate ||Trigger.isInsert)) {
        System.debug('Trigger.new'+Trigger.new);
        System.debug('Trigger.old'+Trigger.old);
        JobOpportunityHandler.checkHiredApplicants(Trigger.new);
        }
    
    if(Trigger.isInsert || Trigger.isUpdate) {
        if(Trigger.isBefore){
            JobOpportunityHandler.ReactivateJob(Trigger.new);
        }
    }
    
    if(Trigger.isInsert && Trigger.isAfter) {
        JobOpportunityHandler.sendMailToManager(Trigger.new);   
    }
}