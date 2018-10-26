package app.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MPayMentController {

	@PostMapping("/choespayment.do")
	public String choespaymentHandle(@RequestParam Map param, @RequestParam String[] cardnum) {
		System.out.println(param);
		String[] cardnumber = new String[cardnum.length];
		for(int i = 0; i<cardnum.length;i++) {
			cardnumber[i]=cardnum[i];
		}
		param.put("cardnum", cardnumber);
		System.out.println(param);
		return "/index.do";
	}
}
