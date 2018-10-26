package app.controllers;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
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


import app.models.SellerRepository;

@Controller
public class AccountController {
Map<String, HttpSession> sessions;
	
	public AccountController() {
		sessions = new HashMap<>(); 
	}
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	JavaMailSender sender;
	
	// Index
	@RequestMapping("/index.do")
	public String indexHendler(WebRequest wr) {
		if(wr.getAttribute("auth", WebRequest.SCOPE_SESSION) == null) {
			return "/WEB-INF/views/account/login.jsp";
		}else {
			return "/WEB-INF/views/index.jsp";
		}
	}
	
	// 회원가입
	@GetMapping("/join.do")
	public String joinGetHandler() {
		return "/WEB-INF/views/account/join.jsp";
	}
	
	//email 인증 전송
	@RequestMapping("/mail.do")
	@ResponseBody
	public String sendTest(@RequestParam Map param,WebRequest wr) {
		String receiver = (String) param.get("email");
		SimpleMailMessage msg = new SimpleMailMessage();
		sender.createMimeMessage();
		msg.setSubject("재미나 이메일 인증번호");
		String text="아래의 인증키를 입력해주세요\n";
		String confirm = UUID.randomUUID().toString().split("-")[0];
		System.out.println(receiver);
		text += confirm;
		wr.setAttribute("confirmKey", confirm, WebRequest.SCOPE_SESSION);
		msg.setText(text);
		msg.setTo(receiver);
		msg.setFrom("amdin@jamina.mockingu.com");
		
		try {
			sender.send(msg);
			System.out.println("SUCCESS!");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Fail!");
		}
		return text;
	}
	
	// email인증 ajax
	@RequestMapping("/emailauth.do")
	@ResponseBody
	public String emailauthHandle(@RequestParam Map param, WebRequest wr) {
		String confirm = (String)wr.getAttribute("confirmKey", WebRequest.SCOPE_SESSION);
		String confirm1 = (String)param.get("confirmkey");
		String rst;
		wr.removeAttribute("confirmKey", WebRequest.SCOPE_SESSION);
		if(confirm.equals(confirm1)) {
			rst = "true";
			wr.setAttribute("rst", rst, WebRequest.SCOPE_SESSION);
			System.out.println(rst);
			return rst;
		}else {
			rst = null;
			wr.setAttribute("rst", rst, WebRequest.SCOPE_SESSION);
			System.out.println(rst);
			return rst;
		}
	}
	
	@PostMapping("/join.do")
	public String joinPostHandler(WebRequest wr, Map map) {
		String id = wr.getParameter("getId");
		String pass = wr.getParameter("getPass1");
		String pass1 = wr.getParameter("getPass2");
		String email = wr.getParameter("getEmail");
		map.put("id", id);
		map.put("pass", pass);
		map.put("email", email);
		accountRepository.addUser(map);
		
		return "/WEB-INF/views/account/login.jsp";
	}
	
	@RequestMapping("/joinid_check.do")
	@ResponseBody
	public String joinIdCheckHandler(HttpServletRequest req) throws IOException {
		
		String w = req.getParameter("w");
		Map map = accountRepository.getAccountById(w);
		Gson gson = new Gson();
		String json = gson.toJson(map);
		return json;
	}
	
	@RequestMapping("/joinemail_check.do")
	@ResponseBody
	public String joinEmailCheckHandler(HttpServletRequest req) throws IOException {
		
		String w = req.getParameter("w");
		Map map = accountRepository.getAccountByEmail(w);
		Gson gson = new Gson();
		String json = gson.toJson(map);
		return json;
	}
	//----------------------------------------------------------------------------------------------------------------------------
	
	// Login
	@GetMapping("/login.do")
	public String loginGetHandler() {
		return "/WEB-INF/views/account/login.jsp";
	}
	
