package app.controllers;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.BuyRepository;
import app.models.CateRepository;
import app.models.ProfileRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.models.WishlistRepository;
import app.service.SocketService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	Gson gson;

	@Autowired
	BoardRepository boardrepo;

	@Autowired
	AccountRepository accountrepo;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	QAMessageRepository oamr;

	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	CateRepository caterepo;
	
	@Autowired
	WishlistRepository wishrepo;
	
	@Autowired
	ProfileRepository profilerepo;

	@Autowired
	QAMessageRepository mrepo;

	

	// 게시글
	// 전체 게시글 갯수 불러오기


	// 판매글로 이동
	@GetMapping("/write.do")
	public String writeGetHandle(Map map) {
		List<Map> bcatelist = caterepo.getBigCate();
		map.put("bigcate", bcatelist);

		return "account.boardWrite";
	}

	// 판매글 DB에 insert
	@PostMapping("/write.do")
	public String writePostHandle(@RequestParam Map map, @RequestParam MultipartFile imgpath, WebRequest wr)
			throws IOException {
		// 파일(이미지) 업로드
		Integer no = boardrepo.getSequenceVal();
		map.put("no", no);

		String filename = map.get("writer") + "-" + no + "-" + map.get("title") + "-board" + ".jpg";
		String path = ctx.getRealPath("\\storage\\board");
		String addr = (String) map.get("addr");
		System.out.println(addr);

		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, filename);
		imgpath.transferTo(dst);

		String img = path + "\\" + filename;
		map.put("imgpath", "\\storage\\board" + "\\" + filename);
			
		if(addr != null) {
			boardrepo.addBoard2(map);
		}else {
			boardrepo.addBoard1(map);
		}

		return "redirect:/board/detail.do?no=" + no;
	}

	// 카테고리 분류의 AJAX
	// 웹에서 한글깨짐을 방지하기 위해서 아래 설정을 해준다.
	@RequestMapping(path = "/ajax/cate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cateAjaxHandle(@RequestParam Map bigno) {
		
		int bno = Integer.parseInt(((String)bigno.get("bigno")));
		List<Map> scatelist = caterepo.getSmallCate(bno);
		return gson.toJson(scatelist);
	}

	// 판매글 불러오기
	@RequestMapping("/board/list.do")
	public String boardListHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int bigcate = Integer.parseInt((String)param.get("bigcate"));
		int smallcate = Integer.parseInt((String)param.get("smallcate"));
		int currentPage = Integer.parseInt((String) param.get("currentPage"));
		int startCount = (currentPage-1)*9+1;
		int endCount = currentPage*9;
		
		wr.setAttribute("bigCate", bigcate, WebRequest.SCOPE_SESSION);
		wr.setAttribute("smallCate", smallcate, WebRequest.SCOPE_SESSION);
		List<Map> boardlist = boardrepo.getSmallCateBoard(param);
		map.put("boardlist", boardlist);
		
		List<Map> bcatelist = caterepo.getBigCate();
		map.put("bigcates", bcatelist);
		
		List<Map> scatelist = caterepo.getSmallCate(bigcate);
		map.put("smallcates", scatelist);
		
		int boardCount = boardrepo.getSmallCateBoard(param).size();
		int totalPage = boardCount / 9;
		if((boardCount % 9)>0) {
			totalPage++;
		}
		Map mapp = new HashMap<>();
		mapp.put("bigcate", bigcate);
		mapp.put("smallcate", smallcate);
		mapp.put("startCount", startCount);
		mapp.put("endCount", endCount);
		map.put("boardlist", boardrepo.getSmallCateListForPasing(mapp));
		map.put("totalPage", totalPage);
		map.put("currentPage", currentPage);
		
		
		
		
		return "account.boardlist";
	}
	/*
	@GetMapping("/board/list.do")
	public String boardListHandle(Map map, WebRequest wr) {
		map.put("boardlist", boardrepo.getBoardList());
		wr.removeAttribute("searchLog", WebRequest.SCOPE_SESSION);
		wr.removeAttribute("bigCate", WebRequest.SCOPE_SESSION);
		return "account.boardlist";
	}*/


	// 상세페이지
	@RequestMapping("/detail.do")
	public String boardDetailHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = Integer.parseInt((String) param.get("no"));
		Map detail = boardrepo.getDetailBoard(detailno);
		String sellerid = (String) detail.get("WRITER");
		Map writer = sellerrepo.getSeller(sellerid);
		String id = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		List<Map> wishlist = wishrepo.getWishlist(id);
			wr.removeAttribute("wishlist", WebRequest.SCOPE_SESSION);
			wr.setAttribute("wishlist", wishlist, WebRequest.SCOPE_SESSION);

		String bigcate = ((BigDecimal) detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal) detail.get("SMALLCATE")).toString();

		
		
		Map cates = new HashMap<>();
			cates.put("bigcate", bigcate);
			cates.put("smallcate", smallcate);

		Map cate = caterepo.getCate(cates);
		for(Map<String, String> list: wishlist ) {
			if(list.get("SELLER").equals(sellerid)) {
				wr.setAttribute("wishlistcheck", true, WebRequest.SCOPE_REQUEST);
				break;
			}else {
			}
		}
	
			map.put("detail", detail);
			map.put("writer", writer);
			map.put("cate", cate);
			map.put("loginOk", id);
		System.out.println("deatail info : "+ map);
		return "account.boardDetail";
	}

	
