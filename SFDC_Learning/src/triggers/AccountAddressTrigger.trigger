trigger AccountAddressTrigger on Account (before insert, before update) {
    
    for(Account acc: Trigger.New)
    {
        if(acc.Match_Billing_Address__c && (acc.BillingPostalCode != acc.ShippingPostalCode))
        {
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}