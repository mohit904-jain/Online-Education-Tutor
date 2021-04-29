package com.email.send;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class gmailsendemail {
	public static boolean gmailservice(String name,String grade, String subject ,String act, int score,String parentemail,String teacheremail)
	{
		boolean status=false;
		final String username="vgurulearning@gmail.com";
		final String password="vguru12345";
		Properties prop=new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable",true);
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port","587");
		Session session=Session.getInstance(prop,
				new javax.mail.Authenticator() {
			@override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
	});
		try {
			Message message =new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			String to = parentemail+","+teacheremail;
			InternetAddress[] parse = InternetAddress.parse(to , true);
			message.setRecipients(Message.RecipientType.TO,parse);
			MimeBodyPart textpart=new MimeBodyPart();
			Multipart multipart=new MimeMultipart();
			String finaltext="Your ward "+name+" of "+grade+" took a "+act+" on the subject "+subject+" at VGuru Platform and scored "+score+" out of 10";
			textpart.setText(finaltext);
			message.setSubject("Quiz Score of your ward/student");
			multipart.addBodyPart(textpart);
			message.setContent(multipart);
			Transport.send(message);
			status=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
		
	}
}
