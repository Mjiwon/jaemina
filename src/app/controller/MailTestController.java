/*package app.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class MailTestController {

	
	@Autowired
	JavaMailSender  sender;
	
	
	@RequestMapping("/mail.do")
	public void sendTest() {
		SimpleMailMessage msg = new SimpleMailMessage();
		sender.createMimeMessage();
		msg.setSubject("메일발송 테스트");
		String text="아래의 인증키를 입력해주세요\n";
		text += UUID.randomUUID().toString().split("-")[0];
		msg.setText(text);
		msg.setTo("chldbstjr910@naver.com");
		msg.setFrom("amdin@jamina.mockingu.com");
		
		
		
		
		try {
			sender.send(msg);
			System.out.println("SUCCESS!");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("FAil!");
		}
		
	}
	
}
*/