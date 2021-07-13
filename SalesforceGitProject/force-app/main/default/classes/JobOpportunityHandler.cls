public class JobOpportunityHandler{
    
    public static void activeJob(List<JobOpportunities__c> listofjobs){
        for(JobOpportunities__c objJobs:listofjobs){
            if(objJobs.Active__c){
                objJobs.addError('This Job is active and can not be deleted'); 
            }
        }
    }
    
    public static void checkHiredApplicants(List<JobOpportunities__c> objList)
    {
        for(JobOpportunities__c jobject:objList)
        {
            jobject.Active__c = (jobject.Number_of_Positions__c!=jobject.HiredApplicants__c);
            
        }
    }
    
    public static void ReactivateJob(List<JobOpportunities__c>objList)
    {
        for(JobOpportunities__c jobject:objList)
        {
            jobject.Active__c=(jobject.Number_of_Positions__c>jobject.HiredApplicants__c);        
        }
    }
    
    public static void sendMailToManager(List<JobOpportunities__c> lstofJob)
    {
        set<Id> idContact=new set<Id>();
        List<Messaging.SingleEmailMessage>Mails=new List<Messaging.SingleEmailMessage>();
        for(JobOpportunities__c objofJobs:lstofJob) {
            if(objofJobs.HiredApplicants__c==objofJobs.Number_Of_Positions__c) {
                if(objofJobs.Manager__c !=null)
                {
                    idContact.add(objofJobs.Manager__c);  
                }
            }
        }
               Contact con = [select FirstName,LastName,Email,Name,MobilePhone from Contact where id in :idContact];
              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
              List<String> sendTo= new List<String>();
                 sendTo.add(con.email);
                    mail.setToAddresses(sendTo);
                    mail.setSubject('Hiring Alert');
                    mail.setReplyTo('aishalondhe5@gmail.com');
                    mail.setSenderDisplayName('Aishwarya');
                     string body='Dear' +con.FirstName;
                     mail.setHtmlBody(body);
                    mails.add(mail);
               //List<Contact> con = [select FirstName,LastName,Email,Name,MobilePhone from Contact where id in :idContact];
                  System.debug('con'+con);
                 Messaging.sendEmail(mails);
        
    }
    
    
            
      
    
    
    
    
    
    
}