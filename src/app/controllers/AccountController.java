package app.controllers;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.BuyRepository;
import app.models.CateRepository;
import app.models.PayRepository;
import app.models.ProfileRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.models.WishlistRepository;

@Controller
public class AccountController {
	Map<String, HttpSession> sessions;

	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	PayRepository payrepo;

	
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
	BuyRepository buyrepo;

	public AccountController() {
		sessions = new HashMap<>();
	}

	// Index!!!!
	@RequestMapping("/index.do")
	public String indexHendler(HttpSession session, WebRequest wr, Map map, HttpServletRequest req) {
		wr.removeAttribute("bigCate", WebRequest.SCOPE_SESSION);
		wr.removeAttribute("smallCate", WebRequest.SCOPE_SESSION);
		wr.removeAttribute("searchLog", WebRequest.SCOPE_SESSION);
		map.put("boardlist", boardrepo.getCateBoard(1));
		List<Map> bcatelist = caterepo.getBigCate();
		List<Map> scatelist = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelist);
		map.put("bigcate", bcatelist);
		
		List rankCate =  boardrepo.getRankCate();
		Map c1 = null;
		Map c2 = null;
		Map c3 = null;
		List li1 = null;
		List li2 = null;
		List li3 = null;
		if(rankCate.size() > 1) {
			List rankBoard = new ArrayList<>();
			c1 = (Map)rankCate.get(0);
			li1 = boardrepo.getRankBoard(((BigDecimal)c1.get("BIGCATE")).intValue());
			if(rankCate.size() > 1) {
				c2 = (Map)rankCate.get(1);
				li2 = boardrepo.getRankBoard(((BigDecimal)c2.get("BIGCATE")).intValue());
			}
			if(rankCate.size() > 2) {
				c3 = (Map)rankCate.get(2);
				li3 = boardrepo.getRankBoard(((BigDecimal)c3.get("BIGCATE")).intValue());
			}
			
			map.put("rank1", li1);
			map.put("rank2", li2);
			map.put("rank3", li3);
		}
		
		if (wr.getAttribute("auth", WebRequest.SCOPE_SESSION) != null) {
			List<Map> wishlist = wishrepo.getWishlist((String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION));
				map.put("wishlist", wishlist);

			Map user = (Map) wr.getAttribute("user", WebRequest.SCOPE_SESSION);
			String id =(String)user.get("ID");
		
			List<Map> getChatList = oamr.getChatList((String)user.get("ID"));		
			System.out.println(getChatList.size() + "채팅갯수");
			if(getChatList!=null) {
				Map z = new HashMap<>();
				   List log = new ArrayList<>();
				   for(int i = 0; i<getChatList.size();i++) {
					   z = getChatList.get(i);
					   log = (List)z.get("log");
					   List check = new ArrayList<>();
					   for(int j = 0; j<log.size();j++) {
						   Map b = (Map)log.get(j);
						   check = (List)b.get("checkMember");
						   if(check.contains((String)user.get("ID"))) {
							   z.put("noCheck",true);
							   map.put("newss", true);
						   }
					   }
				   }
			}
			wr.setAttribute("chatList", getChatList, WebRequest.SCOPE_SESSION);
			wr.setAttribute("wishlist", wishlist, WebRequest.SCOPE_SESSION);
		}
		int boardCount = boardrepo.boardCount();
		map.put("boardCount", boardCount);
		int payCount = buyrepo.allPayCount();
		map.put("payCount", payCount);
		if(buyrepo.allPercent() != null) {
			int payPercent = buyrepo.allPercent();
			map.put("payPercent", payPercent);
		}
			
