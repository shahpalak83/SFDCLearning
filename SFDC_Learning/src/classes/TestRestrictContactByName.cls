@isTest
public class TestRestrictContactByName {
	TestMethod static void testContactPositive()
    {
        Contact con = new Contact(FirstName='First',LastName='Invalid');
        
   		Test.startTest();
        Database.SaveResult dsr = Database.insert(con,false);
        Test.stopTest();
        System.assert(!dsr.isSuccess());
        System.assert(dsr.getErrors().size()>0);
        System.assertEquals('Invalid can not be used for last name.', dsr.getErrors()[0].getMessage());
    }
    
    TestMethod static void testContactNegative()
    {
        Contact con = new Contact(FirstName='First',LastName='LastName');
        
   		Test.startTest();
        Database.SaveResult dsr = Database.insert(con,false);
        Test.stopTest();
        System.assert(dsr.isSuccess());
    }
}