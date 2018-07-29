trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert)
    {
        EmailManager.sendMail('abc@abcd.com', 'Trailhead Trigger Tutorial', Trigger.New.size()+' contact(s) were inserted.');
    }
    else if(Trigger.isDelete)
    {
        
    }
}