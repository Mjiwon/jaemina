package app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.model.MSellerDao;

@Controller
public class MSellerController {

	@Autowired
	MSellerDao mSellDao;
	
	@GetMapping("/addseller.do")
	public String addSellerHandle() {
		return "/WEB-INF/views/account/seller/addseller.jsp";
	}
	
	@PostMapping("/addseller.do")
	public String addSellerHandle(@RequestParam Map param,WebRequest wr) {
		System.out.println(param);
		param.put("id", "jiwoni");
		System.out.println("/"+param.get("imgpath"));
		if(param.get("imgpath")!=null) {
			int i = mSellDao.addSeller1(param);
			System.out.println(i);			
		}else {
			System.out.println("들어옴?");
			int i = mSellDao.addSeller2(param);
			System.out.println(i);
		}
		return "/WEB-INF/views/account/seller/addseller.jsp";
	}
}
