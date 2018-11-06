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
public class AdminLoginController {
	
	@Autowired
	AdminRepository adminrepo;

	@Autowired
	AccountRepository accountrepo;
	
	@Autowired
	BoardRepository boardrepo;
	
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
	
	
	
	//--------------------------------------------------------------------------------------------------------------
	// 게시글 관리
	
	
	
	
	
}
