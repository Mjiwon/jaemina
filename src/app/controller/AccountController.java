package app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

	@RequestMapping("/index.do")
	public String indexHendler() {
		return "/WEB-INF/views/index.jsp";
	}
	@RequestMapping("/hello.do")
	public String helloHendler() {
		return "/WEB-INF/views/index.jsp";
	}
}
