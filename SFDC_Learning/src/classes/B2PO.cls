public class B2PO implements PurchaseOrder {
    public Double Discount(){
        return 0.1;
    }
    
    public void Announce(){
        System.debug('This is B2PO Announce');
    }
}