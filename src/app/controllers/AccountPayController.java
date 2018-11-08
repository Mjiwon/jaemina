package app.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.models.BoardRepository;
import app.models.PayRepository;

@Controller
public class AccountPayController {
	
	@Autowired
	PayRepository payrepo;
	
	@Autowired
	BoardRepository boardrepo;
	
	
	@GetMapping("/sellmanagement.do")
	public String sellmanagementGetHandle(HttpSession session, Map map) {
		// seller 의  아이디 뽑기
		String seller = (String)session.getAttribute("loginId");
		// seller 의 판매 내역을 뽑아오기
		List<Map> mysellList = payrepo.getMysellList(seller);
		// view로 판매내역을 전달해 주기
		if(mysellList!=null) {
			map.put("sellList", mysellList);
			map.put("sellListCnt", mysellList.size());
			
		}
		
		// board에 타이틀 가져오기
		List<Map> myboardlist = boardrepo.getmyboard(seller);
		
		return "mypage.sellmanagement";
	}
	
	@GetMapping("/managesellstate.do")
	public String managesellstateGetHandle(@RequestParam Map param) {
		
		return "";
	}
}
