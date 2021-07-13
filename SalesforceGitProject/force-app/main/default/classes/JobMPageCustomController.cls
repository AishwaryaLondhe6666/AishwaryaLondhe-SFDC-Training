public class JobMPageCustomController{
    
    public JobMPage__c jobj{get;set;}
    
    public JobMPageCustomController(){
        
          System.debug('inside constructor');
          Id id=ApexPages.currentPage().getParameters().get('id');
          System.debug('id'+id);
          
        jobj=(id==null)? new JobMPage__c():[Select Description__c,JobTypes__c,TotalApplicants__c,Name from JobMPage__c where Id=:id];
            
      
          
    }
    public PageReference save()
    {
        upsert(jobj);
        
        PageReference p=new ApexPages.StandardController(jobj).view();
        return p;
        
    }
}