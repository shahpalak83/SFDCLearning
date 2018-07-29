@isTest
private with sharing class AccountManagerTest {
	 @isTest static void testGetAccountById() {
         Id recordId = createTestAcc();
         // Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://login.salesforce.com/services/apexrest/Accounts/'+ recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
         System.debug('After getAccount in main function'+thisAccount.Id);
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account1', thisAccount.Name);
     }
    @isTest static Id createTestAcc() {
        // Call the method to test
        ID thisAccountId = AccountManager.createAccount('Test Account1', 'Test1', 'Contact1');
        // Verify results
        System.assert(thisAccountId != null);
        Account thisAccount = [SELECT Id,name FROM Account WHERE Id=:thisAccountId];
        System.assert(thisAccount != null);
        System.assertEquals(thisAccount.Name, 'Test Account1');
        return thisAccountId;
    }
    
}