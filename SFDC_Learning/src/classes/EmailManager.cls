public with sharing class EmailManager {
	public static void sendMail(String address, String subject, String body)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[] {address};
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        Messaging.SendEmailResult[] rs = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        if(rs[0].isSuccess())
            System.debug('Email Sent Successfully');
        else
            System.debug(rs[0].getErrors());
    }
}