package app.accountcontrollers;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.models.AccountRepository;
import app.models.AdminRepository;

@Controller
@RequestMapping("/admin")
public class AdminAccountController {
	
	@Autowired
	AdminRepository adminrepo;
	
	@RequestMapping("/index.do")
	public String adminIndexHandle(HttpSession session) {
		if(session.getAttribute("adminmode")==null){
			return "/WEB-INF/views/admin/login.jsp";
		}else {
			return "admin.human";
		}
	}
	
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

	@Autowired
	AccountRepository accountrepo;
	
	@GetMapping("/account.do")
	public String accountHandle(Map map) {
		map.put("account", accountrepo.getAccountList());
		map.put("accountsize", accountrepo.getAccountList().size());
		return "admin.human.account";
	}
	
	@PostMapping("/account.do")
	public String accountPostHandle(@RequestParam Map param, Map map) {
		map.put("account", accountrepo.getAccountList());
		return "admin.human.account";
	}
	
	
	
	
}
