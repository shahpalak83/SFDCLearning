public class OlderAccountsUtility {
	public static void updateOlderAccounts()
    {
        List<Account> accList = [SELECT ID,Description FROM ACCOUNT order by CreatedDate asc LIMIT 5];
        
        for (Account acc : accList)
        {
            acc.Description = 'Heritage Account';
        }
        
        update accList;
    }	
}