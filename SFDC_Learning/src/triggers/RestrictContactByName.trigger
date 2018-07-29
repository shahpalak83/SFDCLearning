trigger RestrictContactByName on Contact (before insert, before update) {
	for(Contact con: Trigger.New)
    {
        if(con.LastName == 'Invalid')
        {
            con.addError(con.LastName+' can not be used for last name.');
        }
    }
}