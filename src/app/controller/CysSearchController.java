package app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.models.LeeBoardRepository;

@Controller
public class CysSearchController {
	
	@Autowired
	LeeBoardRepository leeBoardRepository;
	
	@GetMapping("/search.do")
	public String searchController() {
		return "/WEB-INF/views/search.jsp";
	}
	
	@PostMapping("/searchList.do")
	public String searchListController(@RequestParam Map param, WebRequest wr, Map map) {
		String searchKey = (String)param.get("searchKey");
		List<Map> list = leeBoardRepository.getSearchList(searchKey);
		System.out.println(list);
		map.put("searchResult", list);
		return "/WEB-INF/views/searchList.jsp";
	}
}
