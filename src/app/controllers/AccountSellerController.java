package app.controllers;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

	// 판매자 정보
	// 판매자 정보 페이지로 이동
	@RequestMapping("/sellerpr.do")
	public String addSellerPostHandle(@RequestParam Map p, HttpSession session) {
		Map user = (Map) session.getAttribute("user");
		String id = (String) user.get("ID");
		Map Seller = sellerrepo.getSeller(id);
		session.setAttribute("Seller", Seller);

		return "WEB-INF/views/account/seller/sellerHome.jsp";
	}

	// 재미로그
	@RequestMapping("/jaemilog.do")
	public String MyBoardHandle(HttpSession session, @RequestParam int currentPage, Map map, WebRequest wr) {
		wr.setAttribute("Myck", true, WebRequest.SCOPE_REQUEST);
		Map suser = (Map) session.getAttribute("user");
		String id = (String) suser.get("ID");
		Map duser = sellerrepo.getSeller(id);

		if (duser != null) {
			List<Map> MyBoard = boardrepo.getmyboard(id);
			int startCount = (currentPage - 1) * 9 + 1;
			int endCount = currentPage * 9;
			int boardCount = boardrepo.getmyboard(id).size();
			int totalPage = boardCount / 9;
			if ((boardCount % 9) > 0) {
				totalPage++;
			}

			Map mapp = new HashMap<>();
			mapp.put("writer", id);
			mapp.put("startCount", startCount);
			mapp.put("endCount", endCount);

			map.put("MyBoard", boardrepo.getBoardListBySellerForPasing(mapp));
			map.put("totalPage", totalPage);
			map.put("currentPage", currentPage);

			// 판매자 정보 가지고 오기

			String myboardcount = sellerrepo.myboardcount(id);
			if (myboardcount == null)
				myboardcount = "0";

			String wishcount = sellerrepo.wishcount(id);
			if (wishcount == null)
				wishcount = "0";
			String staravg = sellerrepo.staravg(id);
			if (staravg == null)
				staravg = "0";

			Map Seller = sellerrepo.getSeller(id);
			session.setAttribute("Seller", Seller);
			Seller.put("myboardcount", myboardcount);
			Seller.put("wishcount", wishcount);
			Seller.put("staravg", staravg);

			return "WEB-INF/views/account/seller/sellerHome.jsp";
		} else
			return "redirce:addseller.do";
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
		return "/WEB-INF/views/account/seller/update_seller2.jsp";
	}

}
