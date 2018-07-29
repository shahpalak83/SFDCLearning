@isTest
public class VerifyDateTest {
	@isTest static void dateInPast()
    {
        VerifyDate.CheckDates(Date.newInstance(2017, 01, 01), Date.newInstance(2015, 12, 1));
    }
    
    @isTest static void dateInRange()
    {
        VerifyDate.CheckDates(Date.newInstance(2017, 01, 01), Date.newInstance(2017, 01, 23));
    }
    
    @isTest static void dateInFuture()
    {
        VerifyDate.CheckDates(Date.newInstance(2017, 01, 01), Date.newInstance(2017, 02, 01));
    }
}