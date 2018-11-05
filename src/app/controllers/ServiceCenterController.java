package app.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import app.models.AdminQARepository;

@Controller
public class ServiceCenterController {
	
	@Autowired
	AdminQARepository adminqarepo;
	
	@GetMapping("/serviceqa.do")
	public String serviceQaHandle() {
		return "/WEB-INF/views/servicecenter/serviceqa.jsp";
	}
	
	@PostMapping("/serviceqa.do")
	public String serviceQAPostHandle(@RequestParam Map param, @RequestParam MultipartFile imgpath) {
		if(imgpath == null) {
			int r = adminqarepo.addadminQA1(param);
			return "";
		}else {
			Map data = param;
			String path = imgpath.toString();
			data.put("imgpath", path);
			int r = adminqarepo.addadminQA2(data);
			return "";
		}
	}
}
