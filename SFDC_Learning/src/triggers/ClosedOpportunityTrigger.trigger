trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>();
	for(Opportunity a: Trigger.New)
    {
        if(a.StageName=='Closed Won')
        {
            taskList.add(new Task(subject = 'Follow Up Test Task', WhatId=a.Id));
        }
    }
   	
    if(taskList.size()>0)
        Insert taskList;
}