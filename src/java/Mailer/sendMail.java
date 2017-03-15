/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mailer;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
/**
 * @author Damian
 * 
 */
 
public class sendMail {
 
	static Properties mailServerProperties;
	static Session getMailSession;
	static MimeMessage generateMailMessage;
 
	
 
	public static int generateAndSendEmail(String adress,String password) throws AddressException, MessagingException {
 
		// Step1
		//System.out.println("\n 1st ===> setup Mail Server Properties..");
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
                
		//System.out.println("Mail Server Properties have been setup successfully..");
 
		// Step2
		//System.out.println("\n\n 2nd ===> get Mail Session..");
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		generateMailMessage = new MimeMessage(getMailSession);
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(adress));
		generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(adress));
		generateMailMessage.setSubject("Greetings from musicStream");
		String emailBody = "Your new password has been generated " + "<br><br> Password : " + password;
		generateMailMessage.setContent(emailBody, "text/html");
		//System.out.println("Mail Session has been created successfully..");
 
		// Step3
		//System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");
 
		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", "musicstreamtestemail1@gmail.com", "testtest123");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
                return 0;
	}
        
        
        public static int generateAndSendEmailOrder(String adress,String Album, int quantity, String username, double price) throws AddressException, MessagingException {
 
		// Step1
		//System.out.println("\n 1st ===> setup Mail Server Properties..");
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
                
		//System.out.println("Mail Server Properties have been setup successfully..");
 
		// Step2
		//System.out.println("\n\n 2nd ===> get Mail Session..");
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		generateMailMessage = new MimeMessage(getMailSession);
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(adress));
		generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(adress));
		generateMailMessage.setSubject("Thank you for your Order");
		String emailBody = "You Have Successfully Ordered" + "<br><br> Album : " + Album
                        + "<br><br> Username : " + username
                          + "<br><br> Quantity : " + quantity
                        + "<br><br> Price : " + price
                        
                        
                        ;
		generateMailMessage.setContent(emailBody, "text/html");
		//System.out.println("Mail Session has been created successfully..");
 
		// Step3
		//System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");
 
		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", "musicstreamtestemail1@gmail.com", "testtest123");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
                return 0;
	}
}
