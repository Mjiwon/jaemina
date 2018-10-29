package app.accountcontrollers;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.models.AdminRepository;

@Controller
@RequestMapping("/admin")
public class AdminAccountController {
	
	@Autowired
	AdminRepository adminrepo;
	
	@RequestMapping("/index.do")
	public String adminIndexHandle(WebRequest wr) {
		if(wr.getAttribute("adminauth", WebRequest.SCOPE_SESSION)==null){
			return "/WEB-INF/views/admin/login.jsp";
		}else {
			return "/WEB-INF/views/admin/index.jsp";
		}
	}
	
	@GetMapping("/login.do")
	public String loginGetHandle() {
		return "/WEB-INF/views/admin/login.jsp";
	}
	
	@PostMapping("/login.do")
	public String loginPostHandle(@RequestParam Map param, HttpSession session) {
		Map info = adminrepo.getAdmininfo(param);
		System.out.println(info);
		if(info==null) {
			return "/WEB-INF/views/admin/login.jsp";
		}else {
			session.setAttribute("admin", info);
			session.setAttribute("adminauth", true);
			return "/WEB-INF/views/admin/index.jsp";			
		}
		
	}
}
