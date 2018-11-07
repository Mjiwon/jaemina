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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
public class AccountSellerController {

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

	// ----------------------------------------------------------------------------------------------------------------------------
		// 판매자 등록 컨트롤러
		@GetMapping("/addseller.do")
		public String addSellerGetHandle() {
			return "/WEB-INF/views/account/seller/addseller.jsp";
		}

		@PostMapping("/addseller.do")
		public String addSellerHandle(@RequestParam Map param, @RequestParam MultipartFile imgpath, WebRequest wr, Map map)
				throws IOException {
			Map m = (Map) wr.getAttribute("user", WebRequest.SCOPE_SESSION);

			String id = (String) m.get("ID");

			param.put("id", id);

			String paramFileName = imgpath.getName();
			String fileName = id + "-seller" + "-" + paramFileName + ".jpg";
			String realpath = ctx.getRealPath("/storage/sellerProfile");
			String path = "/storage/sellerProfile";

			File dir = new File(realpath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File dst = new File(dir, fileName);
				imgpath.transferTo(dst);

			String img = path + "\\" + fileName;
				param.put("imgpath", img);

			if (param.get("imgpath") != null) {
				int i = profilerepo.addSeller1(param);
				System.out.println("addseller result : "+i);
				
			} else {
				int i = profilerepo.addSeller2(param);
				System.out.println("addseller result : "+i);
			}
				map.put("accountprofile",profilerepo.Sellerinfo(id));
			return "account.sellerHomme";
		}
		
		// 판매자 정보
		// 판매자 정보 페이지로 이동
		@RequestMapping("/sellerpr.do")
		public String addSellerPostHandle(@RequestParam Map p, HttpSession session) {
			Map user = (Map) session.getAttribute("user");
			String id = (String) user.get("ID");
			Map Seller = sellerrepo.getSeller(id);
			session.setAttribute("Seller", Seller);

			return "account.sellerHomme";
		}

		@GetMapping("/update_seller.do")
		public String UpdateSellerGetHandle() {
			return "/WEB-INF/views/account/seller/update_seller.jsp";
		}

		@PostMapping("/update_seller.do")
		public String UpdateSellerPostHandle(@RequestParam Map p, @RequestParam MultipartFile imgpath, HttpSession session)
				throws IOException {

			session.removeAttribute("Seller");
			Map user = (Map) session.getAttribute("user");
			String id = (String) user.get("ID");
			p.put("id", id);

			String paramFileName = imgpath.getName();
			String fileName = id + "-seller" + "-" + paramFileName + ".jpg";

			String realpath = ctx.getRealPath("/storage/sellerProfile");
			String path = "/storage/sellerProfile";
			File dir = new File(realpath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File dst = new File(dir, fileName);

			imgpath.transferTo(dst);

			String img = path + "/" + fileName;

			p.put("imgpath", img);

			if (p.get("imgpath") != null) {
				int i = sellerrepo.updateSeller1(p);

			} else {
				int j = sellerrepo.updateSeller2(p);
			}
			Map Seller = sellerrepo.getSeller(id);
				session.setAttribute("Seller", Seller);
			return "account.sellerHomme";
		}
		
	
}
