trigger AccountDeletion1 on Account (before delete) {
	for(Account acc: [SELECT ID FROM Account where ID in: Trigger.Old AND ID IN (SELECT AccountId FROM Contact)])
    {
        Trigger.OldMap.get(acc.Id).addError('Account can not be deleted when atleast one contact is associated');
    }
    
}