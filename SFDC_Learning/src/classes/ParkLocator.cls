public class ParkLocator {
	public static List<String> country(String con)
    {
		ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        List<String> response = parks.byCountry(con);
        system.debug(response);
        return response;
    }
}