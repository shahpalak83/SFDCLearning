public class ContactControllerExample {
    
    List<contactwrapper> conList = new List<contactwrapper>();
    List<Contact> selectedContacts = new List<Contact>();
         
    public List<contactwrapper> getContacts()
    {
        for(Contact c: [select FirstName, LastName, MobilePhone from Contact where MobilePhone != '' order by FirstName ])
        conList.add(new contactwrapper(c));
        return conList;
    }
     
    public PageReference getSelected()
    {
        selectedContacts.clear();
        for(contactwrapper conwrapper: conList)
        if(conwrapper.selected == true)
        selectedContacts.add(conwrapper.con);
        return null;
    }
     
    public List<Contact> getSelectedContacts()
    {
        if(selectedContacts.size()>0)
        return selectedContacts;
        else
        return null;
    }    
     
    public class contactWrapper
    {
        public Contact con{get; set;}
        public Boolean selected {get; set;}
        public contactWrapper(Contact c)
        {
            con = c;
            selected = false;
        }
    }
    
    public void SendSMS()
    {
        for(Integer i=0; i<selectedContacts.size();i++)
        System.debug(selectedContacts[i].MobilePhone);
    }

}