package app.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import app.models.BoardRepository;
import app.models.QAMessageRepository;
import app.models.SellerRepository;

@Controller
public class AccountController {
   Map<String, HttpSession> sessions;

   @Autowired
   BoardRepository boardrepo;

   public AccountController() {
      sessions = new HashMap<>();
   }

   @Autowired
   AccountRepository accountRepository;

   @Autowired
   JavaMailSender sender;
   
   @Autowired
   QAMessageRepository oamr;

   // Index!!
   @RequestMapping("/index.do")
   public String indexHendler(WebRequest wr, Map map) {

      List<Map> bcatelist = boardrepo.getBigCate();
      if(wr.getAttribute("auth", WebRequest.SCOPE_SESSION) != null) {
    	  List<Map> wishlist = boardrepo.getWishlist((String)wr.getAttribute("loginId", WebRequest.SCOPE_SESSION));
    	  map.put("wishlist", wishlist);
    	  
    	  Map user=(Map)wr.getAttribute("user", WebRequest.SCOPE_SESSION);
		 List<Map> c = oamr.getChatList((String)user.get("ID"));

		   Map z = new HashMap<>();
		   List log = new ArrayList<>();
		   for(int i = 0; i<c.size();i++) {
			   z = c.get(i);
			   log = (List)z.get("log");
		   }
		   
		   List check = new ArrayList<>();
		   for(int i = 0; i<log.size();i++) {
			   Map b = (Map)log.get(i);
			   check = (List)b.get("checkMember");
			   if(check.contains((String)user.get("ID"))) {
				   map.put("newss", true);
			   }
		   }
    	  wr.setAttribute("wishlist", wishlist, WebRequest.SCOPE_SESSION);
      }
	  wr.removeAttribute("bigCate", WebRequest.SCOPE_SESSION);
	  map.put("bigcate", bcatelist);
	  int boardCount = boardrepo.boardCount();
	  map.put("boardCount", boardCount);
     
      return "account.index";
   }

   // 회원가입
   @GetMapping("/join.do")
   public String joinGetHandler() {
      return "/WEB-INF/views/account/join.jsp";
   }

