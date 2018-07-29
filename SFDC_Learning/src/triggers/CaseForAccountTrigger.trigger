trigger CaseForAccountTrigger on Account (after insert) {
    for(Account acc: Trigger.New)
    {
        Case myCase = New Case();
        myCase.Subject = 'New Case from Account Trigger';
        myCase.Status = 'New';
        myCase.Origin = 'Web';
        myCase.AccountId = acc.Id;
        
        insert myCase;
    }
}