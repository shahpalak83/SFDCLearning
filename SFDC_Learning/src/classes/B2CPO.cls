public class B2CPO implements PurchaseOrder{

    public Double Discount(){
		return 0.05;
    }
    
    public Void Announce()
    {
        System.Debug('This is B2CPO Announce');
    }
}