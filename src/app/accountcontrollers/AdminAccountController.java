package app.accountcontrollers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("/admin")
public class AdminAccountController {
	
	@RequestMapping("index.do")
	public String adminIndexHandle(WebRequest wr) {
		if(wr.getAttribute("adminauth", WebRequest.SCOPE_SESSION)==null){
			return "/WEB-INF/views/admin/login.jsp";
		}else {
			return "/WEB-INF/views/admin/index.jsp";
		}
	}
}
