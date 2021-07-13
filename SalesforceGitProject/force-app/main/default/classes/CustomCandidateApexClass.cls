public class CustomCandidateApexClass {
    


  public CandidateForm__c candidate{get;set;}
  public CustomCandidateApexClass()
  {
      System.debug('inside constructor');
      Id id=ApexPages.currentPage().getParameters().get('id');
            System.debug('id'+id);

        candidate=(id==null) ?new CandidateForm__c():[select Salutation__c,FirstName__c,LastName__c,FullName__c,Age__c,Country__c,States__c,Email__c,DOB__c,ApplicationDate__c,ExpectedSalary__c,Status__c,Job__c,Active__c FROM CandidateForm__c where Id=:id];
  
  
  }
  public PageReference save()
  {
  upsert candidate;
  
  PageReference p=new ApexPages.StandardController(candidate).view();
      return p;
  }
    


}