	@PostMapping("/login.do")
	public String loginPostHandler(WebRequest wr, Map map, HttpSession session) {
		// 아이디와 비번 가져오기
		String id = wr.getParameter("getId");
		String pass = wr.getParameter("getPass");
		// 로그인하기
		map.put("id", id);
		map.put("pass", pass);
		Map mapp = accountRepository.getAccount(map);
		if(mapp != null) {	// 로그인이 되었을 경우
			wr.removeAttribute("err", 0);
			if(sessions.containsKey(id)) {
				sessions.remove("user");	// 기존 로그인 사용자 없애기
				sessions.remove("auth");	//
				wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION);	// 새로 로그인
				wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION); 
			}else {				
				wr.setAttribute("auth", true, WebRequest.SCOPE_SESSION);
				wr.setAttribute("user", mapp, WebRequest.SCOPE_SESSION);
			}
			return "/WEB-INF/views/index.jsp";	// 로그인 후 인덱스 페이지로 이동
		}else {
			wr.setAttribute("err", true, 0);	// 로그인 실패시
			return "login.do";
		}
	}
	//----------------------------------------------------------------------------------------------------------------------------

	@Autowired
	ServletContext ctx;
	
	// 판매자 계좌번호 등록
	@GetMapping("/addbank.do")
	public String AddBankGetHandle(HttpSession sesion) {
		/*
		 * 이미 계좌 등록한 계좌 막기 세션 이용해서 BANK값이 널이 아니면 차단
		 *
		 */
		return "/WEB-INF/views/account/seller/addbank.jsp";
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
			int i = accountRepository.addbank(p);
			if (i == 1) {
				return "/WEB-INF/views/account/seller/success.jsp";
			} else
			return "/WEB-INF/views/account/seller/addbank.jsp";
		} else {
			return "/WEB-INF/views/account/seller/addbank.jsp";
		}
	}

	//----------------------------------------------------------------------------------------------------------------------------
	
	// 판매자 추가 컨트롤러
	@GetMapping("/addseller.do")
	public String addSellerGetHandle() {
		return "/WEB-INF/views/account/seller/addseller.jsp";
	}

	@PostMapping("/addseller.do")
	public String addSellerHandle(@RequestParam Map param, @RequestParam MultipartFile imgpath, WebRequest wr) throws IOException {
		Map m = (Map) wr.getAttribute("user", WebRequest.SCOPE_SESSION);
		String id = (String) m.get("ID");

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
		param.put("imgpath", img);

		if (param.get("imgpath") == null) {
			int i = accountRepository.addSeller1(param);
		} else {
			int i = accountRepository.addSeller2(param);
		}
		return "/WEB-INF/views/account/seller/sellerHome.jsp";
	}
	//----------------------------------------------------------------------------------------------------------------------------
		
	@Autowired
	SellerRepository hoSellerRepository;

	// 판매자 정보 
	// 판매자 정보 페이지로 이동
	@RequestMapping("/sellerpr.do")
	public String addSellerPostHandle(@RequestParam Map p, HttpSession session) {
		Map user = (Map) session.getAttribute("user");
		String id = (String) user.get("ID");
		Map Seller = hoSellerRepository.getSeller(id);
		session.setAttribute("Seller", Seller);

		return "/WEB-INF/views/account/seller/sellerHome.jsp";
	}

	// 판매자 정보 수정 페이지로 이동
	@GetMapping("/update_seller.do")
	public String UpdateSellerGetHandle() {
		return "/WEB-INF/views/account/seller/update_seller.jsp";
	}

	// 판매자 정보 수정 
	@PostMapping("/update_seller.do")
	public String UpdateSellerPostHandle(@RequestParam Map p, @RequestParam MultipartFile imgpath, HttpSession session)
			throws IOException {

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
			int i = hoSellerRepository.updateSeller1(p);

		} else {
			int j = hoSellerRepository.updateSeller2(p);
		}
		return "/WEB-INF/views/index.jsp";
	}
	//----------------------------------------------------------------------------------------------------------------------------
	
	// 회원 마이 페이지 이동
	// 구현중
	@RequestMapping("/sellHistory.do")
	public String sellHistoryHendle() {
		return "/WEB-INF/views/account/mypage/history/sellHistory.jsp";
	}
	
	//----------------------------------------------------------------------------------------------------------------------------
	// index 확인 전용 맵핑
	@RequestMapping("/hello.do")
	public String helloHendler() {
		return "/WEB-INF/views/index.jsp";
	}
	
	
	
}
