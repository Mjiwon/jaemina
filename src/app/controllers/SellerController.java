package app.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.service.SocketService;

@Controller
public class SellerController {

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
	
	@RequestMapping("/sellerboardlist.do")
	public String sellerBoardListHandle(@RequestParam Map param, WebRequest wr, Map map, HttpSession session) {
			wr.setAttribute("Sellerck", true, WebRequest.SCOPE_REQUEST);
		String seller = (String) param.get("seller");
		int currentPage = Integer.parseInt((String)param.get("currentPage"));
		Map duser = accountrepo.Myinfo(seller);
		String dbank = (String) duser.get("BANK");
		List<Map> MyBoard = boardrepo.getmyboard(seller);
		int startCount = (currentPage - 1) * 4 + 1;
		int endCount = currentPage * 4;
		int boardCount = boardrepo.getmyboard(seller).size();
		int totalPage = boardCount / 4;
		if ((boardCount % 4) > 0) {
			totalPage++;
		}
			Map mapp = new HashMap<>();
			mapp.put("writer", seller);
			mapp.put("startCount", startCount);
			mapp.put("endCount", endCount);
		
			map.put("MyBoard", boardrepo.getBoardListBySellerForPasing(mapp));
			map.put("totalPage", totalPage);
			map.put("currentPage", currentPage);
			session.setAttribute("MyBoard", MyBoard);
			
			
			
			String myboardcount=sellerrepo.myboardcount(seller);
			if(myboardcount==null)
				myboardcount="0";
			
			String wishcount =sellerrepo.wishcount(seller);
				if(wishcount==null)
				wishcount="0";
			String staravg =sellerrepo.staravg(seller);
			if(staravg==null)
				staravg="0";
		// 판매자 정보 가지고 오기
			Map Seller = sellerrepo.getSeller(seller);
			session.setAttribute("Seller", Seller);
			Seller.put("myboardcount", myboardcount);
			Seller.put("wishcount",wishcount);
			Seller.put("staravg", staravg);		
			System.out.println(Seller);
		return "WEB-INF/views/account/seller/sellerHome.jsp";
	}
	
	
}
