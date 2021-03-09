package mail.model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendingEmail_newpassword {

	private String userEmail;
	private String newPassword;
	
	public SendingEmail_newpassword(String userEmail, String newPassword) {
		this.userEmail = userEmail;
		this.newPassword = newPassword;
	}
	
	public void sendMail() {
		// Enter the email address and password for the account from which verification link will be send
		String email = "trainme015@gmail.com";
		String password = "Trainme0!";
		
		Properties theProperties = new Properties();
		
		theProperties.put("mail.smtp.auth", "true");
		theProperties.put("mail.smtp.starttls.enable", "true");
		theProperties.put("mail.smtp.host", "smtp.gmail.com");
		theProperties.put("mail.smtp.port", "587");
		
		Session session = Session.getDefaultInstance(theProperties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});
		
		try {
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			// 設定信件標題
			message.setSubject("重設密碼");
			// 設定信件內容
			message.setText("Hi, 這是你的新密碼: " + newPassword
							+ "\n注意: 請登入後，立即更改你的密碼");
			
			Transport.send(message);
			
			System.out.println("Successfully sent Verification Link");
			
		} catch (Exception e) {
			System.out.println("Error at SendingEmail.java: " + e);
		}
		
	}
	
}
