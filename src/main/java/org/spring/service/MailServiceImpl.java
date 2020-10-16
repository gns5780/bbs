package org.spring.service;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	
	
	//sendaddress : 보낼 메일 풀주소
	//현재 네이버만 가능
	//sendpassword :임시 비밀번호
	//비밀번호 분실시 찾는용도
	
	public void pwfind(String sendaddress,String sendpassword) throws AddressException, MessagingException {
		System.out.println("mailsender");
		String host = "smtp.naver.com";
		final String username ="gns5780";
		final String password = "sshs1515@@!!";
		int port=587;
		
		String subject = "[이훈] 비밀번호 찾기 서비스입니다.";
		String body = "임시비밀번호는 "+sendpassword+" 입 니다.\n"
				+ "접속후 비밀번호 수정 부탁드립니다.";
		
		
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
		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(sendaddress));
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
	}
	//가입할때 이메일 체크용도 
	public void emailCheck(String sendaddress,String keynum)  throws AddressException, MessagingException {
		System.out.println("mailsender");
		String host = "smtp.naver.com";
		final String username ="gns5780";
		final String password = "sshs1515@@!!";
		int port=587;
		
		String subject = "[이훈] 이메일 인증 서비스입니다.";
		String body = "인증번호는 "+keynum+" 입 니다.\n"
				+ "페이지에서 입력 부탁드립니다.";
		
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host",host);
		props.put("mail.smtp.port",port);
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.sse.enable","true");
		props.put("mail.smtp.trust",host);
		System.out.println("123");
		Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator(){
			String un = username;
			String pw = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		System.out.println("456");
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("gns5780@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(sendaddress));
		System.out.println("789");
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
	}
	//test
	public void test() throws AddressException, MessagingException{
		
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
	}
	public int leehun() {
		
		return 10;
	}
}
