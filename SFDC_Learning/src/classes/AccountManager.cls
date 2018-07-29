@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
@HttpGet
    global static Account getAccount() 		 {
        RestRequest request = RestContext.request;
        // grab the AccountId from the end of the URL
        String accountId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        Account result =  [SELECT Id, Name, (select id, name from contacts) 
                        FROM Account
                        WHERE Id = :accountId];
        System.debug('HttpGet AccountId:' +accountId);
        return result;
    }
  @HttpPost
    global static ID createAccount(String AName, String ContactFName,String ContactLName) {
        Account thisAccount = new Account(Name = AName);
        insert thisAccount;
        Contact thisContact = new Contact(FirstName = ContactFName, LastName = ContactLName, AccountId =thisAccount.Id);
        insert thisContact;
        System.debug('HttpPut AccountId:' +thisAccount.Id);
        return thisAccount.Id;
    }   
}