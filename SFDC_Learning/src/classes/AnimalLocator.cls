public class AnimalLocator {
	public static String getAnimalNameById(Integer Id)
    {
        String url = 'https://th-apex-http-callout.herokuapp.com/animals/' + Id;
        String animalName = null;
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        
        if(res.getStatusCode()==200)
        {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());	
            //System.debug(results.get('animal'));
            Map<String, Object> animal = (Map<String,Object>) results.get('animal');
            //System.debug(animal.get('name'));
            
            if(animal.containsKey('name'))
                animalName = (String) animal.get('name');
        }
        return animalName;
    }
}