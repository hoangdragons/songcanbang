package dolphin.core;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.Test;

import com.dolphin.util.PropertyUtil;

public class MailSenderTest {
	
	@Test
	public void testSendMail(){
		String paramEmail = "nghia.n.v2007@gmail.com";
		final String paramToken = UUID.randomUUID().toString();
		String paramSubject = "Member registration - Email validation";
		String paramContent = "Dear " + paramEmail + ","
				+ "<br> This email was sent to you beacause you have registerd as a member on songcanbang.org!<br>"
				+ "<br>"
				+ "<a href='http://accounts.songcanbang.org/#/app/user-validation?email=" + paramEmail +"&token="+paramToken+"' target='_BLANK'>"
				+ " Please click this link (or copy and paste to your browser) to complete the registration!\n\n"
				+ "</a>"
				+"<br><br> On behalf of Songcanbang.org team, Best Regards.";
		
		
		PropertyUtil prop = new PropertyUtil();
		final String SMTP_USERNAME=prop.get("smtp.username");
		final String SMTP_PASSWORD = prop.get("smtp.password");
		final String EMAIL = prop.get("support.email");
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", prop.get("smtp.auth"));
		props.put("mail.smtp.starttls.enable", prop.get("smtp.starttls.enable"));
		props.put("mail.smtp.host", prop.get("smtp.host"));
		props.put("mail.smtp.port", prop.get("smtp.port"));
		
		
		
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
			}
		  });

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(EMAIL));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(paramEmail));
			
			message.setSubject(paramSubject);			
			message.setContent(paramContent, "text/html; charset=utf-8");
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
