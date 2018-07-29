@isTest
public class CaseForAccountTriggerTest {
	@isTest static void insertSingleAccount()
    {
        Account acc = New Account();
        acc.Name = 'Test Account Trigger';
        Database.SaveResult dsr = Database.insert(acc);
        System.assertEquals(dsr.isSuccess(), true);
    }
    
    @isTest static void insertMultipleAccounts()
    {
        Account acc = New Account();
        acc.Name = 'Test Account Trigger';
        Database.SaveResult dsr = Database.insert(acc);
        System.assertEquals(dsr.isSuccess(), true);
        
        Account acc1 = New Account();
        acc1.Name = 'Test Account Trigger 1';
        Database.SaveResult dsr1 = Database.insert(acc1);
        System.assertEquals(dsr1.isSuccess(), true);
    }
}