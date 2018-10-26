﻿package app.controllers;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import app.models.BoardRepository;
import app.models.QAMessageRepository;
import app.service.SocketService;

@Controller
public class BoardController {
	@Autowired
	Gson gson;
	
	@Autowired
	BoardRepository boardrepo;
	
	@Autowired
	ServletContext ctx;
	
	// 게시글 
	// 판매글로 이동
	@GetMapping("/write.do")
	public String writeGetHandle(Map map) {
		List<Map> bcatelist = boardrepo.getBigCate();
		map.put("bigcate", bcatelist);
		 
		return "/WEB-INF/views/write.jsp";
	}

	// 판매글 DB에 insert
	@PostMapping("/write.do")
	public String writePostHandle(@RequestParam Map map,@RequestParam MultipartFile imgpath) throws IOException {
		// 파일(이미지) 업로드
		String filename = map.get("writer") +"-"+map.get("title")+"-board"+".jpg";
		String path = ctx.getRealPath("/storage/board");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, filename);
		if(imgpath==null) {
			boardrepo.addBoard1(map);
		}else {
			imgpath.transferTo(dst);
			map.put("imgpath", "/storage/board"+"\\"+filename);
			boardrepo.addBoard2(map);
		}
		return "/WEB-INF/views/index.jsp";
	}
	
	// 카테고리 분류의 AJAX
	// 웹에서 한글깨짐을 방지하기 위해서 아래 설정을 해준다.
	@RequestMapping(path="/ajax/cate.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String cateAjaxHandle(@RequestParam String bigno) {
		int bno = Integer.parseInt(bigno);
		List<Map> scatelist = boardrepo.getSmallCate(bno);
		
		return gson.toJson(scatelist);
	}
	
	// 판매글 불러오기
	@GetMapping("/board/list.do")
	public String boardListHandle(Map map) {
		map.put("boardlist", boardrepo.getBoardList());
		return "/WEB-INF/views/boardlist.jsp";
	}
	
	// 상세페이지
	@RequestMapping("/board/detail.do")
	public String boardDetailHandle(@RequestParam Map param, Map map) {
		int detailno = Integer.parseInt((String)param.get("no"));
		Map detail = boardrepo.getDetailBoard(detailno);
		map.put("detail", detail);
		return "/WEB-INF/views/detail.jsp";
	}
	
	// 문의하기 기능 (WebSocket -> 로그인 안되어 있으면 쪽지)
	
	@Autowired
	SocketService socketService;
	
	@Autowired
	QAMessageRepository mrepo;
	
	@GetMapping("/qa/buyqa.do")
	public String buyqaHandle(@RequestParam Map param, Map map, HttpSession session) {
		map.put("writer", (String)param.get("writer"));
		map.put("no", Integer.parseInt((String)param.get("no")));
		return "/WEB-INF/views/buyqa.jsp";
	}
	//----------------------------------------------------------------------------------------------------------------------------
	
	@GetMapping("/search.do")
	public String searchController() {
		return "/WEB-INF/views/search.jsp";
	}
	
	@PostMapping("/searchList.do")
	public String searchListController(@RequestParam Map param, WebRequest wr, Map map) {
		String searchKey = (String)param.get("searchKey");
		List<Map> list = boardrepo.getSearchList(searchKey);
		System.out.println(list);
		map.put("searchResult", list);
		return "/WEB-INF/views/searchList.jsp";
	}
	// 구매 결정 컨트롤러
	// 구현중
	@PostMapping("/choespayment.do")
	public String choespaymentHandle(@RequestParam Map param, @RequestParam String[] cardnum) {
		System.out.println(param);
		String[] cardnumber = new String[cardnum.length];
		for(int i = 0; i<cardnum.length;i++) {
			cardnumber[i]=cardnum[i];
		}
		param.put("cardnum", cardnumber);
		System.out.println(param);
		return "/index.do";
	}
	
	//----------------------------------------------------------------------------------------------------------------------------
	// 쪽지구현
	@PostMapping("/qa/buyqa.do")
	public String buyqaPostHandle(@RequestParam Map map, HttpSession session) {
	
		Map data = (Map)session.getAttribute("user");
		String sender = (String)data.get("ID");  
		map.put("sender", sender);
		int r = mrepo.addMsg(map);
		
		return "/WEB-INF/views/qaresult.jsp";
	}
	
	
}