		// loginCooke가 설정 되었을 경우 세션에  세팅 해주기
		Cookie[] cookies = req.getCookies();
		if(cookies!=null) {
			for(int i=0;i<cookies.length;i++) {
				if(cookies[i].getName().equals("loginauth")) {
					Map myinfo = accountrepo.Myinfo(cookies[i].getValue());
					String id = (String)myinfo.get("ID");
					String pass = (String)myinfo.get("PASS");
					
					session.setAttribute("loginId", id);
					session.setAttribute("user", myinfo);
					session.setAttribute("auth", true);
					session.setAttribute("sellerinfo", (Map)profilerepo.Sellerinfo(id));
					
				}
			
			}
		}
		
		
		return "account.index";
	}

	// Login
		@GetMapping("/login.do")
		public String loginGetHandler() {
			return "/WEB-INF/views/account/login.jsp";
		}

		@Autowired
		QAMessageRepository qamr;

		@PostMapping("/login.do")
		public String loginPostHandler(@RequestParam Map param, WebRequest wr, Map map, HttpSession session, HttpServletResponse response) {
			// 아이디와 비번 가져오기
			String id = wr.getParameter("getId");
			String pass = wr.getParameter("getPass");
			// 로그인하기
			map.put("id", id);
			map.put("pass", pass);
			Map mapp = accountrepo.getAccount(map);
			
			// login유지 쿠키 생성
			if(param.get("loginauth")!=null) {
				
			
				Cookie loginCookie = new Cookie("loginauth", id);
				loginCookie.setMaxAge(60*60*24*7);
				// login response
				response.addCookie(loginCookie);
				
			}else {
				Cookie loginCookie = new Cookie("loginCookie", id);
				loginCookie.setMaxAge(60*60*12);
			}
			if (mapp != null) { // 로그인이 되었을 경우
				if (sessions.containsKey(id)) {
					wr.removeAttribute("user", WebRequest.SCOPE_SESSION); // 기존 로그인 사용자 없애기
					wr.removeAttribute("auth", WebRequest.SCOPE_SESSION);
					wr.removeAttribute("loginId", WebRequest.SCOPE_SESSION);
					wr.removeAttribute("sellerinfo", WebRequest.SCOPE_SESSION);
					wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION); // 새로 로그인
					wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION);
					wr.setAttribute("loginId", id, WebRequest.SCOPE_SESSION);
					//seller 정보 가져오기
					Map sellerinfo=profilerepo.Sellerinfo(id);
					wr.setAttribute("sellerinfo", sellerinfo, WebRequest.SCOPE_SESSION);
				} else {
					wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION);
					wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION);
					wr.setAttribute("loginId", id, WebRequest.SCOPE_SESSION);
					//판매자 정보 가져오기
					Map sellerinfo=profilerepo.Sellerinfo(id);
					wr.setAttribute("sellerinfo", sellerinfo, WebRequest.SCOPE_SESSION);
				}
				wr.setAttribute("loginYes", true, WebRequest.SCOPE_REQUEST);

				return "/WEB-INF/views/account/login.jsp"; // 로그인 후 인덱스 페이지로 이동
			} else {
				wr.setAttribute("err", true, WebRequest.SCOPE_REQUEST); // 로그인 실패시
				return "/WEB-INF/views/account/login.jsp";
			}
			
		}

		// 로그아웃
		@RequestMapping("logout.do")
		public String logoutHandle(HttpSession session, WebRequest wr, HttpServletRequest req,HttpServletResponse resp) {
			wr.removeAttribute("auth", WebRequest.SCOPE_SESSION);
			wr.removeAttribute("user", WebRequest.SCOPE_SESSION);
			wr.removeAttribute("loginId", WebRequest.SCOPE_SESSION);
			wr.removeAttribute("sellerinfo",WebRequest.SCOPE_SESSION);
			Cookie[] cookies = req.getCookies();
			if(cookies!=null) {
				for(int i=0;i<cookies.length;i++) {
					if(cookies[i].getName().equals("loginauth")) {
						cookies[i].setMaxAge(0);
						resp.addCookie(cookies[i]);
						
					}
				
				}
			}
			return "redirect:index.do";
		}
	

	// 밑에 두개 회원 탈퇴!
	@RequestMapping("/deleteGo.do")
	public String deleteGoHandle(WebRequest wr, Map map) {
		String id = (String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
		Map idd = accountrepo.getAccountById(id);
		map.put("userId", idd);
		return "/WEB-INF/views/deleteUser.jsp";
	}

	@RequestMapping("/deleteuser.do")
	public String deleteUserHandle(@RequestParam Map param, WebRequest wr, Map err) {
		String id = (String) param.get("getId");
		String pass = (String) param.get("getPass");
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		Map mapp = accountrepo.getAccount(map);

		if (mapp != null) {
			accountrepo.deleteUser(id);
			wr.setAttribute("deleteYes", true, WebRequest.SCOPE_REQUEST);
			return "WEB-INF/views/deleteUser.jsp";
		} else {
			wr.setAttribute("deleteErr", true, WebRequest.SCOPE_REQUEST);

			err.put("userId", accountrepo.getAccountById(id));
			return "WEB-INF/views/deleteUser.jsp";
		}
	}

	// ----------------------------------------------------------------------------------------------------------------------------

	
	// ----------------------------------------------------------------------------------------------------------------------------


	
	// ----------------------------------------------------------------------------------------------------------------------------
	// 판매자 블러그 올린글 확인

	// 판매자 블러그 올린글 확인!

	@RequestMapping("/myboard.do")
	public String MyBoardHandle(HttpSession session, @RequestParam int currentPage, Map map, WebRequest wr) {
		wr.setAttribute("Myck", true, WebRequest.SCOPE_REQUEST);
		Map suser = (Map) session.getAttribute("user");

		String id = (String) suser.get("ID");
		

		Map duser = accountrepo.Myinfo(id);

		String dbank = (String) duser.get("BANK");

		if (dbank != null) {
			List<Map> MyBoard = boardrepo.getmyboard(id);
			int startCount = (currentPage - 1) * 9 + 1;
			int endCount = currentPage * 9;
			int boardCount = boardrepo.getmyboard(id).size();
			int totalPage = boardCount / 9;
			if ((boardCount % 9) > 0) {
				totalPage++;
			}
			Map mapp = new HashMap<>();
			mapp.put("writer", id);
			mapp.put("startCount", startCount);
			mapp.put("endCount", endCount);
			
			map.put("MyBoard", boardrepo.getBoardListBySellerForPasing(mapp));
			map.put("totalPage", totalPage);
			map.put("currentPage", currentPage);

			// 판매자 정보 가지고 오기
			Map Seller = sellerrepo.getSeller(id);
			session.setAttribute("Seller", Seller);
			return "account.sellerHomme";
		} else
			return "/addbank.do";
	}

	// 회원 마이 페이지 이동
	// 구현중
	@RequestMapping("/history.do")
	public String historyHendle(HttpSession session, Map map ) {
		// seller 의 아이디 뽑기
				String seller = (String) session.getAttribute("loginId");
				// seller 의 판매 내역을 뽑아오기
				List<Map> mysellList = payrepo.getMysellList(seller);
				// view로 판매내역을 전달해 주기
				if (mysellList != null) {
					map.put("sellList", mysellList);
					map.put("sellListCnt", mysellList.size());
				}

				// board에 타이틀 가져오기
				List<Map> myboardlist = boardrepo.getmyboard(seller);
				List<Map> bcatelist = caterepo.getBigCate();
				List<Map> scatelist = caterepo.getSmallcateAllList();
				map.put("smallcate", scatelist);
				map.put("bigcate", bcatelist);
		return "mypage.managesell";
	}
	// --------------------------------------------------------------------------------------
	// 비밀번호 변경
	@GetMapping("/changeUser.do")
	public String ChangeUserGetHandle() {
		return "/WEB-INF/views/account/mypage/modified/changeUser.jsp";
	}

	@PostMapping("/changeUser.do")
	public String ChangeUserPostHandle(@RequestParam Map p, HttpSession session, WebRequest wr) {
		Map suser = (Map) session.getAttribute("user");
		String sid = (String) suser.get("ID");
		Map suserr = accountrepo.getAccountById(sid);
		String spass = (String) suserr.get("PASS");
		String pass1 = (String) p.get("getPass1");
		String pass2 = (String) p.get("getPass2");
		if (spass.equals(pass1) & !pass1.equals(pass2)) {
			Map user_new = new HashMap();
			user_new.put("id", sid);
			user_new.put("pass", pass2);
			accountrepo.changeuser(user_new);
			wr.setAttribute("changePassYes", true, WebRequest.SCOPE_REQUEST);
			return "/WEB-INF/views/account/mypage/modified/changeUser.jsp";
		} else if (spass.equals(pass1) & pass1.equals(pass2)) {
			wr.setAttribute("changePassNo1", true, WebRequest.SCOPE_REQUEST);
			return "/WEB-INF/views/account/mypage/modified/changeUser.jsp";
		} else {
			wr.setAttribute("changePassNo2", true, WebRequest.SCOPE_REQUEST);
			return "/WEB-INF/views/account/mypage/modified/changeUser.jsp";
		}
	}

	// ----------------------------------------------------------------------------------------------------------------------------
	// index 확인 전용 맵핑
	@RequestMapping("/hello.do")
	public String helloHendler() {
		return "/WEB-INF/views/index.jsp";
	}

	// ----------------------------------------------------------------------------------------------------------------------------
	// 계정설정관련

	@RequestMapping("/modified.do")
	public String modifiedHandle() {
		return "account.modifiend";
	}
	// -------------------------------------------------------------------------------------------------------------------------------
	// 차트

	@RequestMapping("/chart.do")
	public String chart() {
		return "/WEB-INF/views/account/mypage/history/chart.jsp";
	}

	@RequestMapping(path = "/ajaxchart.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxchart(@RequestParam Map map) throws Exception {
		System.out.println("차트 아작스 파라미트 "+map);
		String date_type = (String) map.get("date_type");
		List<Map> dbdate = new ArrayList<>();
		if (date_type.equals("year")) {
			dbdate = sellerrepo.yearprices(map);

		} else if (date_type.equals("moon")) {
			dbdate = sellerrepo.Moonprices(map);

		} else {
			dbdate = sellerrepo.dayproceeds(map);
		}

		List<Object[]> data = new ArrayList<>();
		data.add(new Object[] { "date", "PROCEED" });
		for (int i = 0; i < dbdate.size(); i++) {
			data.add(new Object[] { dbdate.get(i).get("D"), dbdate.get(i).get("SUM")});
		}
		String str = gson.toJson(data);
		
		return str;
	}
	
	@RequestMapping(path = "/ajaxsum.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxajaxsum(@RequestParam Map map) throws Exception {
		String date_type = (String) map.get("date_type");
		List<Map> dbdate = new ArrayList<>();
		if (date_type.equals("year")) {
			dbdate = sellerrepo.yearprices(map);

		} else if (date_type.equals("moon")) {
			dbdate = sellerrepo.Moonprices(map);

		} else {
			dbdate = sellerrepo.dayproceeds(map);
		}

		Map maps = new HashMap<>();
		int sum =0;
		for (int i = 0; i < dbdate.size(); i++) {
			sum += ((BigDecimal)dbdate.get(i).get("SUM")).intValue();
		}
		maps.put("sum", sum);
		String str = gson.toJson(maps);
		System.out.println(maps);
		return str;
	}

}