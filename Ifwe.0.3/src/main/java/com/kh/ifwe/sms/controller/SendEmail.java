package com.kh.ifwe.sms.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SendEmail {
	@ResponseBody
	@PostMapping("/mailSender")
	public String mailSender(@RequestParam("memberEmail")String memberEmail) throws AddressException, MessagingException {
		System.out.println("123123123123");
		System.out.println("memberEmail = "+memberEmail);
		
		String host = "smtp.gmail.com";
		final String username = "ifwe1014";
		final String password = "ifwe1014ifwe"; 
		int port = 465; // 포트번호

		// 메일 내용
		int rNum =  (int)(Math.random() * 999999 + 1);
		String recipient = memberEmail; 
		String subject = "안녕하세요. ifwe입니다."; 
		String body = "안녕하세요. ifwe에서 보냅니다. \n 인증번호는 "+rNum+"입니다. \n 감사합니다. "; 

		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		
		session.setDebug(true);
		Message mimeMessage = new MimeMessage(session);
		
		mimeMessage.setFrom(new InternetAddress("XXXXXXXX@naver.com"));

		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

		mimeMessage.setSubject(subject); 
		mimeMessage.setText(body); 
		Transport.send(mimeMessage); 
		
		return  String.valueOf(rNum); 
		
	}
}
