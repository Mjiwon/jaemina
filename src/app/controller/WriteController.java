package app.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WriteController {

	@GetMapping("/write.do")
	public String writeGetHandle() {
		
		return "WEB-INF/views/in.jsp";
	}
	
}
