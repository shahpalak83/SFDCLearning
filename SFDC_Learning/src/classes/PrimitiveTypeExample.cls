public class PrimitiveTypeExample {
public static void message()
{
    String a = 'Original';
    ProcessString(a);
    System.assertEquals('Modified', a);
}
    
    public static void ProcessString(String s){
        s= 'Modified';
    }
}