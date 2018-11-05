package app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BankAuthController {

	@GetMapping("/bankauth.do")
	public String bankauthGetHandle() {
		return "/WEB-INF/views/bank/bankauthinput.jsp";
	}
	
	@RequestMapping("/bankauthresult.do")
	public void bankauthresultHandle() {
		
	}
}
