package app.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import app.model.HoSellerRepository;

@Controller
public class HoSellerController {

	@Autowired
	HoSellerRepository hoSellerRepository;

	@Autowired
	ServletContext ctx;

	@RequestMapping("sellerpr.do")
	public String addSellerPostHandle(@RequestParam Map p, HttpSession session) {
		Map user = (Map) session.getAttribute("user");
		String id = (String) user.get("ID");
		Map Seller = hoSellerRepository.getSeller(id);
		session.setAttribute("Seller", Seller);

		return "/WEB-INF/views/account/seller/sellerHome.jsp";
	}

	@GetMapping("update_seller.do")
	public String UpdateSellerGetHandle() {
		return "/WEB-INF/views/account/seller/update_seller.jsp";
	}

	@PostMapping("update_seller.do")
	public String UpdateSellerPostHandle(@RequestParam Map p, @RequestParam MultipartFile imgpath, HttpSession session)
			throws IOException {

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
		System.out.println(img);
		p.put("imgpath", img);

		if (p.get("imgpath") != null) {
			int i = hoSellerRepository.updateSeller1(p);
			System.out.println(i);

		} else {
			System.out.println("요기오나요?");
			int j = hoSellerRepository.updateSeller2(p);
			System.out.println(j);
		}
		return "/WEB-INF/views/index.jsp";
	}
}