/*
		// 판매자 정보 가지고 오기
		Map Seller = sellerrepo.getSeller(sellerid);
		session.setAttribute("Seller", Seller);
		return "/WEB-INF/views/account/seller/sellerHome.jsp";
	}*/


	@RequestMapping("/modifyDetail.do")
	public String boardModifyHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = Integer.parseInt((String) param.get("no"));
		Map detail = boardrepo.getDetailBoard(detailno);

		// 카테고리 가져오기
		String bigcate = ((BigDecimal) detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal) detail.get("SMALLCATE")).toString();

		Map cates = new HashMap<>();
		cates.put("bigcate", bigcate);
		cates.put("smallcate", smallcate);

		Map cate = caterepo.getCate(cates);

		map.put("detail", detail);
		map.put("cate", cate);

		wr.setAttribute("boardNum", detailno, WebRequest.SCOPE_SESSION);
		return "/WEB-INF/views/board/detailModify.jsp";
	}

	@RequestMapping("/detailUpdate.do")
	public String boardDetailUpdateHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = (int) wr.getAttribute("boardNum", WebRequest.SCOPE_SESSION);
		
			param.put("no", detailno);
		boardrepo.updateDetailBoard(param);
		Map detail = boardrepo.getDetailBoard(detailno);

		String sellerid = (String) detail.get("WRITER");
		Map writer = sellerrepo.getSeller(sellerid);
		String id = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);

		String bigcate = ((BigDecimal) detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal) detail.get("SMALLCATE")).toString();

		Map cates = new HashMap<>();
			cates.put("bigcate", bigcate);
			cates.put("smallcate", smallcate);

		Map cate = caterepo.getCate(cates);

			map.put("detail", detail);
			map.put("writer", writer);
			map.put("cate", cate);

			wr.removeAttribute("boardNum", WebRequest.SCOPE_SESSION);
		return "account.boardDetail";
	}

	@RequestMapping("/deleteDetail.do")
	public String boardDetailDeleteHandle(@RequestParam Map param, Map map, WebRequest wr) {
		boardrepo.deleteDetailBoard(Integer.parseInt((String) param.get("no")));
	
		if (wr.getAttribute("searchLog", WebRequest.SCOPE_SESSION) != null) {
				map.put("searchKey", wr.getAttribute("searchLog", WebRequest.SCOPE_SESSION));
			return "redirect:searchList.do";

		} else if (wr.getAttribute("smallCate", WebRequest.SCOPE_SESSION) != null) {
			map.put("bigcate", (int) wr.getAttribute("bigCate", WebRequest.SCOPE_SESSION));
			map.put("smallcate", (int) wr.getAttribute("smallCate", WebRequest.SCOPE_SESSION));
			map.put("currentPage", 1);

			return "redirect:list.do";
		} else {
			map.put("bigcate", (int) wr.getAttribute("bigCate", WebRequest.SCOPE_SESSION));
			map.put("currentPage", 1);
			return "redirect:lists.do";
		}
	}
	
	// ----------------------------------------------------------------------------------------------------------------------------
	// 검색 기능 완료!!!
/*
	@RequestMapping("/searchList.do")
	public String searchListController(@RequestParam Map param, WebRequest wr, Map map) {
		String searchKey = (String) param.get("searchKey");
		List<String> li = new ArrayList<>();
<<<<<<< HEAD
		String[] searchKeys = searchKey.split(" ");
		for (int i = 0; i < searchKeys.length; i++) {
			li.add("%" + searchKeys[i] + "%");
=======
		if (searchKey.indexOf(" ") != -1) {
			String[] searchKeys = searchKey.split(" ");
			for (int i = 0; i < searchKeys.length; i++) {
				li.add("%" + searchKeys[i] + "%");
			}
			List<Map> list = boardrepo.getSearchListByList(li);
				map.put("boardlist", list);
				wr.setAttribute("searchLog", searchKey, WebRequest.SCOPE_SESSION);
		} else {
			List<Map> list = boardrepo.getSearchListByString(searchKey);
				map.put("boardlist", list);
				wr.setAttribute("searchLog", searchKey, WebRequest.SCOPE_SESSION);
>>>>>>> refs/remotes/origin/se0
		}
		List<Map> list = boardrepo.getSearchListByList(li);
		map.put("boardlist", list);
		wr.setAttribute("searchLog", searchKey, WebRequest.SCOPE_SESSION);
		return "account.boardlist";
	}*/

	// 구매 결정 컨트롤러
	// 구현중
	@PostMapping("/choespayment.do")
	public String choespaymentHandle(@RequestParam Map param, @RequestParam String[] cardnum) {
		String[] cardnumber = new String[cardnum.length];
		for (int i = 0; i < cardnum.length; i++) {
			cardnumber[i] = cardnum[i];
		}
		param.put("cardnum", cardnumber);
		return "/index.do";
	}

	

	// ----------------------------------------------------------------------------------------------------------------------------

	
		
		
		//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

	
}
