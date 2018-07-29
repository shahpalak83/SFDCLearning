public class NonPrimitiveTypeExample {
    public static void fillMe(){
        List<Integer> L1 = New List<Integer>();
        //refreshMe(L1);
        //System.assertEquals(2, L1.size());
        pointMe(L1);
        System.assertEquals(2, L1.size());
    }
    
    public static void refreshMe(List<Integer> L1){
        L1.add(1);
        L1.add(2);
    }
    
    public static void pointMe(List<Integer> L2){
        L2 = New List<Integer> {1,2};
    }
}