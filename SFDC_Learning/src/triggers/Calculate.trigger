trigger Calculate on Item__c (after insert,after update, after delete) {
    if(Trigger.isInsert)
    {
        list<Shipping_Invoice__c> si = new List<Shipping_Invoice__c>();
         
        for(Item__c it: Trigger.New)
        {
            it.Shipping_Invoice__r.Subtotal__c = it.Shipping_Invoice__r.Subtotal__c + (it.Price__c * it.Quantity__c);
            si.add(it.Shipping_Invoice__r);
        }
        update si;
    }
    else if(Trigger.isUpdate)
    {
		        
    }
    else if(Trigger.isDelete)
    {
        
    }

}