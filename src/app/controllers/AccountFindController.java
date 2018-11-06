package app.controllers;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.CateRepository;
import app.models.ProfileRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.models.WishlistRepository;

@Controller
public class AccountFindController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	Gson gson;

	@Autowired
	BoardRepository boardrepo;

	@Autowired
	AccountRepository accountrepo;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	QAMessageRepository oamr;

	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	CateRepository caterepo;
	
	@Autowired
	WishlistRepository wishrepo;
	
	@Autowired
	ProfileRepository profilerepo;
	
	// 아이디 찾기
		@GetMapping("/find_user.do")
		public String FindUser() {
			return "/WEB-INF/views/account/findid.jsp";
		}

		@PostMapping("/find_user.do")
		public String FindUser(@RequestParam Map param, WebRequest wr, Map map) {

			String receiver = (String) param.get("email");

			if (receiver != null) {
				Map fuser = accountrepo.FindUser(receiver);

				String fid = (String) fuser.get("ID");
					map.put("id", fid);

				SimpleMailMessage msg = new SimpleMailMessage();
				sender.createMimeMessage();
					msg.setSubject("재미나 아이디 찾기");
				String text = "회원님의 아이디는\n";

					text += fid;

					msg.setText(text);
					msg.setTo(receiver);
					msg.setFrom("amdin1@jamina.mockingu.com");

				try {
					sender.send(msg);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
					wr.setAttribute("findidYes", true, WebRequest.SCOPE_REQUEST);
				return "/WEB-INF/views/account/login.jsp";
			} else
				return "/WEB-INF/views/account/findid.jsp";
		}

		// 비밀번호 찾기
		@GetMapping("/find_pass.do")
		public String Findpass(WebRequest wr) {
			return "/WEB-INF/views/account/findpass.jsp";

		}

		@PostMapping("/find_pass.do")
		public String Findpass(@RequestParam Map param, WebRequest wr) {
			/* String receiver = (String) param.get("email") */;

			String id = (String) param.get("getId");
			String receiver = (String) param.get("email");

			String npass = UUID.randomUUID().toString().split("-")[0];

			Map nuser = new HashMap();
			nuser.put("pass", npass);
			nuser.put("id", id);
			nuser.put("email", receiver);

			int i = accountrepo.FindPass(nuser);
			if (i == 1) {
				Map user = accountrepo.Myinfo(id);
				if (user != null) {

					String dpass = (String) user.get("PASS");

					SimpleMailMessage msg = new SimpleMailMessage();
						sender.createMimeMessage();
						msg.setSubject("재미나 비밀번호 찾기");
					String text = "회원님의 비밀번호 는\n";
					String text2 = "\n로그인 하시고 비밀번경을 하세요";

					// ㅎㅇ
						text += dpass;
						text += text2;

						msg.setText(text);
						msg.setTo(receiver);
						msg.setFrom("amdin1@jamina.mockingu.com");
					try {
						sender.send(msg);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				}
					wr.setAttribute("findpassYes", true, WebRequest.SCOPE_REQUEST);
				return "/WEB-INF/views/account/login.jsp";
			} else {
					wr.setAttribute("findpassNo", 0, WebRequest.SCOPE_REQUEST);
				return "/WEB-INF/views/account/findpass.jsp";
			}
		}
	
	
	
	
}
