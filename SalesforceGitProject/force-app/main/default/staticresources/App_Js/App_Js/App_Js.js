 function confirmation()
    {
        var x = document.getElementById('{!$Component.theForm.thePageBlock.thePageBlockSection.Manager__c}').value;
        var y = document.getElementById('{!$Component.theForm.thepageblock.thePageBlockSection.Number_of_Positions__c}').value; 
        var z = document.getElementById('{!$Component.theForm.thepageblock.thePageBlockSection.Salary_Offered__c}').value;
        
       alert("Value of x :"+ x);
       alert("Value of y :"+ y);
       alert("Value of z :"+ z);
           if(x=="" || y=="" || z=="")
           {
                alert("Please enter the values for all fields.");
                return false;
           }
           else {
           alert("Save and close.");
           return true;
           }
 
      }