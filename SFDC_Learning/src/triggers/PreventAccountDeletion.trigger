trigger PreventAccountDeletion on Account (before Delete) {
    System.debug(Trigger.old);
List<Account> accWithoutOpty = [SELECT ID FROM Account where ID IN :Trigger.old AND ID IN(SELECT AccountId from Opportunity)];
System.Debug('Number of records:'+ accWithoutOpty.size());
for(Account acc: Trigger.Old)
{
    Trigger.oldMap.get(acc.Id).addError('Prevent Account Deletion error: Can not delete Account with Opty associated.');
}    
}