   // email 인증 전송
   @RequestMapping("/mail.do")
   @ResponseBody
   public String sendTest(@RequestParam Map param, WebRequest wr) {
      String receiver = (String) param.get("email");
      SimpleMailMessage msg = new SimpleMailMessage();
      sender.createMimeMessage();
      msg.setSubject("재미나 이메일 인증번호");
      String text = "아래의 인증키를 입력해주세요\n";
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
      } catch (Exception e) {
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
      String confirm = (String) wr.getAttribute("confirmKey", WebRequest.SCOPE_SESSION);
      String confirm1 = (String) param.get("confirmkey");
      String rst;
      wr.removeAttribute("confirmKey", WebRequest.SCOPE_SESSION);
      if (confirm.equals(confirm1)) {
         rst = "true";
         wr.setAttribute("rst", rst, WebRequest.SCOPE_SESSION);
         System.out.println(rst);
         return rst;
      } else {
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
      
      wr.setAttribute("joinYes", true, WebRequest.SCOPE_REQUEST);
      return "/WEB-INF/views/account/join.jsp";
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
   // 밑에 두개 회원 탈퇴!
   @RequestMapping("/deleteGo.do")
   public String deleteGoHandle(WebRequest wr, Map map) {
	   String id = (String)wr.getAttribute("loginId", WebRequest.SCOPE_SESSION);
	   Map idd = accountRepository.getAccountById(id);
	   map.put("userId", idd);
	   return "/WEB-INF/views/deleteUser.jsp";
   }
   
   @RequestMapping("/deleteuser.do")
   public String deleteUserHandle(@RequestParam Map param, WebRequest wr) {
	   String id = (String)param.get("getId");
	   String pass = (String)param.get("getPass");
	   Map map = new HashMap<>();
	   map.put("id", id);
	   map.put("pass", pass);
	   System.out.println(map);
	   Map mapp = accountRepository.getAccount(map);
	   System.out.println(mapp);
	   if(mapp != null) {
		   accountRepository.deleteUser(id);
		   wr.setAttribute("deleteYes", true, WebRequest.SCOPE_REQUEST);
		   return "WEB-INF/views/deleteUser.jsp";
	   }else {
		   wr.setAttribute("deleteErr", true, WebRequest.SCOPE_REQUEST);
		   return "WEB-INF/views/deleteUser.jsp";
	   }
   }

   // 아이디 찾기
   @GetMapping("/find_user.do")
   public String FindUser() {
      return "/WEB-INF/views/account/findid.jsp";
   }

   @PostMapping("/find_user.do")
   public String FindUser(@RequestParam Map param, WebRequest wr, Map map) {

      String receiver = (String) param.get("email");

      System.out.println("이메일주소 보내요!!" + receiver);

      if (receiver != null) {
         Map fuser = accountRepository.FindUser(receiver);
         System.out.println("파인드 유저" + fuser);

         String fid = (String) fuser.get("ID");
         map.put("id", fid);

         SimpleMailMessage msg = new SimpleMailMessage();
         sender.createMimeMessage();
         msg.setSubject("재미나 아이디 찾기");
         String text = "회원님의 아이디는\n";

         System.out.println(receiver);

         text += fid;

         msg.setText(text);
         msg.setTo(receiver);
         msg.setFrom("amdin1@jamina.mockingu.com");
         System.out.println(msg);
         try {
            sender.send(msg);
            System.out.println("SUCCESS!");
         } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            System.out.println("Fail!");
         }
         wr.setAttribute("findidYes", true, WebRequest.SCOPE_REQUEST);
         return "/WEB-INF/views/account/login.jsp";
      } else
         return "/WEB-INF/views/account/findid.jsp";
   }

   // 비밀번호 찾기

   @GetMapping("/find_pass.do")
   public String Findpass(WebRequest wr) {
      return "/WEB-INF/views/account/findpass.jsp";

   }

   @PostMapping("/find_pass.do")
   public String Findpass(@RequestParam Map param, WebRequest wr) {
      ;
      /* String receiver = (String) param.get("email") */;

      String id = (String) param.get("getId");
      String receiver = (String) param.get("email");

      System.out.println(id + receiver);
      String npass = UUID.randomUUID().toString().split("-")[0];

      Map nuser = new HashMap();
      nuser.put("pass", npass);
      nuser.put("id", id);
      nuser.put("email", receiver);

      int i = accountRepository.FindPass(nuser);
      if (i == 1) {
         Map user = accountRepository.Myinfo(id);
         if (user != null) {

            String dpass = (String) user.get("PASS");

            SimpleMailMessage msg = new SimpleMailMessage();
            sender.createMimeMessage();
            msg.setSubject("재미나 비밀번호 찾기");
            String text = "회원님의 비밀번호 는\n";
            String text2 = "\n로그인 하시고 비밀번경을 하세요";
            System.out.println("변경된 비밀번호" + dpass);
            System.out.println(receiver);
            // ㅎㅇ
            text += dpass;
            text += text2;

            msg.setText(text);
            msg.setTo(receiver);
            msg.setFrom("amdin1@jamina.mockingu.com");
            try {
               sender.send(msg);
               System.out.println("SUCCESS!");
            } catch (Exception e) {
               // TODO: handle exception
               e.printStackTrace();
               System.out.println("Fail!");
            }
         }
         wr.setAttribute("findpassYes", true, WebRequest.SCOPE_REQUEST);
         return "/WEB-INF/views/account/login.jsp";
      } else {
         wr.setAttribute("findpassNo", 0, WebRequest.SCOPE_REQUEST);
         return "/WEB-INF/views/account/findpass.jsp";
      }

   }//end class

   // ----
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
      Map mapp = accountRepository.getAccount(map);
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
   
   //로그아웃
   @RequestMapping("logout.do")
   public String logoutHandle(HttpSession session, WebRequest wr) {
	  wr.removeAttribute("auth", WebRequest.SCOPE_SESSION);
	  wr.removeAttribute("user", WebRequest.SCOPE_SESSION);
	  wr.removeAttribute("loginId", WebRequest.SCOPE_SESSION);
	  return "redirect:index.do";
   }
   // ----------------------------------------------------------------------------------------------------------------------------

   @Autowired
   ServletContext ctx;

   // 판매자 계좌번호 등록
   @GetMapping("/addbank.do")
   public String AddBankGetHandle(HttpSession session) {
      Map suser = (Map) session.getAttribute("user");
      String sid = (String) suser.get("ID");
      Map duser = (Map) accountRepository.Myinfo(sid);
      String dbank = (String) duser.get("BANK");

      // 이미 등록했으면 판매글 오리기로 이동
      Map dseller = (Map) accountRepository.Sellerinfo(sid);
      System.out.println("판매자 정보" + dseller);
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
         int i = accountRepository.addbank(p);
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
      System.out.println("유저 정보" + m);
      String id = (String) m.get("ID");
      System.out.println("유저 아이디" + id);

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
         int i = accountRepository.addSeller2(param);
      } else {
         int i = accountRepository.addSeller1(param);
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
      return "account.sellerHomme";
   }
   // ----------------------------------------------------------------------------------------------------------------------------
   // 판매자 블러그 올린글 확인

   // 판매자 블러그 올린글 확인

   @RequestMapping("/myboard.do")
   public String MyBoardHandle(HttpSession session) {
      Map suser = (Map) session.getAttribute("user");
      String id = (String) suser.get("ID");

      Map duser = accountRepository.Myinfo(id);
      System.out.println("회원정보다" + duser);
      String dbank = (String) duser.get("BANK");

      if (dbank != null) {
         List<Map> MyBoard = SellerRepository.getmyboard(id);
         System.out.println(MyBoard);
         session.setAttribute("MyBoard", MyBoard);

         // 판매자 정보 가지고 오기
         Map Seller = SellerRepository.getSeller(id);
         session.setAttribute("Seller", Seller);
         return "account.sellerHomme";
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
      Map suserr = accountRepository.getAccountById(sid);
      String spass = (String) suserr.get("PASS");
      String pass1 = (String) p.get("getPass1");
      String pass2 = (String) p.get("getPass2");
      if (spass.equals(pass1) & !pass1.equals(pass2)) {
    	  Map user_new = new HashMap();
    	  user_new.put("id", sid);
    	  user_new.put("pass", pass2);
    	  accountRepository.changeuser(user_new);
    	  wr.setAttribute("changePassYes", true, WebRequest.SCOPE_REQUEST);
    	  return "/WEB-INF/views/account/mypage/modified/changeUser.jsp";
      } else if(spass.equals(pass1) & pass1.equals(pass2)){
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
   //-------------------------------------------------------------------------------------------------------------------------------



}