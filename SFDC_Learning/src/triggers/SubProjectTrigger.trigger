trigger SubProjectTrigger on SubProject__c (after insert, after update, after delete) {
	
    List<SubProject__c> subProjList = new List<SubProject__c>();
    if(Trigger.isInsert || Trigger.isUpdate)
    {
     	subProjList.addAll(Trigger.New);   
    }
    if(Trigger.isDelete)
    {
        subProjList.addAll(Trigger.Old);
    }
    
    Map<Id,Project__c> projMap = new Map<Id,Project__c>();
    for(SubProject__c sub: subProjList)
    {
        projMap.put(sub.Project__c, null);
    }
    
    for(Project__c proj: [SELECT ID, (SELECT ID, SubProjectStart__c FROM SubProjects__r ) from Project__c where ID in : projMap.keySet()])
    {
        System.debug(proj.SubProjects__r);
        if(proj.SubProjects__r.size()>0)
           if(proj.SubProjects__r[0].SubProjectStart__c!=null)
        		proj.In_Service_A__c = proj.SubProjects__r[0].SubProjectStart__c;
        	else
               proj.In_Service_A__c = null;
       	else 
           		proj.In_Service_A__c = null;
        projMap.put(proj.Id, proj);
    }
    
    if(projMap.size()>0)
        update projMap.values();
}