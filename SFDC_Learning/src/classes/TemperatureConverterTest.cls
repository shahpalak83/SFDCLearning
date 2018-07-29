@isTest
public class TemperatureConverterTest {
	@isTest static void testWarm()
    {
        Decimal c = TemperatureConverter.FtoC(70);
        System.assertEquals(21.11, c);
    }
    
    @isTest static void testFreez()
    {
        Decimal c = TemperatureConverter.FtoC(32);
        System.assertEquals(0, c);
    }
    
    @isTest static void testBoiling()
    {
        Decimal c = TemperatureConverter.FtoC(212);
        System.assertEquals(0,c,'Boiling point temperature is not expected.');
    }
    
    @isTest static void testNegative()
    {
        Decimal c = TemperatureConverter.FtoC(-10);
        System.assertEquals(-23.33, c);
    }
}