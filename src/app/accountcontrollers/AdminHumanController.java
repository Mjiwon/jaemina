package app.accountcontrollers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.models.AccountRepository;
import app.models.AdminRepository;
import app.models.BoardRepository;

@Controller
@RequestMapping("/admin")
public class AdminHumanController {

	@Autowired
	AdminRepository adminrepo;

	@Autowired
	AccountRepository accountrepo;
	
	@Autowired
	BoardRepository boardrepo;
	
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
	
	// 인사부 회원 삭제
	@GetMapping("/deluser.do")
	public String admindeluserHandle(@RequestParam Map param,Map map) {
		int r = accountrepo.deleteUser((String)param.get("id"));
		System.out.println("delete user result : "+r);
			map.put("accountlist", accountrepo.getAccountList());
			map.put("accountsize", accountrepo.getAccountList().size());
		return "admin.human.account";
	}
	
	
}
