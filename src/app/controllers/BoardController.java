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

	// 상세페이지
	@RequestMapping("/detail.do")
	public String boardDetailHandle(@RequestParam Map param, Map map, WebRequest wr) {
		try {
			int detailno = Integer.parseInt((String) param.get("no"));
	
			// 게시물 클릭시 조회수 증가
			boardrepo.addBoardsearchcount(detailno);
	
			Map detail = boardrepo.getDetailBoard(detailno);
			Integer avg = boardrepo.getDetailAvg(detailno);
	
			detail.put("avg", avg);			
			
		/*	for(int i = 0; i<detail.size();i++) {
				detail.get("CONTENT");
			}
			
			*/
			System.out.println(detail);
			String sellerid = (String) detail.get("WRITER");
			Map writer = sellerrepo.getSeller(sellerid);
			String id = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
			if (id != null) {
				List<Map> wishlist = wishrepo.getWishlist(id);
				wr.removeAttribute("wishlist", WebRequest.SCOPE_SESSION);
				wr.setAttribute("wishlist", wishlist, WebRequest.SCOPE_SESSION);
	
				for (Map<String, String> list : wishlist) {
					if (list.get("SELLER").equals(sellerid)) {
						wr.setAttribute("wishlistcheck", true, WebRequest.SCOPE_REQUEST);
						break;
					} else {
					}
				}
				map.put("loginOk", id);
			}
	
			String bigcate = ((BigDecimal) detail.get("BIGCATE")).toString();
			String smallcate = ((BigDecimal) detail.get("SMALLCATE")).toString();
	
			Map cates = new HashMap<>();
			cates.put("bigcate", bigcate);
			cates.put("smallcate", smallcate);
	
			Map cate = caterepo.getCate(cates);
			
			map.put("detail", detail);
			map.put("writer", writer);
			map.put("cate", cate);
			List<Map> bcatelist = caterepo.getBigCate();
			List<Map> scatelist = caterepo.getSmallcateAllList();
			map.put("smallcate", scatelist);
			map.put("bigcate", bcatelist);
			
			// 구매자 목록 추가 
			
			List<Map> buyerList = boardrepo.getBuyerList(detailno);
			for (int i = 0; i < buyerList.size(); i++) {
				if(buyerList.get(i).get("BUYER").equals(id)) {
					map.put("isBuyer", true);
				}else {
					map.put("isBuyer", false);
				}
			}
	
			return "account.boardDetail";
		}catch(java.lang.NullPointerException e) {
			List<Map> bcatelist = caterepo.getBigCate();
			List<Map> scatelist = caterepo.getSmallcateAllList();
			map.put("smallcate", scatelist);
			map.put("bigcate", bcatelist);
			return"err.index";
		}
	}

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
		List<Map> bcatelist = caterepo.getBigCate();
		List<Map> scatelist = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelist);
		map.put("bigcate", bcatelist);

		wr.setAttribute("boardNum", detailno, WebRequest.SCOPE_SESSION);
		return "account.Modify";
	}

	@RequestMapping("/detailUpdate.do")
	public String boardDetailUpdateHandle(@RequestParam Map param, @RequestParam MultipartFile imgpath, Map map,
			WebRequest wr) throws IOException {
		int detailno = (int) wr.getAttribute("boardNum", WebRequest.SCOPE_SESSION);
		Map detail1 = boardrepo.getDetailBoard(detailno);
		param.put("no", detailno);
		if (imgpath.getOriginalFilename().equals("")) {
			if (param.get("addr").equals("")) {
				boardrepo.updateDetailBoard1(param);
			} else {
				boardrepo.updateDetailBoard3(param);
			}
		} else {
			String filename = param.get("writer") + "-" + detailno + "-" + detail1.get("TITLE") + "-board" + ".jpg";
			String path = ctx.getRealPath("/storage/board");
			File dir = new File(path);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File dst = new File(dir, filename);
			imgpath.transferTo(dst);

			String img = path + "/" + filename;
			param.put("imgpath", "/storage/board" + "/" + filename);
			if (param.get("addr").equals("")) {
				boardrepo.updateDetailBoard2(param);
			} else {
				boardrepo.updateDetailBoard4(param);
			}
		}
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
		List<Map> bcatelist = caterepo.getBigCate();
		List<Map> scatelist = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelist);
		map.put("bigcate", bcatelist);
		

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
		} else if(wr.getAttribute("bigCate", WebRequest.SCOPE_SESSION) == null){
			return "/index.do";
		}else {
			map.put("bigcate", (int) wr.getAttribute("bigCate", WebRequest.SCOPE_SESSION));
			map.put("currentPage", 1);
			return "redirect:lists.do";
		}
	}

	// ----------------------------------------------------------------------------------------------------------------------------
	// 검색 기능 완료!!

	@RequestMapping("/searchList.do")
	public String searchListController(@RequestParam Map param, WebRequest wr, Map map) {
		int currentPage = Integer.parseInt((String) param.get("currentPage"));
		int startCount = (currentPage - 1) * 6 + 1;
		int endCount = currentPage * 6;

		String searchKey = (String) param.get("searchKey");
		List<String> li = new ArrayList<>();
		String[] searchKeys = searchKey.split(" ");
		for (int i = 0; i < searchKeys.length; i++) {
			li.add("%" + searchKeys[i] + "%");
		}
		int boardCount = boardrepo.getSearchListByList(li).size();

		Map mapp = new HashMap<>();
		mapp.put("startCount", startCount);
		mapp.put("endCount", endCount);
		mapp.put("list", li);
		List<Map> list2 = boardrepo.getSearchListByMap(mapp);
		map.put("boardlist", list2);
		int totalPage = boardCount / 6;
		if ((boardCount % 6) > 0) {
			totalPage++;
		}
		map.put("totalPage", totalPage);
		map.put("currentPage", currentPage);

		wr.setAttribute("searchLog", searchKey, WebRequest.SCOPE_SESSION);
		wr.removeAttribute("bigCate", WebRequest.SCOPE_SESSION);
		wr.removeAttribute("smallCate", WebRequest.SCOPE_SESSION);

		List<Map> bcatelist = caterepo.getBigCate();
		map.put("bigcate", bcatelist);
		
		List<Map> scatelists = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelists);

		List<Map> scatelist = caterepo.getSmallCate(1);
		map.put("smallcates", scatelist);

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

	// ----------------------------------------------------------------------------------------------------------------------------

	// ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

}
