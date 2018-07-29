@RestResource(urlMapping='/Contacts/*')
global class ApexContactRest {
    @HttpGet
	global static Contact getContacts()
    {
        String conId = RestContext.request.params.get('contactId');
        Contact con = [select id, name, email from Contact where Id=: conId limit 1];
        return con;
    }
    
     @HttpPost
	global static Contact getContacts(String fName, String lName, String email, String phone)
    {
       Contact con = new Contact(FirstName=fname, LastName=lName, email = email, phone = phone);
       insert con;
        return con;
    }
}