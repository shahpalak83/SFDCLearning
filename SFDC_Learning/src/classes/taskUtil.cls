public class taskUtil {
	public static String getTaskPriority(String state)
    {
        if(String.isBlank(state) || state.length()>2)
            return '';

		String taskPriority;        
        if(state=='CA')
            taskPriority='High';
        else if(state=='NJ')
            taskPriority='Medium';
        else
            taskPriority='Low';
        
        return taskPriority;
    }
}