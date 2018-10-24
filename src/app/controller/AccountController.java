package app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
