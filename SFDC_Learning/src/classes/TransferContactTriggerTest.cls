@isTest
public class TransferContactTriggerTest {

    	@isTest(SeeAllData=true) static void InsertSingleContact()
        {
            Contact con = New Contact();
            con.FirstName ='Palak';
            con.LastName ='Shah';
            Insert con;
            
        }
}