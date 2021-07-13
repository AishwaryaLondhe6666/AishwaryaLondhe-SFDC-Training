public class CandidatePortalCustomControllers {
    
   public CandidatePortal__c candidate{get;set;}
  public CandidatePortalCustomControllers()
  {
      System.debug('inside constructor');
      Id id=ApexPages.currentPage().getParameters().get('id');
            System.debug('id'+id);                                                                                          

        candidate=(id==null) ?new CandidatePortal__c():[select Salutation__c,FirstName__c,LastName__c,FullName__c,Job__c,ExpectedSalary__c,Email__c,Age__c,ApplicationDate__c,Country__c,DOB__c,States__c,Status__c FROM CandidatePortal__c Where Id=:id];
  
  
  }
  public PageReference save()
  {
  upsert candidate;
  
  PageReference p=new ApexPages.StandardController(candidate).view();
      return p;
  }
    




}