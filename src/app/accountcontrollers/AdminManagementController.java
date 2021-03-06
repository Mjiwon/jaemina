package app.accountcontrollers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.models.AccountRepository;
import app.models.AdminQARepository;
import app.models.AdminRepository;
import app.models.BoardRepository;
import app.models.PayRepository;

@Controller
@RequestMapping("/admin")
public class AdminManagementController {

	@Autowired
	AdminRepository adminrepo;

	@Autowired
	AccountRepository accountrepo;
	
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
	
	@Autowired
	PayRepository payrepo;
	
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
	
	// 거래 관리
	// 판매완료, 환불, 취소 등등 리스트를 가져와서 계좌로 보내주기(형식만)
	@GetMapping("/managepay.do")
	public String payGetHandle() {
		// 판매완료
		List<Map> payend = payrepo.payendlist();
		System.out.println("거래완료 리스트 : "+payend);
		List<Map> refundend = payrepo.refundendlist();
		System.out.println("환불 완료 리스트 : "+refundend + "환불완료 건스 : "+refundend.size());
		List<Map> cancel = payrepo.cancelpaylist();
		System.out.println("취소 완료 리스트 : "+cancel+" / 취소완료 건수 : "+cancel.size());
		return "";
	}
	
	
	
	
}
