package com.dolphin.util;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailSenderUtil{
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	public MailSenderUtil() {
	}
	
	/**
	 * Send email to some address.
	 * @param toEmail
	 * @param subject
	 * @param content
	 */
	public static void sendMail(String toEmail, String subject, String content) throws Throwable{
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
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(EMAIL));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(toEmail));
			
			message.setSubject(subject, "utf-8");			
			message.setContent(content, "text/html; charset=utf-8");
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void sendMailWithFileAttach(String toEmail, String subject, String content, String filePath) throws Throwable{
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
			if(toEmail == null){
				toEmail = EMAIL;
			}
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(EMAIL));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(toEmail));
			
			message.setSubject(subject, "utf-8");	
			
			MimeBodyPart messageBodyPart = new MimeBodyPart();
	        Multipart multipart = new MimeMultipart();
	        
	        messageBodyPart = new MimeBodyPart();
	        String fileName = "Backup data file on: " + MailSenderUtil.df.format(new Date());
	        DataSource source = new FileDataSource(filePath);
	        messageBodyPart.setDataHandler(new DataHandler(source));
	        messageBodyPart.setFileName(fileName);
	        multipart.addBodyPart(messageBodyPart);
	        message.setContent(multipart, "text/html; charset=utf-8");
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
