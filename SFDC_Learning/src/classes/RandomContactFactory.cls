public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer i, String lName)
    {
        List<Contact> conL = new List<Contact>();
        For(Integer j=0;j<i;j++)
        {
            conL.add(new Contact(FirstName='Test'+j, LastName='lName'));
        }
        
        if(conL.size()>0)
        Insert conL;
        
        return conL;
    }
}