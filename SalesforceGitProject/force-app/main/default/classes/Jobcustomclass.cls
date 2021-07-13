public class Jobcustomclass
{
    public List <Contact> contactList { get; set; }   
    String query;   
    String allFields = '';
    public Jobcustomclass()
    {
        String objectName = 'Contact';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(objectName ).getDescribe().fields.getMap();
        set<string> mapset = fieldMap.keyset(); 
        contactList = NEW List <Contact> (); 

        for ( String str:mapset )
        {

            allFields += str +', '; 

        }
        allFields = allFields.removeEnd(', ');

        query = 'SELECT '+ allFields + ' FROM '  + objectName;

        System.debug('----------'+query);   

        contactList = Database.query(query);
        System.debug('----------'+contactList);
    }
}