public class AccountVFController {
   
           

    public List<CandidatePortal__c> records{get;set;}
    
    public List<JobOpportunities__c> records2{get;set;}
   // public List<JobOpportunities__c> job{get;set;}

    
    public List<String>fields{get;set;}

    public List<String>fields2{get;set;}

    public AccountVFController(){
       
      System.debug('inside constructor');
      Id id=ApexPages.currentPage().getParameters().get('id');
            System.debug('id'+id);                              

      records= [Select Age__c,ApplicationDate__c,Country__c,DOB__c,Email__c,ExpectedSalary__c,FirstName__c,FullName__c,Job__c,LastName__c,Salutation__c,States__c,Status__c FROM CandidatePortal__c WHERE Id = :id];
        records2= [Select Active__c,Description__c,Expiry_Date__c,Job_Title__c,Manager__c,Name__c,Number_of_Positions__c,Salary_Offered__c,Total__c FROM JobOpportunities__c WHERE Id=:id ];

      fields = new List<String>{'FullName__c', 'Age__c', 'ApplicationDate__c','Country__c','DOB__c','Email__c','ExpectedSalary__c','FirstName__c','LastName__c','Salutation__c','States__c','Status__c'};
       fields2 = new List<String>{'Active__c', 'Description__c', 'Expiry_Date__c','Job_Title__c','Manager__c','Name__c','Number_of_Positions__c','Salary_Offered__c','Total__c'};
 
       //record=[Select Age__c,ApplicationDate__c,Country__c,DOB__c,Email__c,ExpectedSalary__c,FirstName__c,FullName__c,Job__c,LastName__c,Salutation__c,States__c,Status__c From CandidatePortal__c where Id=:id];
       // fields=new List<String>{'ApplicationDate__c','Country__c','DOB__c','Email__c','ExpectedSalary__c','FirstName__c','FullName__c','LastName__c','Salutation__c','States__c','Status__c'};   
}

}