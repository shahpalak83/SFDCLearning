@isTest
private class AnimalLocatorTest {
	@isTest static void testGetCallout()
    {
        // Set mock callout class 
    	Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
    	// from the class that implements HttpCalloutMock.
    	String animalName = AnimalLocator.getAnimalNameById(1);
        System.debug(animalName);
        System.assertEquals(animalName, 'chicken');
     }
}