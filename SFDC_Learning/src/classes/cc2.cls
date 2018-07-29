public with sharing class cc2 {
    public List<Account> getListAcc(){
        List<Account> myAcc = [SELECT ID, NAME FROM ACCOUNT];
        return myAcc;
    }
    
    public List<Opportunity> getListOpp()
    {
        List<Opportunity> myOpt = [SELECT ID,NAME FROM OPPORTUNITY];
        return myOpt;
    }
}