package app.controllers;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	// 판매관리
	@GetMapping("/managesell.do")
	public String managesellGetHandle(Map map) {
		
		return "mypage.managesell";
	}
	
	// 구매관리
	@GetMapping("/managebuy.do")
	public String managebuyGetHandle(Map map) {
		
		return "mypage.managebuy";
	}
	
	// 판매자 등록 인증시 1원 결제
	
	
	// 판매자 등록 인승성공후 1원 환불
	
}
