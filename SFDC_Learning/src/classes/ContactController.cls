public with sharing class ContactController {
    Public string MyString_From_Methode{get;set;}
    Public List<sObject> conList{get;set;}
    Public List<string> fieldstringList{get;set;}
    public Integer tot {get;set;}
    public Integer rec { get; set; }
    integer totalRecs = 0;
    integer count= 0;
    integer LimitSize= 10;
    
    public PageReference SendSMS() {
        return null;
    }

    public ContactController (ApexPages.StandardController controller) 
    {
        totalRecs = [select count() from contact where MobilePhone !=null];
    }
    

    Public List<String> getfieldList()
    {
        fieldstringList = new List<string>();
        fieldstringList.add('FirstName');
        fieldstringList.add('LastName');
        fieldstringList.add('MobilePhone');
        return fieldstringList;
    }
     
    Public List<sObject> getListCon()
    {
      conList= [select FirstName,LastName,MobilePhone from Contact where MobilePhone !=null LIMIT:limitsize OFFSET:count];
      return ConList;
    }  
    
    public void updatePage()
    {
       conList.clear();
      limitsize=rec;
       conList=[select FirstName,LastName,MobilePhone from Contact where MobilePhone !=null LIMIT:limitsize OFFSET:count];
    }
     public PageReference Firstbtn()
     {
     count=0;
        return null;
    }
      public PageReference prvbtn()
      {
      count=count-limitsize;
        return null;
    }
   
     public PageReference Nxtbtn()
     {
     count=count+limitsize;
            return null;
    }
     public PageReference lstbtn()
     {
     count= totalrecs - math.mod(totalRecs,LimitSize);
            return null;
    }


    public Boolean getNxt()
    {
        if((count+ LimitSize) > totalRecs)
       return true;
     else
       return false;
        
    }
     public Boolean getPrv()
     {
      if(count== 0)
          return true;
        else
          return false;
     }
}