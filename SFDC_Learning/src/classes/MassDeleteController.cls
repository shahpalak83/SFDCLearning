public without sharing class MassDeleteController {

    public PageReference SendSMS() {
        return null;
    }

    public List<String> sObjFieldList{get;set;}
    public List<sObject> sObjList{get;set;}
    Public List<wrapperClass> WrapperList{get;set;}
    public Integer tot {get;set;}

    Public List<wrapperClass> getListWrapperMethod(){
         WrapperList =new List<WrapperClass>();
             for(sObject sObj:sObjList){
                 WrapperList.add( new wrapperClass(false,sObj)) ;
             }
             return WrapperList;
        }
   Public List<String> FieldList{
      get{
         List<String> FieldList = New List<string>();
         FieldList = getsObjtFieldList();
         return FieldList;
      }set;
   }
   
   Public Class wrapperClass{
     Public Boolean SelectBox{get;set;}
     Public sObject sObjRec{get;set;}
   
     Public WrapperClass(Boolean checkbx, sObject sObjRecord){
        SelectBox = checkbx;
        sObjRec = sObjRecord;
     }
   
   }
   
   public List<string> getsObjtFieldList() {
       List<String> FieldList = SobjFieldList;
       return FieldList ;
    }
    
     Public string SMSSelectedRecs(){
      List<sObject> DeleteList = New List<sObject>();
      for(wrapperclass wc:WrapperList){
          if(wc.SelectBox  == true)
             //DeleteList.add(wc.sObjRec); 
             System.debug(wc.sObjRec.get('FirstName'));
      }
      //delete DeleteList;
      return null;     
    }
}