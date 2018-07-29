public class TemperatureConverter {
    public static decimal FtoC(decimal fh){
         Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}