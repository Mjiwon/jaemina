package app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import app.model.AccountRepository;

@Controller
public class AccountController {
Map<String, HttpSession> sessions;
	
	public AccountController() {
		sessions = new HashMap<>(); 
	}
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	JavaMailSender sender;
	
	@RequestMapping("/index.do")
	public String indexHendler(WebRequest wr) {
		if(wr.getAttribute("auth", WebRequest.SCOPE_SESSION) == null) {
			return "/WEB-INF/views/account/login.jsp";
		}else {
			return "/WEB-INF/views/index.jsp";
		}
	}
	
	@GetMapping("/login.do")
	public String loginGetHandler() {
		return "/WEB-INF/views/account/login.jsp";
	}
	
	@PostMapping("/login.do")
	public String loginPostHandler(WebRequest wr, Map map, HttpSession session) {
		String id = wr.getParameter("getId");
		String pass = wr.getParameter("getPass");
		
		map.put("id", id);
		map.put("pass", pass);
		Map mapp = accountRepository.getAccount(map);
		if(mapp != null) {
			wr.removeAttribute("err", 0);
			if(sessions.containsKey(id)) {
				sessions.remove("user");
				sessions.remove("auth");
				wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION);
				wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION);
			}else {				
				wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION);
				wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION);
			}
			return "/WEB-INF/views/index.jsp";
		}else {
			wr.setAttribute("err", true, 0);
			return "login.do";
		}
	}
	
	@GetMapping("/join.do")
	public String joinGetHandler() {
		return "/WEB-INF/views/account/join.jsp";
	}
	
	//email 인증 전송
	@RequestMapping("/mail.do")
	@ResponseBody
	public String sendTest(@RequestParam Map param,WebRequest wr) {
		String receiver = (String) param.get("email");
		SimpleMailMessage msg = new SimpleMailMessage();
		sender.createMimeMessage();
		msg.setSubject("재미나 이메일 인증번호");
		String text="아래의 인증키를 입력해주세요\n";
		String confirm = UUID.randomUUID().toString().split("-")[0];
		System.out.println(receiver);
		text += confirm;
		wr.setAttribute("confirmKey", confirm, WebRequest.SCOPE_SESSION);
		msg.setText(text);
		msg.setTo(receiver);
		msg.setFrom("amdin@jamina.mockingu.com");
		
		try {
			sender.send(msg);
			System.out.println("SUCCESS!");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Fail!");
		}
		return text;
	}
	
	// email인증 ajax
	@RequestMapping("/emailauth.do")
	@ResponseBody
	public String emailauthHandle(@RequestParam Map param, WebRequest wr) {
		String confirm = (String)wr.getAttribute("confirmKey", WebRequest.SCOPE_SESSION);
		String confirm1 = (String)param.get("confirmkey");
		String rst;
		wr.removeAttribute("confirmKey", WebRequest.SCOPE_SESSION);
		if(confirm.equals(confirm1)) {
			rst = "true";
			wr.setAttribute("rst", rst, WebRequest.SCOPE_SESSION);
			System.out.println(rst);
			return rst;
		}else {
			rst = null;
			wr.setAttribute("rst", rst, WebRequest.SCOPE_SESSION);
			System.out.println(rst);
			return rst;
		}
	}
	
	@PostMapping("/join.do")
	public String joinPostHandler(WebRequest wr, Map map) {
		String id = wr.getParameter("getId");
		String pass = wr.getParameter("getPass1");
		String pass1 = wr.getParameter("getPass2");
		String email = wr.getParameter("getEmail");
		map.put("id", id);
		map.put("pass", pass);
		map.put("email", email);
		accountRepository.addUser(map);
		
		return "/WEB-INF/views/account/login.jsp";
	}
	
	@RequestMapping("/joinid_check.do")
	@ResponseBody
	public String joinIdCheckHandler(HttpServletRequest req) throws IOException {
		
		String w = req.getParameter("w");
		Map map = accountRepository.getAccountById(w);
		Gson gson = new Gson();
		String json = gson.toJson(map);
		return json;
	}
	
	@RequestMapping("/joinemail_check.do")
	@ResponseBody
	public String joinEmailCheckHandler(HttpServletRequest req) throws IOException {
		
		String w = req.getParameter("w");
		Map map = accountRepository.getAccountByEmail(w);
		Gson gson = new Gson();
		String json = gson.toJson(map);
		return json;
	}
	@RequestMapping("/hello.do")
	public String helloHendler() {
		return "/WEB-INF/views/index.jsp";
	}
}
