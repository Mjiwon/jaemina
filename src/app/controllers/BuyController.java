package app.controllers;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.BuyRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.service.SocketService;

@Controller
public class BuyController {

	@Autowired
	Gson gson;

	@Autowired
	AccountRepository accountrepo;

	@Autowired
	BoardRepository boardrepo;

	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	SocketService socketService;

	@Autowired
	QAMessageRepository mrepo;

	@Autowired
	ServletContext ctx;
	
	@Autowired
	BuyRepository buyrepo;
	//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
	/*// 구매하기
	@PostMapping("/buyBefore.do")
	public String buyPostHandle(@RequestParam Map param, HttpSession session, Map map) {
		System.out.println("param : "+param);
		Map buyer = (Map)session.getAttribute("user");
			param.put("buyeremail", (String)buyer.get("EMAIL"));
			map.put("buy", param);
		return "buy.before";
	}*/
			
			
			
	@PostMapping("/ajax/buy.do")
	@ResponseBody
	public String buyHandle(@RequestParam Map param) {
		int r = buyrepo.addBuy(param);
		System.out.println("buy result : "+r);
		String rst = "\"rst\":true";
		return gson.toJson(rst);
	}
	
}
