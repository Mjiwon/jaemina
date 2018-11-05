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
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.service.SocketService;

@Controller
public class BoardController {

	@Autowired
	Gson gson;

	@Autowired
	AccountRepository accountrepo;

	@Autowired
	BoardRepository boardrepo;

	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	SocketService socketService;

	@Autowired
	QAMessageRepository mrepo;

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
	public String writePostHandle(@RequestParam Map map, @RequestParam MultipartFile imgpath, WebRequest wr)
			throws IOException {
		// 파일(이미지) 업로드
		Integer no = boardrepo.getSequenceVal();
		map.put("no", no);

		String filename = map.get("writer") + "-" + no + "-" + map.get("title") + "-board" + ".jpg";
		String path = ctx.getRealPath("\\storage\\board");

		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, filename);
		imgpath.transferTo(dst);

		String img = path + "\\" + filename;

		if (imgpath == null) {
			boardrepo.addBoard1(map);
		} else {
			map.put("imgpath", "\\storage\\board" + "\\" + filename);
			boardrepo.addBoard2(map);

		}
		return "redirect:/board/detail.do?no=" + no;
	}

	// 카테고리 분류의 AJAX
	// 웹에서 한글깨짐을 방지하기 위해서 아래 설정을 해준다.
	@RequestMapping(path = "/ajax/cate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cateAjaxHandle(@RequestParam Map bigno) {
		
		int bno = Integer.parseInt(((String)bigno.get("bigno")));
		List<Map> scatelist = boardrepo.getSmallCate(bno);
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
		
		List<Map> bcatelist = boardrepo.getBigCate();
		map.put("bigcates", bcatelist);
		
		List<Map> scatelist = boardrepo.getSmallCate(bigcate);
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
	
	
	@RequestMapping("/board/lists.do")
	public String boardListsHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int bigcate = Integer.parseInt((String) param.get("bigcate"));
		int currentPage = Integer.parseInt((String) param.get("currentPage"));
		int startCount = (currentPage-1)*9+1;
		int endCount = currentPage*9;
		
		wr.removeAttribute("smallCate", WebRequest.SCOPE_SESSION);
		wr.removeAttribute("searchLog", WebRequest.SCOPE_SESSION);
		wr.setAttribute("bigCate", bigcate, WebRequest.SCOPE_SESSION);

		List<Map> bcatelist = boardrepo.getBigCate();
		map.put("bigcates", bcatelist);
		List<Map> scatelist = boardrepo.getSmallCate(bigcate);
		map.put("smallcates", scatelist);
		int boardCount = boardrepo.getCateBoard(bigcate).size();
		int totalPage = boardCount / 9;
		if((boardCount % 9)>0) {
			totalPage++;
		}
		Map mapp = new HashMap<>();
		mapp.put("bigcate", bigcate);
		mapp.put("startCount", startCount);
		mapp.put("endCount", endCount);
		map.put("boardlist", boardrepo.getBigCateListForPasing(mapp));
		map.put("totalPage", totalPage);
		map.put("currentPage", currentPage);

		return "account.boardlist";
	}

	// 상세페이지
	@RequestMapping("/board/detail.do")
	public String boardDetailHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = Integer.parseInt((String) param.get("no"));
		Map detail = boardrepo.getDetailBoard(detailno);
		String sellerid = (String) detail.get("WRITER");
		Map writer = sellerrepo.getSeller(sellerid);
		String id = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		List<Map> wishlist = boardrepo.getWishlist(id);
		wr.removeAttribute("wishlist", WebRequest.SCOPE_SESSION);
		wr.setAttribute("wishlist", wishlist, WebRequest.SCOPE_SESSION);

		String bigcate = ((BigDecimal) detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal) detail.get("SMALLCATE")).toString();

		
		
		Map cates = new HashMap<>();
		cates.put("bigcate", bigcate);
		cates.put("smallcate", smallcate);

		Map cate = boardrepo.getCate(cates);
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

		return "account.boardDetail";
	}

	@RequestMapping("/sellerboardlist.do")
	public String sellerBoardListHandle(@RequestParam String seller, WebRequest wr, Map map, HttpSession session) {
		Map duser = accountrepo.Myinfo(seller);
		String dbank = (String) duser.get("BANK");
		List<Map> MyBoard = sellerrepo.getmyboard(seller);
		session.setAttribute("MyBoard", MyBoard);

		// 판매자 정보 가지고 오기
		Map Seller = sellerrepo.getSeller(seller);
		session.setAttribute("Seller", Seller);
		return "account.sellerHomme";
	}

	@RequestMapping("/board/modifyDetail.do")
	public String boardModifyHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int detailno = Integer.parseInt((String) param.get("no"));
		Map detail = boardrepo.getDetailBoard(detailno);

		// 카테고리 가져오기
		String bigcate = ((BigDecimal) detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal) detail.get("SMALLCATE")).toString();

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
		Map detail = boardrepo.getDetailBoard(detailno);

		String sellerid = (String) detail.get("WRITER");
		Map writer = sellerrepo.getSeller(sellerid);
		String id = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);

		String bigcate = ((BigDecimal) detail.get("BIGCATE")).toString();
		String smallcate = ((BigDecimal) detail.get("SMALLCATE")).toString();

		Map cates = new HashMap<>();
		cates.put("bigcate", bigcate);
		cates.put("smallcate", smallcate);

		Map cate = boardrepo.getCate(cates);

		map.put("detail", detail);
		map.put("writer", writer);
		map.put("cate", cate);

		wr.removeAttribute("boardNum", WebRequest.SCOPE_SESSION);
		return "account.boardDetail";
	}

	@RequestMapping("/board/deleteDetail.do")
	public String boardDetailDeleteHandle(@RequestParam Map param, Map map, WebRequest wr) {
		boardrepo.deleteDetailBoard(Integer.parseInt((String) param.get("no")));
	
		if (wr.getAttribute("searchLog", WebRequest.SCOPE_SESSION) != null) {
			map.put("searchKey", wr.getAttribute("searchLog", WebRequest.SCOPE_SESSION));
			return "redirect:searchList.do";
		} else if (wr.getAttribute("bigCate", WebRequest.SCOPE_SESSION) != null) {
			map.put("bigcate", (int) wr.getAttribute("bigCate", WebRequest.SCOPE_SESSION));
			return "redirect:lists.do";
		} else {
			return "redirect:list.do";
		}
	}
	
	// ----------------------------------------------------------------------------------------------------------------------------
	// 검색 기능 완료!

	@RequestMapping("/board/searchList.do")
	public String searchListController(@RequestParam Map param, WebRequest wr, Map map) {
		String searchKey = (String) param.get("searchKey");
		List<String> li = new ArrayList<>();
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
		}
		return "account.boardlist";
	}

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

	@RequestMapping("/addWishlist.do")
	public String addWishListHandle(@RequestParam Map param, WebRequest wr, Map map) {
		String buyer = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		String seller = (String) param.get("writer");
		int no = Integer.parseInt((String)param.get("no"));
		Map wish = new HashMap<>();
		wish.put("buyer", buyer);
		wish.put("seller", seller);
		boardrepo.addWishlist(wish);
		map.put("no", no);

		return "redirect:board/detail.do";
	}
	
	@RequestMapping("/deleteWishlist.do")
	public String deleteWishListHandle(@RequestParam Map param, WebRequest wr, Map map) {
		String buyer = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		String seller = (String) param.get("writer");
		int no = Integer.parseInt((String)param.get("no"));
		Map wish = new HashMap<>();
		wish.put("buyer", buyer);
		wish.put("seller", seller);
		boardrepo.deleteWishList(wish);
		map.put("no", no);
		
		return "redirect:board/detail.do";
	}

	// ----------------------------------------------------------------------------------------------------------------------------

	// 댓글 입력
		@RequestMapping(path = "/ajax/replyWrite.do", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String ReplyWriteAjaxHandle(@RequestParam Map reply) {
			String bno = (String) reply.get("bno");
			int bno1 = Integer.parseInt(bno);

			String writer = (String) reply.get("writer");

			Map only = new HashMap();
			only.put("bno", bno);
			only.put("writer", writer);

			List<Map> onlyreply = boardrepo.onlyreply(only);

			if (onlyreply.size()==0) {
				int i = boardrepo.WriteReply(reply);
				return gson.toJson(i);
			} else {
				return gson.toJson(0);
			}
		}

		// 댓글 리스트
		@RequestMapping(path = "/ajax/replylist.do", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String RepleAjaxHandle(@RequestParam Map data) {
			String bno = (String) data.get("bno");
			int bbno = Integer.parseInt(bno);
			List<Map> replylist = boardrepo.ReplyLIst(bbno);
			return gson.toJson(replylist);
		}
		//댓글 수정
		@RequestMapping(path = "/ajax/modifyreply.do", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String RepleModifyAjaxHandle(@RequestParam Map data) {
			String bbno=(String)data.get("bno");
			int bno=Integer.parseInt(bbno);
			data.put("bno", bno);
			int update = boardrepo.Modify_Reply(data);
			return gson.toJson(update);
		}
		
		@RequestMapping("/modifyreply.do")
		public String modifyreply(@RequestParam String bno, Map map) {
			map.put("bno", bno);
			return "/WEB-INF/views/board/modifyreply.jsp";
		}
		//댓글 삭제
		@RequestMapping(path = "/ajax/deletereply.do", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String RepleDeleteAjaxHandle(@RequestParam Map data) {
				
			String bbno=(String)data.get("bno");
				int bno=Integer.parseInt(bbno);
				data.put("bno", bno);
				int delete = boardrepo.deletereply(data);
			return gson.toJson(delete);
		}

	/*
	 * @PostMapping("/qa/buyqa.do") public String buyqaPostHandle(@RequestParam Map
	 * map, HttpSession session) {
	 * 
	 * Map data = (Map)session.getAttribute("user"); String sender =
	 * (String)data.get("ID"); map.put("sender", sender);
	 * System.out.println("고유키"+UUID.randomUUID());
	 * 
	 * return "account.buyQA"; }
	 */
}
