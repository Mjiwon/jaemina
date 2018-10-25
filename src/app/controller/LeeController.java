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
import app.models.LeeBoardRepository;
import app.models.LeeSmallCateRepository;

@Controller
public class LeeController {
	
	@Autowired
	Gson gson;
	
	@Autowired
	LeeBoardRepository boardrepo;
	
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
		if(map.get("imgpath")!=null) {
			int r = boardrepo.addBoard1(map);			
		}else {
			int r = boardrepo.addBoard2(map);
		}
		
		System.out.println("map : "+map);
		return "";
	}
	
	// 웹에서 한글깨짐을 방지하기 위해서 아래 설정을 해준다.
	@RequestMapping(path="/ajax/cate.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String cateAjaxHandle(@RequestParam String bigno) {
		//System.out.println("GET param : "+bigno);
		int bno = Integer.parseInt(bigno);
		List<Map> scatelist = scaterepo.getSmallCate(bno);
		//System.out.println("scatelist : "+scatelist);
		
		return gson.toJson(scatelist);
	}
}
