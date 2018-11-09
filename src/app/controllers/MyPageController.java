package app.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import app.models.BoardRepository;
import app.models.PayRepository;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	PayRepository payrepo;

	@Autowired
	BoardRepository boardrepo;

	// 판매관리
	@GetMapping("/managesell.do")
	public String managesellGetHandle(HttpSession session, Map map) {
		// seller 의 아이디 뽑기
		String seller = (String) session.getAttribute("loginId");
		// seller 의 판매 내역을 뽑아오기
		List<Map> mysellList = payrepo.getMysellList(seller);
		System.out.println("mysellList : "+mysellList);
		// view로 판매내역을 전달해 주기
		if (mysellList != null) {
			map.put("sellList", mysellList);
			map.put("sellListCnt", mysellList.size());

		}

		// board에 타이틀 가져오기
		List<Map> myboardlist = boardrepo.getmyboard(seller);

		return "mypage.managesell";
	}
	
	// 판매상태 변경
	@GetMapping("/sellchangestate.do")
	public String sellchangestateGetHandle(@RequestParam Map param, Map map) {
		// param 확인
		System.out.println("param : "+param);
		// postno 뽑아오기
		int postno = Integer.parseInt((String)param.get("postno"));
		// 판매 정보 뽑아오기
		Map mysell = payrepo.getMysellno(postno);
			// 뷰에 판매정보 뿌리기
			map.put("mysell", mysell);
		return "mypage.sellchangestate";
	}
	
	@PostMapping("/sellchangestate.do")
	public String sellchangestatePostHandle(@RequestParam Map param, Map map) {
		// param 확인
		System.out.println("param : "+param);
		
		// param에서 필요한 데이터 추출 (no, selling)
		int no = Integer.parseInt((String)param.get("no"));
		int selling = Integer.parseInt((String)param.get("selling"));
		
		// 판매상태확인 변경
		Map data = new HashMap();
		data.put("no", no);
		data.put("selling", selling);
		int r = payrepo.updateSelling(data);
		System.out.println("판매상태 변경 : "+r);
		// 완료
		return "account.history";
	}
	

	// 구매관리
	@GetMapping("/managebuy.do")
	public String managebuyGetHandle(HttpSession session, Map map) {
		// 구매자 의 아이디 뽑기
		String buyer = (String)session.getAttribute("loginId");
		// 구매자 의 구매 내역을 뽑아오기
		List<Map> mybuyList = payrepo.getMysellList(buyer);
		System.out.println("mysellList : "+mybuyList);
		// view로 판매내역을 전달해 주기
		if (mybuyList != null) {
			map.put("sellList", mybuyList);
			map.put("sellListCnt", mybuyList.size());
		}
		// board에 타이틀 가져오기
		List<Map> myboardlist = boardrepo.getmyboard(buyer);
		return "mypage.managebuy";
	}
	
	// 판매상태 변경
		@GetMapping("/buychangestate.do")
		public String buychangestateGetHandle(@RequestParam Map param, Map map) {
			// param 확인
			System.out.println("param : "+param);
			// postno 뽑아오기
			int postno = Integer.parseInt((String)param.get("postno"));
			// 판매 정보 뽑아오기
			Map mybuy = payrepo.getMybuyno(postno);
				// 뷰에 판매정보 뿌리기
				map.put("mybuy", mybuy);
			return "mypage.buychangestate";
		}
		
		@PostMapping("/buychangestate.do")
		public String buychangestatePostHandle(@RequestParam Map param, Map map) {
			// param 확인
			System.out.println("param : "+param);
			
			// param에서 필요한 데이터 추출 (no, selling)
			int no = Integer.parseInt((String)param.get("no"));
			int buying = Integer.parseInt((String)param.get("buying"));
			
			// 판매상태확인 변경
			Map data = new HashMap();
			data.put("no", no);
			data.put("buying", buying);
			int r = payrepo.updateBuying(data);
			System.out.println("구매상태 변경 : "+r);
			// 완료
			return "account.history";
		}

	// 판매자 등록 인증시 1원 결제

	// 판매자 등록 인승성공후 1원 환불

}
