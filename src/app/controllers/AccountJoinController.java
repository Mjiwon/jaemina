package app.controllers;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

public class AccountJoinController {

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
	
	// 회원가입
		@GetMapping("/join.do")
		public String joinGetHandler() {
			return "/WEB-INF/views/account/join.jsp";
		}

		// email 인증 전송
		@RequestMapping("/mail.do")
		@ResponseBody
		public String sendTest(@RequestParam Map param, WebRequest wr) {
			String receiver = (String) param.get("email");
			SimpleMailMessage msg = new SimpleMailMessage();
			sender.createMimeMessage();
			msg.setSubject("재미나 이메일 인증번호");
			String text = "아래의 인증키를 입력해주세요\n";
			String confirm = UUID.randomUUID().toString().split("-")[0];
			text += confirm;
			wr.setAttribute("confirmKey", confirm, WebRequest.SCOPE_SESSION);
			msg.setText(text);
			msg.setTo(receiver);
			msg.setFrom("amdin@jamina.mockingu.com");

			try {
				System.out.println("성공");
				sender.send(msg);
			} catch (Exception e) {
				System.out.println("실패");
				// TODO: handle exception
				e.printStackTrace();
			}
			return text;
		}

		// email인증 ajax
		@RequestMapping("/emailauth.do")
		@ResponseBody
		public String emailauthHandle(@RequestParam Map param, WebRequest wr) {
			String confirm = (String) wr.getAttribute("confirmKey", WebRequest.SCOPE_SESSION);
			String confirm1 = (String) param.get("confirmkey");
			String rst;
			wr.removeAttribute("confirmKey", WebRequest.SCOPE_SESSION);
			if (confirm.equals(confirm1)) {
				rst = "true";
				wr.setAttribute("rst", rst, WebRequest.SCOPE_SESSION);
				return rst;
			} else {
				rst = null;
				wr.setAttribute("rst", rst, WebRequest.SCOPE_SESSION);
				return rst;
			}
		}

		@PostMapping("/join.do")
		public String joinPostHandler(WebRequest wr, Map map) {
			String id = wr.getParameter("getId");
			String pass = wr.getParameter("getPass");
			String confirmPass = wr.getParameter("getPass1");
			String email = wr.getParameter("getEmail");
			
			if (pass.equals(confirmPass)) {
				map.put("id", id);
				map.put("pass", pass);
				map.put("email", email);
				accountrepo.addUser(map);
				
				System.out.println(map);
				
				wr.setAttribute("joinYes", true, WebRequest.SCOPE_REQUEST);
				return "/WEB-INF/views/account/join.jsp";
			}else {
				return "/WEB-INF/views/account/join.jsp";  //맵핑 다시 잡아야됌
			}
			
		}

		@RequestMapping("/joinid_check.do")
		@ResponseBody
		public String joinIdCheckHandler(HttpServletRequest req) throws IOException {

			String w = req.getParameter("w");
			Map map = accountrepo.getAccountById(w);
			Gson gson = new Gson();
			String json = gson.toJson(map);
			return json;
		}

		@RequestMapping("/joinemail_check.do")
		@ResponseBody
		public String joinEmailCheckHandler(HttpServletRequest req) throws IOException {

			String w = req.getParameter("w");
			Map map = accountrepo.getAccountByEmail(w);
			Gson gson = new Gson();
			String json = gson.toJson(map);
			return json;
		}
		
		
	
	
	
}
