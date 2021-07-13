@isTest
public class CandidateTestClass {
    
    @testSetup
    static void commonData() {
        Contact contact=new Contact(Lastname='Londhe');
        insert contact;
        
        List<JobOpportunities__c> lstJob=new  List<JobOpportunities__c>();
        lstJob.add(new JobOpportunities__c(Job_Title__c='Developer', Active__c=false, Number_of_Positions__c=5, Manager__c=contact.Id));
        lstJob.add(new JobOpportunities__c(Job_Title__c='Admin', Active__c=true, Number_of_Positions__c=8, Manager__c=contact.Id));
        Database.insert(lstJob,false);
        //Database.insert(lstJob);
        
        List<CandidatePortal__c> lstCandidate= new  List<CandidatePortal__c>();
        lstCandidate.add(new CandidatePortal__c(FirstName__c='gkk', LastName__c='Mohan',Country__c='India', States__c='Maharashtra',ApplicationDate__c=Date.today().addDays(-6),Status__c='Hired', Email__c='dhk@gmail.com',
                                                ExpectedSalary__c=null, Job__c=lstJob[0].Id));
        
        lstCandidate.add(new CandidatePortal__c(FirstName__c='vidhi', LastName__c='patel',Country__c='India', States__c='Maharashtra', ApplicationDate__c=Date.today().addDays(-6), Status__c='Applied', Email__c='actc@gmail.com',
                                                ExpectedSalary__c=8000, Job__c=lstJob[1].Id));
        Database.insert(lstCandidate, false);
        
        
        
    }
    
    
    static testMethod void ExpectedSalary() {
        
        List<JobOpportunities__c> lstJob=[SELECT Id FROM JobOpportunities__c];
        List<CandidatePortal__c> lstCandidate=new List<CandidatePortal__c>();
        
        lstCandidate.add(new CandidatePortal__c(FirstName__c='mitali', LastName__c='shukla',Country__c='India',States__c='Maharashtra',ApplicationDate__c=Date.today().addDays(-6), Status__c='Applied', Email__c='mitali@gmail.com',   
                                                ExpectedSalary__c=null, Job__c=lstJob[0].Id));
        lstCandidate.add(new CandidatePortal__c(FirstName__c='sidharth', LastName__c='chande',Country__c='India',States__c='Maharashtra', ApplicationDate__c=Date.today().addDays(-6), Status__c='Hired', Email__c='sidharth@gmail.com',
                                                ExpectedSalary__c=6000, Job__c=lstJob[1].Id));
        /* lstCandidate.add(new CandidatePortal__c(FirstName__c='sidharth', LastName__c='chande',Country__c='India',States__c='Maharashtra', ApplicationDate__c=Date.today().addDays(-6), Status__c='Hired', Email__c='sidharth@gmail.com',
ExpectedSalary__c=null, Job__c=lstJob[1].Id));*/
        
        //Database.SaveResult[] result=Database.insert(lstcandidate);
        Database.SaveResult[] result = Database.insert(lstCandidate, false);
        Database.SaveResult[] result2 = Database.update(lstCandidate, false);
        //System.assertEquals(true, result[0].isSuccess());
        System.assertEquals(false, result[0].isSuccess());
        System.assertEquals(false, result[1].isSuccess());
        //  
        //   Database.SaveResult[] result = Database.insert(lstCandidate, false);
        // Database.SaveResult[] result2 = Database.update(lstCandidate, false);
        //  Database.SaveResult[] result2=Database.Update(lstCandidate);
        //  insert lstCandidate;
        // update lstCandidate;
        
        for(Database.SaveResult objResult:result){
            if(objResult.isSuccess()){
                System.debug('Record id'+result[0].getId());
                //System.debug('Record id'+result2[0].getId());
            }
            else{
                System.debug('Errors are:'+result[0].getErrors());
                // System.debug('Errors are:'+result2[0].getErrors());
            }
        }
    } 
    
    public static void checkActiveMethod(){
        Contact con=new Contact(Lastname='Londhe');
        insert con;
        List<JobOpportunities__c> objJob=[Select Active__c, Id From JobOpportunities__c];
        
        /* CandidatePortal__c candidate=new CandidatePortal__c(FirstName__c='Gaurav', LastName__c='shukla',Country__c='India',States__c='Gurjrat',ApplicationDate__c=Date.today().addDays(-6), Status__c='Applied', Email__c='mitali@gmail.com',   
ExpectedSalary__c=50, Job__c=objJob[0].Id);*/
        
        
        CandidatePortal__c candidate=new CandidatePortal__c(FirstName__c='Gaurav', LastName__c='shukla',Country__c='India',States__c='Gurjrat',ApplicationDate__c=Date.today().addDays(-6), Status__c='Applied', Email__c='mitali@gmail.com',   
                                                            ExpectedSalary__c=50, Job__c=objJob[0].Id);
        
        
        /*List<CandidatePortal__c> candidateObj=new List<CandidatePortal__c>();

candidateObj.add(new CandidatePortal__c(FirstName__c='mitali', LastName__c='shukla',Country__c='India',States__c='Maharashtra',ApplicationDate__c=Date.today().addDays(-6), Status__c='Applied', Email__c='mitali@gmail.com',   
ExpectedSalary__c=null, Job__c=objJob[0].Id));
candidateObj.add(new CandidatePortal__c(FirstName__c='mitali', LastName__c='shukla',Country__c='India',States__c='Maharashtra',ApplicationDate__c=Date.today().addDays(-6), Status__c='Applied', Email__c='mitali@gmail.com',   
ExpectedSalary__c=null, Job__c=objJob[0].Id));*/
        
        Database.SaveResult result3 = Database.insert(candidate, false);
        // Database.SaveResult[] result3 = Database.insert(candidateObj, false);
        // Database.SaveResult result4 = Database.update(candidate, false);
        //System.assertEquals(false, result3[0].isSuccess());
        System.assertEquals(false, result3.isSuccess());
        
        /* for(Database.SaveResult objResult:result3){
if(objResult.isSuccess()){
System.debug('Record id'+objResult[0].getId());
}
else{
System.debug('Errors are:'+objResult.getErrors());
}
}*/
        
        
    }
}