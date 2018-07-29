@isTest
public class TestAccountDeletion1 {
	@isTest static void TestAccountDeleteWithONeCon()
    {
        Account acct = new Account(Name='Test Account');
        insert acct;
        
    	
        Contact con = new Contact(FirstName = 'FName', LastName = 'LName', AccountId = acct.Id);
        Insert con;
        
       
        Database.DeleteResult result = Database.delete(acct, false);        
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        System.assertEquals('Account can not be deleted when atleast one contact is associated', result.getErrors()[0].getMessage());
        
        
    }
}