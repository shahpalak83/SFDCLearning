public virtual class Pen {
static Integer count = 0;
    public Pen()
    {
        count++;
    }
    public static void counter()
    {
        System.debug('Counter is now:'+ count);
    }
    public virtual void Write1(){
      System.debug('Calling Write1 from Pen Class');
    }
    
    public void Write2(){
        System.debug('Calling Write2 from Pen Class');
    }    
}