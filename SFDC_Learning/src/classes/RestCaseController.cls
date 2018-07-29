@RestResource(urlMapping='/FieldCase/*')
global with sharing class RestCaseController {
	@HttpGet
    global static List<Case> getCases()
    {
        String companyName = RestContext.request.params.get('companyName');
        Account company = [SELECT Id, Name from Account where name=: companyName LIMIT 1];
        List<Case> caseList= [SELECT ID, subject, status, ownerId, Owner.Name from CASE where AccountId =: company.Id];
        
        if(caseList.size()>0)
            return caseList;
        else
            return null;
    }
    
    @HttpDelete
    global static String deleteCases()
    {
        String companyName = RestContext.request.params.get('companyName');
        Account acc = [select id from Account where name =: companyName limit 1];
        List<Case> caseToDelete = [select id from Case where AccountId=: acc.Id and Status='Closed'];
        
        if(caseToDelete.size()>0)
        {
            delete caseToDelete;
            return 'Clsoe Case Deleted';
        }
        else
            return 'No closed cases found';
    }
    
    @HttpPost
    global static Account createNewAccount(String accountName)
    {
        Account a = new Account();
        a.Name = accountName;
        Insert a;
        
        return a;
    }
    
    @HttpPatch
    global static String updateAccount(String accountName, String descr)
    {
        Account acc = [select id, name, description from Account where name=: accountName limit 1];
        acc.Description += descr;
        
        update acc;
        
        return 'Account updated successfully';
    }
}