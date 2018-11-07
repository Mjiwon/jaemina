package app.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		// ID 뽑기
		String id = (String) ((Map)session.getAttribute("user")).get("ID");
		
		// account_profile's bank 뽑아오기
		Map duser = (Map) profilerepo.Sellerinfo(id);
		String dbank = (String) duser.get("BANK");

		// 이미 등록했으면 판매글 오리기로 이동
		if (dbank == null) {
			// bank 가 등록되지 않았으면 bank 등록페이지로 이동
			return "/WEB-INF/views/account/seller/addbank.jsp";
		} else {
			// bank 가 등록되어 있으면 인덱스로 이동.
			return "account.index";
		}
	}
	
	@PostMapping("/addbank.do")
	public String addBankPostHandle(@RequestParam Map param, HttpSession session) {
		String bankname = (String)param.get("bankname");
		String banknum = (String)param.get("bank");
		String bank = bankname+banknum;
		Map data = new HashMap();
		data.put("id", (String)((Map)session.getAttribute("user")).get("ID"));
		data.put("bank", bank);
		System.out.println("addbank data : "+data);
		int r = profilerepo.updateProfileBank(data);
		if(r == 1) {
			System.out.println("addbank result : "+r);
			return "account.sellerHomme";
		}else {
			System.out.println("addbank result : "+r);
			// 은행 계좌 실패 알려줌
			return "account.sellerHomme";
		}
	}
	
	
	
	
	
	
}
