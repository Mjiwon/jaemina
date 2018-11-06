package app.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.CateRepository;
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

	public AccountController() {
		sessions = new HashMap<>();
	}

	// Index!!!!
	@RequestMapping("/index.do")
	public String indexHendler(WebRequest wr, Map map) {
			map.put("boardlist", boardrepo.getCateBoard(1));
		List<Map> bcatelist = caterepo.getBigCate();
		

		if (wr.getAttribute("auth", WebRequest.SCOPE_SESSION) != null) {
			List<Map> wishlist = wishrepo.getWishlist((String) wr.getAttribute("loginId", WebRequest.SCOPE_SESSION));
				map.put("wishlist", wishlist);

			Map user = (Map) wr.getAttribute("user", WebRequest.SCOPE_SESSION);
			String id = (String) user.get("ID");

			List<Map> getChatList = oamr.getChatList((String) user.get("ID"));

			if (getChatList != null) {
				Map z = new HashMap<>();
				List log = new ArrayList<>();
				for (int i = 0; i < getChatList.size(); i++) {
					z = getChatList.get(i);
					log = (List) z.get("log");
					List check = new ArrayList<>();
					for (int j = 0; j < log.size(); j++) {
						Map b = (Map) log.get(j);
						check = (List) b.get("checkMember");
						if (check.contains((String) user.get("ID"))) {
							z.put("noCheck", true);
							map.put("newss", true);
						}
					}
				}
			}
			wr.setAttribute("chatList", getChatList, WebRequest.SCOPE_SESSION);
			wr.setAttribute("wishlist", wishlist, WebRequest.SCOPE_SESSION);
		}
			map.put("bigcate", bcatelist);
		int boardCount = boardrepo.boardCount();
			map.put("boardCount", boardCount);

		return "account.index";
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

	// Login
	@GetMapping("/login.do")
	public String loginGetHandler() {
		return "/WEB-INF/views/account/login.jsp";
	}

	@Autowired
	QAMessageRepository qamr;

	@PostMapping("/login.do")
	public String loginPostHandler(WebRequest wr, Map map, HttpSession session) {
		// 아이디와 비번 가져오기
		String id = wr.getParameter("getId");
		String pass = wr.getParameter("getPass");
		// 로그인하기
		map.put("id", id);
		map.put("pass", pass);
		Map mapp = accountrepo.getAccount(map);
		if (mapp != null) { // 로그인이 되었을 경우
			if (sessions.containsKey(id)) {
				sessions.remove("user"); // 기존 로그인 사용자 없애기
				sessions.remove("auth"); //
				sessions.remove("loginId");
				wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION); // 새로 로그인
				wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION);
				wr.setAttribute("loginId", id, WebRequest.SCOPE_SESSION);
			} else {
				wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION);
				wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION);
				wr.setAttribute("loginId", id, WebRequest.SCOPE_SESSION);
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
	public String logoutHandle(HttpSession session, WebRequest wr) {
		wr.removeAttribute("auth", WebRequest.SCOPE_SESSION);
		wr.removeAttribute("user", WebRequest.SCOPE_SESSION);
		wr.removeAttribute("loginId", WebRequest.SCOPE_SESSION);
		return "redirect:index.do";
	}
	// ----------------------------------------------------------------------------------------------------------------------------



	// 판매자 계좌번호 등록
	@GetMapping("/addbank.do")
	public String AddBankGetHandle(HttpSession session) {
		Map suser = (Map) session.getAttribute("user");
		String sid = (String) suser.get("ID");
		Map duser = (Map) accountrepo.Myinfo(sid);
		String dbank = (String) duser.get("BANK");

		// 이미 등록했으면 판매글 오리기로 이동
		Map dseller = (Map) profilerepo.Sellerinfo(sid);

		if (dbank == null) {
			return "/WEB-INF/views/account/seller/addbank.jsp";
		} else if (dseller == null) {
			return "/WEB-INF/views/account/seller/addseller.jsp";
		} else
			return "redirect:/write.do";
	}

	@PostMapping("/addbank.do")
	public String AddBankPostHandle(@RequestParam Map p, HttpSession session) {
		Map user = (Map) session.getAttribute("user");
		String id = (String) user.get("ID");
		p.put("id", id);
		String banknumber = (String) p.get("bank");
		String bankname = (String) p.get("bankname");
		String regEx = "\\d{12}|(\\d{4}-\\d{5}-\\d{6})$";
		if (banknumber.matches(regEx)) {
			p.put("bank", bankname + "/" + banknumber);
			int i = accountrepo.addbank(p);
			if (i == 1) {
				return "/WEB-INF/views/account/seller/success.jsp";
			} else
				return "/WEB-INF/views/account/seller/addbank.jsp";
		} else {
			return "/WEB-INF/views/account/seller/addbank.jsp";
		}
	}

	// ----------------------------------------------------------------------------------------------------------------------------

	// 판매자 등록 컨트롤러
	@GetMapping("/addseller.do")
	public String addSellerGetHandle() {
		return "/WEB-INF/views/account/seller/addseller.jsp";
	}

	@PostMapping("/addseller.do")
	public String addSellerHandle(@RequestParam Map param, @RequestParam MultipartFile imgpath, WebRequest wr)
			throws IOException {
		Map m = (Map) wr.getAttribute("user", WebRequest.SCOPE_SESSION);

		String id = (String) m.get("ID");

		param.put("id", id);

		String paramFileName = imgpath.getName();
		String fileName = id + "-seller" + "-" + paramFileName + ".jpg";
		String realpath = ctx.getRealPath("/storage/sellerProfile");
		String path = "/storage/sellerProfile";

		File dir = new File(realpath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);
		imgpath.transferTo(dst);

		String img = path + "\\" + fileName;
		param.put("imgpath", img);

		if (param.get("imgpath") != null) {
			int i = profilerepo.addSeller2(param);
		} else {
			int i = profilerepo.addSeller1(param);
		}
		return "account.sellerHomme";
	}

	@Autowired
	SellerRepository SellerRepository;

	// 판매자 정보
	// 판매자 정보 페이지로 이동
	@RequestMapping("/sellerpr.do")
	public String addSellerPostHandle(@RequestParam Map p, HttpSession session) {
		Map user = (Map) session.getAttribute("user");
		String id = (String) user.get("ID");
		Map Seller = SellerRepository.getSeller(id);
		session.setAttribute("Seller", Seller);

		return "account.sellerHomme";
	}

	 @GetMapping("/update_seller.do")
	   public String UpdateSellerGetHandle() {
	      return "/WEB-INF/views/account/seller/update_seller.jsp";
	   }

	@PostMapping("/update_seller.do")
	public String UpdateSellerPostHandle(@RequestParam Map p, @RequestParam MultipartFile imgpath, HttpSession session) 
	         throws IOException {

	      session.removeAttribute("Seller");
	      Map user = (Map) session.getAttribute("user");
	      String id = (String) user.get("ID");
	      p.put("id", id);

	      String paramFileName = imgpath.getName();
	      String fileName = id + "-seller" + "-" + paramFileName + ".jpg";

	      String realpath = ctx.getRealPath("/storage/sellerProfile");
	      String path = "/storage/sellerProfile";
	      File dir = new File(realpath);
	      if (!dir.exists()) {
	         dir.mkdirs();
	      }
	      File dst = new File(dir, fileName);

	      imgpath.transferTo(dst);

	      String img = path + "/" + fileName;
	      System.out.println(img);
	      p.put("imgpath", img);

	      if (p.get("imgpath") != null) {
	         int i = SellerRepository.updateSeller1(p);

	      } else {
	         int j = SellerRepository.updateSeller2(p);
	      }
	      Map Seller = SellerRepository.getSeller(id);
	      session.setAttribute("Seller", Seller);
	      return "/WEB-INF/views/account/seller/update_seller2.jsp";
	   }

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



			Map Seller = sellerrepo.getSeller(id);
			String SellerId = (String) Seller.get("ID");

			String boardcount = sellerrepo.myboardcount(SellerId);
			String wishcount = sellerrepo.Wishcount(SellerId);
			int staravg = sellerrepo.staravg(SellerId);
			staravg = staravg * 20;
			Seller.put("boardcount", boardcount);
			Seller.put("wishcount", wishcount);
			Seller.put("staravg", staravg);

			// 판매자 정보 가지고 오기
			

			session.setAttribute("Seller", Seller);
			return "/WEB-INF/views/account/seller/sellerHome.jsp";
		} else
			return "/addbank.do";
	}

	// 회원 마이 페이지 이동
	// 구현중
	@RequestMapping("/sellHistory.do")
	public String sellHistoryHendle() {
		return "account.sellerhistory";
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

		String date_type = (String) map.get("date_type");
		List<Map> dbdate = new ArrayList<>();
		if (date_type.equals("year")) {
			dbdate = sellerrepo.yearproceeds(map);

		} else if (date_type.equals("moon")) {
			dbdate = sellerrepo.Moonproceeds(map);

		} else {
			dbdate = sellerrepo.dayproceeds(map);
		}

		List<Object[]> data = new ArrayList<>();
		data.add(new Object[] { "date", "PROCEED" });

		for (int i = 0; i < dbdate.size(); i++) {
			data.add(new Object[] { dbdate.get(i).get("D"), dbdate.get(i).get("SUM") });
		}
		String str = gson.toJson(data);

		return str;
	}

}