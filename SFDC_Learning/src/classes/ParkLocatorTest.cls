@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
            // This causes a fake response to be generated
            Test.setMock(WebServiceMock.class, new ParkServiceMock());
            // Call the method that invokes a callout
    		List<String> conList = new List<String>();
            conList = ParkLocator.country('United States');
            // Verify that a fake result is returned
            System.assertEquals(2, conList.size()); 
        }
}