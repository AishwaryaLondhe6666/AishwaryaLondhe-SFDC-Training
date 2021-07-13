@isTest
public class SampleTestClass {
    
      @testSetup
    static void dataforMethods()
    {
            List<CandidatePortal__c>candidateObj=new List<CandidatePortal__c>();
            for(Integer i=0;i<20;i++)
            {
         candidateobj.add(new CandidatePortal__c(FirstName__c='ak'+i, LastName__c='Mohan'+i,Country__c='India'+i, States__c='Maharashtra'+i,Status__c='Hired', Email__c='ak@gmail.com'+i,
                                                ExpectedSalary__c=50+i, Job__c=candidateObj[i].Id));
                
            }
        insert candidateobj;
    }
    
    
      @isTest
    Static void testMethod1(){
         List<CandidatePortal__c> lstJob=[SELECT Id FROM CandidatePortal__c];
          CandidatePortal__c cnd=[Select ExpectedSalary__c from CandidatePortal__c where FirstName__c='Abc'];
          System.assertEquals(null, cnd.ExpectedSalary__c);
    }
    
    

}