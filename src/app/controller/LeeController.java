package app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import app.models.LeeBigCateRepository;
import app.models.LeeSmallCateRepository;

@Controller
public class LeeController {
	
	@Autowired
	Gson gson;
	
	@Autowired
	LeeBigCateRepository bcaterepo;
	
	@Autowired
	LeeSmallCateRepository scaterepo;
	
	@GetMapping("/write.do")
	public String writeGetHandle(Map map) {
		List<Map> bcatelist = bcaterepo.getBigCate();
		map.put("bigcate", bcatelist);
		
		
		return "/WEB-INF/views/write.jsp";
	}
	@PostMapping("/write.do")
	public String writePostHandle(@RequestParam Map map) {
		System.out.println("map : "+map);
		return "";
	}
	
	@RequestMapping("/ajax/cate.do")
	public String cateAjaxHandle(@RequestParam Map bigno) {
		int bno = Integer.parseInt((String)bigno.get("data"));
		List<Map> scatelist = scaterepo.getSmallCate(bno);
		return gson.toJson(scatelist);
	}
}
