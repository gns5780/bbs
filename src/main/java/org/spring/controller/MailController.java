package org.spring.controller;



import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mail")
@Controller
public class MailController{
	
	
	@RequestMapping("send")
	public String sender(HttpServletRequest request,ModelMap mo) throws AddressException, MessagingException{
		//네이버 smtp.naver.com
		//google smtp.gmail.com
		System.out.println("mailsender");
		String host = "smtp.naver.com";
		final String username ="gns5780";
		final String password = "sshs1515@@!!";
		int port=587;
		
		String recipient = "gns5780@naver.com";
		String subject = "메일제목 테스트2";
		String body = "메일내용 테스트2";
		
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host",host);
		props.put("mail.smtp.port",port);
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.sse.enable","true");
		props.put("mail.smtp.trust",host);
		
		Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator(){
			String un = username;
			String pw = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("gns5780@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(recipient));
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
			
		return "view/main";
	}
	
	
}
