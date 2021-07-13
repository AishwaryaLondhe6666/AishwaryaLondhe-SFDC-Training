public class pageHandler {
    
    
    
    /*List<Account> obj;
public List<JobOpportunities__c> getAccounts() {
if(obj == null)
obj = [SELECT name, owner.name FROM JobOpportunities__c LIMIT 10];
return obj;
}*/
    
    
    
    public JobOpportunities__c candidate3{get;set;}
    public String testField {public get; public set;}
    
    //public JobOpportunities__c candi{get;set;}
    // public string manager{get;set;}
    // public string NumberofPositions{get;set;}
    
    
    // List<JobOpportunities__c> candidate{set;get;} // we use set and get if you want access this variable on page
    /* public void save(){
strCustomErrorMsg = '';
if(candidate2.Manager__c == null || candidate2.Manager__c == '')
strCustomErrorMsg = 'First Name required';
if(candidate2.Salary_Offered__c == null || candidate2.Salary_Offered__c == '')
strCustomErrorMsg = strCustomErrorMsg + '<br/> Last Name required';
} */
    
    
    
    public pageHandler()
    {
        System.debug('inside constructor');
        Id id=ApexPages.currentPage().getParameters().get('id');
        System.debug('id'+id);                                                                                          
        
        candidate3=(id==null) ?new JobOpportunities__c():[select Active__c,Description__c,Expiry_Date__c,Job_Title__c,Manager__c,Name__c,Number_of_Positions__c,Salary_Offered__c,Total__c FROM JobOpportunities__c Where Id=:id];
            // candidate  = [select id,Active__c,Description__c,Expiry_Date__c,Job_Title__c,Manager__c,Name__c,Number_of_Positions__c,Salary_Offered__c,Total__c from JobOpportunities__c where Id=:id]; 
            
            
            
            }
    /* public void submt()
{
candi.Manager__c=Manager__c;
candi.Manager__c=Number_of_Positions__c;
insert candi;
}
*/
    
    
    public PageReference save()
    {
        upsert candidate3;
        
        PageReference p=new ApexPages.StandardController(candidate3).view();
        return p;
    }
   
}