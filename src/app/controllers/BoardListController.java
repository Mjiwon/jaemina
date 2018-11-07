package app.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.CateRepository;
import app.models.ProfileRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.models.WishlistRepository;
import app.service.SocketService;

@Controller
@RequestMapping("/board")
public class BoardListController {

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

	
	// 판매글 불러오기
	@RequestMapping("/list.do")
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
		
		
	@RequestMapping("/lists.do")
	public String boardListsHandle(@RequestParam Map param, Map map, WebRequest wr) {
		int bigcate = Integer.parseInt((String) param.get("bigcate"));
		int currentPage = Integer.parseInt((String) param.get("currentPage"));
		int startCount = (currentPage-1)*9+1;
		int endCount = currentPage*9;
			
			wr.removeAttribute("smallCate", WebRequest.SCOPE_SESSION);
			wr.removeAttribute("searchLog", WebRequest.SCOPE_SESSION);
			wr.setAttribute("bigCate", bigcate, WebRequest.SCOPE_SESSION);

		List<Map> bcatelist = caterepo.getBigCate();
			map.put("bigcates", bcatelist);
		List<Map> scatelist = caterepo.getSmallCate(bigcate);
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
}
