@isTest
public class TaskUtilTest {
	@isTest static void getTaskPriorityHigh()
    {
        System.assertEquals('High', taskUtil.getTaskPriority('CA'));
    }
    
    @isTest static void getTaskPriorityMedium()
    {
        System.assertEquals('Medium', taskUtil.getTaskPriority('NJ'));
    }
    
    @isTest static void getTaskPriorityLow()
    {
        System.assertEquals('Low', taskUtil.getTaskPriority('NY'));
    }
    
    @isTest static void getTaskPriorityBlank()
    {
        String res = taskUtil.getTaskPriority('ABCD');
        System.assertEquals('',res );
    }
}