package app.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

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
import app.models.WishlistRepository;
import app.service.SocketService;

@Controller

public class WishlistController {

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
	WishlistRepository wishrepo;

	@Autowired
	ServletContext ctx;
	
	
	@RequestMapping("/addWishlist.do")
	public String addWishListHandle(@RequestParam Map param, WebRequest wr, Map map) {
		String buyer = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		String seller = (String) param.get("writer");
		int no = Integer.parseInt((String)param.get("no"));
		Map wish = new HashMap<>();
		wish.put("buyer", buyer);
		wish.put("seller", seller);
		wishrepo.addWishlist(wish);
		map.put("no", no);

		return "redirect:board/detail.do";
	}
	
	@RequestMapping("/deleteWishlist.do")
	public String deleteWishListHandle(@RequestParam Map param, WebRequest wr, Map map) {
		String buyer = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		String seller = (String) param.get("writer");
		int no = Integer.parseInt((String)param.get("no"));
		Map wish = new HashMap<>();
		wish.put("buyer", buyer);
		wish.put("seller", seller);
		wishrepo.deleteWishList(wish);
		map.put("no", no);
		
		return "redirect:board/detail.do";
	}
}
