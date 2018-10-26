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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import app.models.LeeBigCateRepository;
import app.models.LeeBoardRepository;
import app.models.LeeQAMessageRepository;
import app.models.LeeSmallCateRepository;
import app.service.SocketService;

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
	
	@Autowired
	ServletContext ctx;
	
	// 게시글
	// 판매글로 이동
	@GetMapping("/write.do")
	public String writeGetHandle(Map map) {
		List<Map> bcatelist = bcaterepo.getBigCate();
		map.put("bigcate", bcatelist);
		 
		return "/WEB-INF/views/write.jsp";
	}

	// 판매글 DB에 insert

	@PostMapping("/write.do")
	public String writePostHandle(@RequestParam Map map,@RequestParam MultipartFile imgpath) throws IOException {
		// 파일(이미지) 업로드
		System.out.println("param : "+map);
		System.out.println("imgpath : "+imgpath);
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
			map.put("imgpath", path+"\\"+filename);
			boardrepo.addBoard2(map);
		}

		return "";
	}
	
	// 카테고리 분류의 AJAX
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
	

}
