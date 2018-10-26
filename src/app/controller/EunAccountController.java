package app.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import app.model.EunAccountRepository;
import app.model.MSellerDao;

@Controller
public class EunAccountController {

	@Autowired
	EunAccountRepository eunAccountRepository;

	@Autowired
	MSellerDao mSellDao;

	@Autowired
	ServletContext ctx;

	@GetMapping("/addbank.do")
	public String AddBankGetHandle(HttpSession sesion) {
		/*
		 * 이미 계좌 등록한 계좌 막기 세션 이용해서 BANK값이 널이 아니면 차단
		 *
		 */
		System.out.println("GET확인");
		return "/WEB-INF/views/account/seller/addbank.jsp";
	}

	@PostMapping("/addbank.do")
	public String AddBankPostHandle(@RequestParam Map p, HttpSession session) {
		Map user = (Map) session.getAttribute("user");
		String id = (String) user.get("ID");
		System.out.println(id);
		p.put("id", id);
		System.out.println(p);
		String banknumber = (String) p.get("bank");
		System.out.println(banknumber);
		String bankname = (String) p.get("bankname");
		System.out.println(bankname);
		String regEx = "\\d{12}|(\\d{4}-\\d{5}-\\d{6})$";
		if (banknumber.matches(regEx)) {
			p.put("bank", bankname + "/" + banknumber);
			int i = eunAccountRepository.addbank(p);
			System.out.println(i + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			if (i == 1) {
				System.out.println("성공");
				return "/WEB-INF/views/account/seller/success.jsp";
			} else
				System.out.println("실패");
			return "/WEB-INF/views/account/seller/addbank.jsp";

		} else {
			return "/WEB-INF/views/account/seller/addbank.jsp";
		}
	}

	@GetMapping("/addseller.do")
	public String addSellerGetHandle() {
		return "/WEB-INF/views/account/seller/addseller.jsp";
	}

	@PostMapping("/addseller.do")
	public String addSellerHandle(@RequestParam Map param, @RequestParam MultipartFile imgpath, WebRequest wr) throws IOException {

		Map m = (Map) wr.getAttribute("user", WebRequest.SCOPE_SESSION);
		String id = (String) m.get("ID");

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
		System.out.println(img);
		param.put("imgpath", img);

		param.put("imgpath", img);

		if (param.get("imgpath") == null) {
			int i = mSellDao.addSeller1(param);
			System.out.println(i);
		} else {
			System.out.println("들어옴?");
			int i = mSellDao.addSeller2(param);
			System.out.println(i);
		}
		return "/WEB-INF/views/account/seller/sellerHome.jsp";
	}
}
