package app.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.model.EunAccountRepository;

@Controller
public class EunAccountController {

@Autowired
EunAccountRepository eunAccountRepository;

@GetMapping("/addbank.do")
public String AddBankGetHandle() {
	System.out.println("GET확인");
	return "/WEB-INF/views/imaccout/addbank.jsp";
}

@PostMapping("/addbank.do")
public String AddBankPostHandle(@RequestParam Map bank,HttpSession session) {
	System.out.println(bank);
	int i = eunAccountRepository.addbank(bank);
	System.out.println(i+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	if(i==1) {
		System.out.println("성공");
		return "/WEB-INF/views/imaccout/success.jsp";		
	}else
		System.out.println("실패");
		return "/WEB-INF/views/imaccout/addbank.jsp";
	

}
}
