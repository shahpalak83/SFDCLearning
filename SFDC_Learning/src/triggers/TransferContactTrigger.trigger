trigger TransferContactTrigger on Contact (before insert) {
    Account accId = [select id,name from account where name like '%sForce%'];
    system.debug(accId);
    for(Contact con: Trigger.New)
    {
        con.AccountId = accId.Id;
    }
}