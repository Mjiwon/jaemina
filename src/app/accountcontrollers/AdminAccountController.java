package app.accountcontrollers;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.models.AccountRepository;
import app.models.AdminQARepository;
import app.models.AdminRepository;
import app.models.BoardRepository;

@Controller
@RequestMapping("/admin")
public class AdminAccountController {
	
	@Autowired
	AdminRepository adminrepo;
	//--------------------------------------------------------------------------------------------------------------
	// index
	
	@RequestMapping("/index.do")
	public String adminIndexHandle(HttpSession session) {
		if(session.getAttribute("adminmode")==null){
			return "/WEB-INF/views/admin/login.jsp";
		}else {
			return "admin.human";
		}
	}
	//--------------------------------------------------------------------------------------------------------------
	// login
	@GetMapping("/login.do")
	public String loginGetHandle() {
		return "/WEB-INF/views/admin/login.jsp";
	}
	
	@PostMapping("/login.do")
	public String loginPostHandle(@RequestParam Map param, HttpSession session) {
		Map admin = adminrepo.getAdmininfo(param);
		
		if(admin==null) {
			return "/WEB-INF/views/admin/login.jsp";
		}else {
			int did = ((BigDecimal)admin.get("DID")).intValue();
			session.setAttribute("admin", admin);
			String id = (String)param.get("id");
			// 부서 등록                                                                        
			Map depart = adminrepo.getAdmindepart(did);
			session.setAttribute("depart", (String)depart.get("DEPART"));
			// 직급 등록
			Map position = adminrepo.getAdminposition(((BigDecimal)admin.get("PID")).intValue());
			session.setAttribute("position", (String)position.get("PNAME"));
			 session.setAttribute("auth", true); // 새로 로그인
	         session.setAttribute("user", admin);
	         session.setAttribute("adminmode", true);
	         			// 부서에 맞는 tiles로 이동
			if(did==100) {
				return "admin.human";
			}else if(did==200) {
				return "admin.management";				
			}else {
				return "admin.finance";
			}
		}
	}
	//--------------------------------------------------------------------------------------------------------------
	@Autowired
	AccountRepository accountrepo;
	// 인사부
	@GetMapping("/account.do")
	public String adminaccountHandle(Map map) {
		map.put("accountlist", accountrepo.getAccountList());
		map.put("accountsize", accountrepo.getAccountList().size());
		return "admin.human.account";
	}
	
	//	인사부 회원가입
	@GetMapping("/join.do")
	public String addGetHandle(ModelMap map) {
		
		map.put("adp", adminrepo.getAllDeparts());
		map.put("aps", adminrepo.getAllPositions());
		
		return "admin.join";
	}
	
	@PostMapping("/join.do")
	public String addPostHandle(@RequestParam Map param) {
		
		System.out.println(param);
		int i = adminrepo.addAdmin(param);	
		if (i == 1) {
			return "/WEB-INF/views/admin/login.jsp";
		} else {
			return "admin.join";			
		}
		
	}
	
	/*@PostMapping("/account.do")
	public String adminaccountPostHandle(@RequestParam Map param, Map map) {
		map.put("accountlist", accountrepo.getAccountList());
		return "admin.human.account";
	}*/
	// 인사부 회원 삭제
	@GetMapping("/deluser.do")
	public String admindeluserHandle(@RequestParam Map param,Map map) {
		int r = accountrepo.deleteUser((String)param.get("id"));
		System.out.println("delete user result : "+r);
		map.put("accountlist", accountrepo.getAccountList());
		map.put("accountsize", accountrepo.getAccountList().size());
		return "admin.human.account";
	}
	//--------------------------------------------------------------------------------------------------------------
	// 게시글 관리
	
	@Autowired
	BoardRepository boardrepo;
	
	@GetMapping("/board.do")
	public String adminboardGetHandle(Map map) {
		map.put("boardlist", boardrepo.getBoardList());
		map.put("boardsize", boardrepo.getBoardList().size());
		return "admin.board";
	}
	
	// 게시글 삭제
	@GetMapping("/delboard.do")
	public String admindelboardHandle(@RequestParam Map param,Map map) {
		int r = boardrepo.deleteDetailBoard(Integer.parseInt((String)param.get("no")));
		System.out.println("del board result : "+r);
		map.put("boardlist", boardrepo.getBoardList());
		map.put("boardsize", boardrepo.getBoardList().size());
		return "admin.board";
	}
	
	//--------------------------------------------------------------------------------------------------------------
	// 판매자 승인 리스트
	@GetMapping("/permitsellerlist.do")
	public String adminpermitsellerlistHandle(Map map) {
		map.put("permitsellerlist", accountrepo.getSellerpermitlist());
		return "admin.permitsellerlist";
	}
	// 판매자 승인 
	@GetMapping("/permitseller.do")
	public String adminpermitsellerHandle(@RequestParam Map param, Map map) {
		System.out.println("permit seller id : "+(String)param.get("id"));
		int r = accountrepo.permitSeller((String)param.get("id"));
		System.out.println("permitseller result : "+r);
		map.put("permitsellerlist", accountrepo.getSellerpermitlist());
		return "admin.permitsellerlist";
	}
	
	//--------------------------------------------------------------------------------------------------------------
	// 문의가져오기
	@Autowired
	AdminQARepository adminqarepo;
	
	// 안읽은 문의 가져오기
	@GetMapping("/qa.do")
	public String adminqaGetHandle(Map map) {
		map.put("adminqalist", adminqarepo.getadminQunreadllist());
		return "admin.adminqa";
	}
	// 선택한 문의 답변하기
	@GetMapping("/replyqa.do")
	public String adminqareplyHandle(@RequestParam Map param, Map map) {
		int no = Integer.parseInt((String)param.get("no"));
		map.put("adminqa", adminqarepo.getadminQAinfo(no));
		System.out.println("adminqa getinfo : "+map);
		return "admin.adminqa.reply";
	}
	@PostMapping("/replyqa.do")
	public String adminqareplyPostHandle(@RequestParam Map param, Map map) {
		int r = adminqarepo.replyadminqa(param);
		System.out.println("adminqa reply result : "+r);
		map.put("adminqalist", (List<Map>)adminqarepo.getadminQunreadllist());
		return "admin.adminqa";
	}
	
	// 전제 문의 리스트 가져오기
	
	
}
