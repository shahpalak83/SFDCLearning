trigger AddRelatedRecords on Account (after insert, after update) {
    
    List<Account> accWithOpty = [SELECT ID, (SELECT ID FROM Opportunities) FROM Account WHERE ID IN: Trigger.New];
    
    List<Opportunity> optyToBeAdded = New List<Opportunity>();
    
    for(Account a: accWithOpty)
    {
        if(a.Opportunities.Size()>0)
            System.Debug('Account: '+ a.Id+' , Already has opportunity(s) associated.');
        else
        {
            optyToBeAdded.add(new Opportunity(Name='Opportunity', StageName='Prospecting', CloseDate=System.today().addMonths(1), AccountId=a.id));
        }
    }
    
    if(optyToBeAdded.size()>0)
        Insert optyToBeAdded;
}