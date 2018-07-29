public class EmailUtilities {
	public static void sendEmail(String to, String Subject, String body)
    {
        Messaging.SingleEmailMessage emailMessage = new Messaging.SingleEmailMessage();
        List<String> toAddr = new List<String> {to};
        
        emailMessage.setToAddresses(toAddr);
		emailMessage.setSubject(body);           
   		emailMessage.setPlainTextBody(body);
        
        List<Messaging.SingleEmailMessage> emails= new List<Messaging.SingleEmailMessage>{emailMessage};
        Messaging.SendEmailResult[] emailResult = Messaging.sendEmail(emails);
        
        system.debug(emailResult);
    }
}