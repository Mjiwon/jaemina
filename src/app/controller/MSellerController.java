package app.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import app.model.MSellerDao;

@Controller
public class MSellerController {

	@Autowired
	MSellerDao mSellDao;
	
	@Autowired
	ServletContext ctx;
	
	@GetMapping("/addseller.do")
	public String addSellerHandle() {
		return "/WEB-INF/views/account/seller/addseller.jsp";
	}
	
	@PostMapping("/addseller.do")
	public String addSellerHandle(@RequestParam Map param,@RequestParam MultipartFile imgpath ,WebRequest wr) throws IOException {
		System.out.println(param);
		System.out.println(imgpath);
		
		String fileName = imgpath.getOriginalFilename();
		System.out.println(fileName);
		
		String path = ctx.getRealPath("/storage");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);
		System.out.println(path);
		
		imgpath.transferTo(dst);
		
		String img = path+"/"+fileName;
		System.out.println("살려줘" + img) ;
		
		Map m = (Map)wr.getAttribute("user", WebRequest.SCOPE_SESSION);
		param.put("id", (String)m.get("ID"));
/*		if(param.get("imgpath")!=null) {
			int i = mSellDao.addSeller1(param);
			System.out.println(i);			
		}else {
			System.out.println("들어옴?");
			int i = mSellDao.addSeller2(param);
			System.out.println(i);
		}*/
		return "/WEB-INF/views/account/seller/sellerHome.jsp";
	}
	
	

}
