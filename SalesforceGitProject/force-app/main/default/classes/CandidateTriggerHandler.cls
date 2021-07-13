public class CandidateTriggerHandler {
    
    public static void checkExpectedSalary(List<CandidatePortal__c> lstCandidate){
        for(CandidatePortal__c objCandidate:lstCandidate){
            if(objCandidate.ExpectedSalary__c == null){
                objCandidate.addError('Please fill Expected Salary field'); 
            }
        }
    } 
    public static void checkActive(List<CandidatePortal__c>lst)
    {
        set<Id>jobid = new Set<Id>();
        for(CandidatePortal__c objCandidate:lst) {
            if(objCandidate.Job__c!=null){
                jobid.add(objCandidate.Job__c);  
            }
        }
        Map<Id,JobOpportunities__c>notActive=new Map<Id,JobOpportunities__c>([select id,Active__c from JobOpportunities__c where Id IN:jobid AND Active__c=false]);
        for(CandidatePortal__c objCandi:lst) {
            if(notActive.get(objCandi.Job__c)!=null){
                objCandi.addError('This is not active job please cannot apply');
            }
        }
    }
    
   public static void ChangeApplicationDate(List<CandidatePortal__c> lstCandidate) {
        
           /* for(CandidatePortal__c cpObj:lstCandidate){
        
        if(trigger.isupdate){
       CandidatePortal__c objCandidate = new CandidatePortal__c();
        objCandidate = trigger.newMap.get(objCandidate.id); // trigger old map to get old value(existing value) of the record 
        
        if(objCandidate.ApplicationDate__c !=cpObj.System.Date()){
            
           cpObj.ApplicationDate__c = system.Date();
           
           //System.debut();
                   }
                }     
            }*/
   }
}