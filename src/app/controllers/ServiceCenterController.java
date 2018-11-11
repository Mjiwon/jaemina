package app.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import app.models.AdminQARepository;
import app.models.CateRepository;

@Controller
public class ServiceCenterController {
	
	@Autowired
	AdminQARepository adminqarepo;
	
	@Autowired
	CateRepository caterepo;
	
	@GetMapping("/serviceqa.do")
	public String serviceQaHandle(Map map) {
		List<Map> bcatelist = caterepo.getBigCate();
		List<Map> scatelist = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelist);
		map.put("bigcate", bcatelist);
		return "account.serviceqa";
	}
	
	@PostMapping("/serviceqa.do")
	public String serviceQAPostHandle(@RequestParam Map param, Map map) {
		adminqarepo.addadminQA1(param);
		List<Map> bcatelist = caterepo.getBigCate();
		List<Map> scatelist = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelist);
		map.put("bigcate", bcatelist);
		return "mypage.receiveqa";
	}
	
	@RequestMapping("/receiveqa.do")
	public String receiveQAHandle(WebRequest wr, Map map) {
		String id = (String)wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		System.out.println(" 로그인 "+id);
		List<Map> receiveList = adminqarepo.getReceiveQA(id);
		map.put("receive", receiveList);
		List<Map> bcatelist = caterepo.getBigCate();
		List<Map> scatelist = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelist);
		map.put("bigcate", bcatelist);
		System.out.println(receiveList);
		return "mypage.receiveqa";
	}
}
