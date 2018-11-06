package app.controllers;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.CateRepository;
import app.models.ProfileRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.models.WishlistRepository;

@Controller
public class AccountProfileController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	Gson gson;

	@Autowired
	BoardRepository boardrepo;

	@Autowired
	AccountRepository accountrepo;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	QAMessageRepository oamr;

	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	CateRepository caterepo;
	
	@Autowired
	WishlistRepository wishrepo;
	
	@Autowired
	ProfileRepository profilerepo;
	
	// 판매자 계좌번호 등록
	@GetMapping("/addbank.do")
	public String AddBankGetHandle(HttpSession session) {
		Map suser = (Map) session.getAttribute("user");
		String sid = (String) suser.get("ID");
		Map duser = (Map) accountrepo.Myinfo(sid);
		String dbank = (String) duser.get("BANK");

		// 이미 등록했으면 판매글 오리기로 이동
		Map dseller = (Map) profilerepo.Sellerinfo(sid);

		if (dbank == null) {
			return "/WEB-INF/views/account/seller/addbank.jsp";
		} else if (dseller == null) {
			return "/WEB-INF/views/account/seller/addseller.jsp";
		} else
			return "redirect:/write.do";
	}
	
	// 판매자 인증 AJAX
	@PostMapping("/addbank.do")
	@ResponseBody
	public String addbankAjaxHandle(@RequestParam Map param) {
		int r = accountrepo.addbank(param);
		System.out.println("addbank result : "+r);
		String rst = "";
		if(r==1) {
			rst = "\"rst\":true";
		}else {
			rst = "\"rst\":false";
		}
		return gson.toJson(rst);
	}
	
	
	
	
}
