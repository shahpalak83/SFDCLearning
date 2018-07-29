trigger ProjectSiteStatusTrigger on Project__c (after insert, after update, after delete) {
    List<Project__c> projList = new List<Project__c>();
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        projList.addAll(Trigger.New);
    }
    else if(Trigger.isDelete)
    {
        projList.addAll(Trigger.Old);
    }
    
    Map<Id,Site__c> siteMap = new Map<Id,Site__c>();
    for(Project__c proj: projList)
    {
        siteMap.put(proj.Site__c, null);
    }
    
    List<Site__c> siteList = new List<Site__c>();
    Boolean srvDate = true;
  	for(Site__c site: [SELECT ID,Site_Status__c, (SELECT ID, In_Service_A__c from Projects__r) from Site__c  where id IN:siteMap.keySet()])
    {
        System.debug(site.Projects__r.size());
        site.Number__c = site.Projects__r.size();
        List<Project__c> pro1List = site.Projects__r;
        for(Project__c proj: pro1List)
        {
            if(proj.In_Service_A__c == null)
            {
               srvDate = false;
            }
        }
        System.debug('SerDate : '+ srvDate);
        System.debug('SiteStatus: '+ site.Site_Status__c);
        if(srvDate && site.Site_Status__c!='On Air')
            site.Site_Status__c = 'On Air';
        else if(!srvDate && site.Site_Status__c=='On Air')
          site.Site_Status__c = 'In Process';
        
        siteList.add(site);
    }
    update siteList;

}