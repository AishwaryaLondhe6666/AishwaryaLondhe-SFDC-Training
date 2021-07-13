public class JobOpportunitiesCustomController {
    
/*List<Account> obj;
 public List<JobOpportunities__c> getAccounts() {
        if(obj == null)
            obj = [SELECT name, owner.name FROM JobOpportunities__c LIMIT 10];
        return obj;
    }*/
     
  
    
  public JobOpportunities__c candidate{get;set;}
    // List<JobOpportunities__c> candidate{set;get;} // we use set and get if you want access this variable on page
    
  public JobOpportunitiesCustomController()
  {
      System.debug('inside constructor');
      Id id=ApexPages.currentPage().getParameters().get('id');
            System.debug('id'+id);                                                                                          

       candidate=(id==null) ?new JobOpportunities__c():[select Active__c,Description__c,Expiry_Date__c,Job_Title__c,Manager__c,Name__c,Number_of_Positions__c,Salary_Offered__c,Total__c FROM JobOpportunities__c Where Id=:id];
      // candidate  = [select id,Active__c,Description__c,Expiry_Date__c,Job_Title__c,Manager__c,Name__c,Number_of_Positions__c,Salary_Offered__c,Total__c from JobOpportunities__c where Id=:id]; 
        
        
  
  }
  public PageReference save()
  {
  upsert candidate;
  
  PageReference p=new ApexPages.StandardController(candidate).view();
      return p;
  }
}