package app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellHistory {
	
	@RequestMapping("/sellHistory.do")
	public String sellHistoryHendle() {
		return "/WEB-INF/views/account/mypage/history/sellHistory.jsp";
	}
}
