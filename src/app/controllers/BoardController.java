package app.controllers;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import app.models.SellerRepository;
import app.service.SocketService;

@Controller
public class BoardController {

	@Autowired
	Gson gson;
	
	@Autowired
	BoardRepository boardrepo;
	
	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	ServletContext ctx;
	
	// 게시글 
	// 전체 게시글 갯수 불러오기
	
	
	// 판매글로 이동
	@GetMapping("/write.do")
	public String writeGetHandle(Map map) {
		List<Map> bcatelist = boardrepo.getBigCate();
		map.put("bigcate", bcatelist);
		 
		return "account.boardWrite";
	}

	// 판매글 DB에 insert
	@PostMapping("/write.do")
	public String writePostHandle(@RequestParam Map map,@RequestParam MultipartFile imgpath, WebRequest wr) throws IOException {
		// 파일(이미지) 업로드
		Integer no = boardrepo.getSequenceVal();
		map.put("no", no);
		
		String filename = map.get("writer")+"-"+no +"-"+map.get("title")+"-board"+".jpg";
		String path = ctx.getRealPath("\\storage\\board");
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, filename);
		imgpath.transferTo(dst);
		
		String img = path+"\\"+filename;
		
		if(imgpath==null) {
			boardrepo.addBoard1(map);
		}else {
			map.put("imgpath", "\\storage\\board"+"\\"+filename);
			boardrepo.addBoard2(map);
			
		}
		return "redirect:/board/detail.do?no="+no;
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
	public String boardListHandle(Map map, WebRequest wr) {
		map.put("boardlist", boardrepo.getBoardList());
		wr.removeAttribute("searchLog", WebRequest.SCOPE_SESSION);
		return "account.boardlist";
	}
	
	
	@RequestMapping("/board/lists.do")
	public String boardListHandle(@RequestParam int bigcate, Map map) {
		map.put("boardlist", boardrepo.getCateBoard(bigcate));
		
		return "account.boardlist";
	}
	
	// 상세페이지
	@RequestMapping("/board/detail.do")
	public String boardDetailHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = Integer.parseInt((String)param.get("no"));
		Map detail = boardrepo.getDetailBoard(detailno);
		String sellerid = (String)detail.get("WRITER");
		Map writer = sellerrepo.getSeller(sellerid);
		String id = (String)wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		
		String bigcate = ((BigDecimal)detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal)detail.get("SMALLCATE")).toString();
		
		Map cates = new HashMap<>();
		cates.put("bigcate", bigcate);
		cates.put("smallcate", smallcate);
		
		Map cate = boardrepo.getCate(cates);
		
		map.put("detail", detail);
		map.put("writer", writer);
		map.put("cate", cate);
		
		if(sellerid.equals(id)) {
			return "account.boardDetail";
		} else {
			return "account.boardDetail";
		}
	}
	
	@RequestMapping("/board/modifyDetail.do")
	public String boardModifyHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = Integer.parseInt((String)param.get("no"));
		Map detail = boardrepo.getDetailBoard(detailno);
		
		//카테고리 가져오기
		String bigcate = ((BigDecimal)detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal)detail.get("SMALLCATE")).toString();
		
		Map cates = new HashMap<>();
		cates.put("bigcate", bigcate);
		cates.put("smallcate", smallcate);
		
		Map cate = boardrepo.getCate(cates);
		
		map.put("detail", detail);
		map.put("cate", cate);
		
		wr.setAttribute("boardNum", detailno, WebRequest.SCOPE_SESSION);
		return "/WEB-INF/views/board/detailModify.jsp";
	}
	
	@RequestMapping("/board/detailUpdate.do")
	public String boardDetailUpdateHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = (int) wr.getAttribute("boardNum", WebRequest.SCOPE_SESSION);
		param.put("no", detailno);
		boardrepo.updateDetailBoard(param);
		Map newDetail = boardrepo.getDetailBoard(detailno);
		map.put("detail", newDetail);
		wr.removeAttribute("boardNum", WebRequest.SCOPE_SESSION);
		return "/WEB-INF/views/board/detailWriter.jsp";
	}
	
	@RequestMapping("/board/deleteDetail.do")
	public String boardDetailDeleteHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = Integer.parseInt((String)param.get("no"));
		boardrepo.deleteDetailBoard(detailno);
		if(wr.getAttribute("searchLog", WebRequest.SCOPE_SESSION) == null) {
			return "redirect:list.do";
		}else {
			map.put("searchKey", wr.getAttribute("searchLog", WebRequest.SCOPE_SESSION));
			return "redirect:searchList.do";
		}
	}
	
	
	// 문의하기 기능 (WebSocket -> 로그인 안되어 있으면 쪽지)!
	
	@Autowired
	SocketService socketService;
	
	@Autowired
	QAMessageRepository mrepo;
	
	@GetMapping("/qa/buyqa.do")
	public String buyqaHandle(@RequestParam Map param, Map map, HttpSession session) {
		map.put("writer", (String)param.get("writer"));
		map.put("no", Integer.parseInt((String)param.get("no")));
		Map user = (Map)session.getAttribute("user");
		
		List<Map> getChatLog = mrepo.getChatLog((String)param.get("writer"), (String)user.get("ID"));
		if(getChatLog == null){
			String uuid = UUID.randomUUID().toString().split("-")[0].toString();			
			map.put("qamode", uuid);
			System.out.println("uuid 없을떄");
		}else {
			for(int i = 0; i<getChatLog.size();i++) {
				Map maps = getChatLog.get(i);
				String uuid = (String)maps.get("id");
				map.put("qamode", uuid);
				System.out.println("uuid 있을떄");
			}
		}
		return "account.buyQA";
	}
	//----------------------------------------------------------------------------------------------------------------------------
	// 검색 기능 완료!
	
	@RequestMapping("/board/searchList.do")
	public String searchListController(@RequestParam Map param, WebRequest wr, Map map) {
		String searchKey = (String)param.get("searchKey");
		List<String> li = new ArrayList<>();
		if(searchKey.indexOf(" ") != -1) {
			String[] searchKeys = searchKey.split(" ");
			for(int i=0; i<searchKeys.length; i++) {
				li.add("%" + searchKeys[i] + "%");
			}
			List<Map> list = boardrepo.getSearchListByList(li);
			map.put("boardlist", list);
			wr.setAttribute("searchLog", searchKey, WebRequest.SCOPE_SESSION);
		}else {
			List<Map> list = boardrepo.getSearchListByString(searchKey);
			map.put("boardlist", list);
			wr.setAttribute("searchLog", searchKey, WebRequest.SCOPE_SESSION);
		}
		return "account.boardlist";
	}
	// 구매 결정 컨트롤러
	// 구현중
	@PostMapping("/choespayment.do")
	public String choespaymentHandle(@RequestParam Map param, @RequestParam String[] cardnum) {
		String[] cardnumber = new String[cardnum.length];
		for(int i = 0; i<cardnum.length;i++) {
			cardnumber[i]=cardnum[i];
		}
		param.put("cardnum", cardnumber);
		return "/index.do";
	}
	
	//----------------------------------------------------------------------------------------------------------------------------
	// 쪽지구현
/*	@PostMapping("/qa/buyqa.do")
	public String buyqaPostHandle(@RequestParam Map map, HttpSession session) {
	
		Map data = (Map)session.getAttribute("user");
		String sender = (String)data.get("ID");  
		map.put("sender", sender);
		System.out.println("고유키"+UUID.randomUUID());
		
		return "account.buyQA";
	}*/
	
	
}
