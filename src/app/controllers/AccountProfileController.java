package app.controllers;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 판매자 등록
	@GetMapping("/addseller.do")
	public String AddBankGetHandle(HttpSession session) {
		Map suser = (Map) session.getAttribute("user");
		String sid = (String) suser.get("ID");
		Map duser = (Map) accountrepo.Myinfo(sid);
		// 이미 등록했으면 판매글 오리기로 이동
		Map dseller = (Map) profilerepo.Sellerinfo(sid);
		if (dseller == null) {
			return "/WEB-INF/views/account/seller/addseller.jsp";
		} else
			return "redirect:/write.do";
	}

	@PostMapping("/addseller.do")
	public String addSellerHandle(@RequestParam Map param, @RequestParam MultipartFile imgpath, WebRequest wr)
			throws IOException {
		System.out.println(param+"들어올떄");
		Map m = (Map) wr.getAttribute("user", WebRequest.SCOPE_SESSION);
		String id = (String) m.get("ID");
		param.put("id", id);
		
		String banknumber = (String) param.get("bank");
		String bankname = (String) param.get("bankname");
		String regEx = "\\d{12}|(\\d{4}-\\d{5}-\\d{6})$";
		if (banknumber.matches(regEx)) {
			param.put("bank", bankname + "/" + banknumber);
			param.remove("bankname");
			
		String paramFileName = imgpath.getName();
		String fileName = id + "-seller" + "-" + paramFileName + ".jpg";
		String realpath = ctx.getRealPath("\\storage\\sellerProfile");
		String path = "\\storage\\sellerProfile";
		 

		File dir = new File(realpath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);
		imgpath.transferTo(dst);

		String img = path + "\\" + fileName;
		param.put("imgpath", img);

		System.out.println("뭐나오냐"+param);
		
		
		if (param.get("imgpath") != null) {
			int i = profilerepo.addSeller1(param);
			Map sellerinfo=profilerepo.Sellerinfo(id);
			wr.setAttribute("sellerinfo", sellerinfo,WebRequest.SCOPE_SESSION);
		} else {
			int i = profilerepo.addSeller2(param);
			Map sellerinfo=profilerepo.Sellerinfo(id);
			wr.setAttribute("sellerinfo", sellerinfo,WebRequest.SCOPE_SESSION);
		}
		return "redirect:/jaemilog.do";
		
	}else {
		return "redirect:/index.do";
	}
	
	}
	
}
