package app.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.models.QAMessageRepository;
import app.models.SellerRepository;
import app.service.SocketService;

@Controller
public class QAController {
	
	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	SocketService socketService;
	
	@Autowired
	QAMessageRepository mrepo;
	
	@GetMapping("/qalist.do")
	public String buyqaHandle(Map map , HttpSession session, @RequestParam Map param) {
		Map user = (Map)session.getAttribute("user");
		
		List<Map> getChatList = mrepo.getChatList((String)user.get("ID"));
		
		if(getChatList!=null) {
			map.put("chatList", getChatList);
			
			System.out.println("리스트"+getChatList);
		}
		return "account.qaList";
	}
	
	
	
	@GetMapping("/qa/buyqa.do")
	public String buyqaHandle(@RequestParam Map param, Map map, HttpSession session) {
		int no = Integer.parseInt((String)param.get("no"));
		String writer = (String)param.get("writer");
		map.put("no", no);
		map.put("writer", (String)param.get("writer"));
		Map user = (Map)session.getAttribute("user");
		String userid = (String)user.get("ID");
		
		Map writers = sellerrepo.getSeller((String)param.get("writer"));
		map.put("Seller", writers);
		
		List<Map> getChatLog = mrepo.getChatLog((String)param.get("writer"), (String)user.get("ID"));
		if(getChatLog.size()==0) {
			String room = UUID.randomUUID().toString().split("-")[0].toString();	
			
			List member = new ArrayList<>();
			member.add((String)param.get("writer"));
			member.add(user.get("ID"));

			
			Map log = new HashMap<>();
			log.put("room", room);
			log.put("no", no);
			log.put("writer", writer);
			log.put("member", member);	
			log.put("log", new ArrayList<>());
			
			mrepo.insertOne(log);
			
			map.put("qamode", room);
		}else {
			Map maps = getChatLog.get(0);
			String room = (String)maps.get("room");
			map.put("qamode", room);
			map.put("no", no);
			map.put("chatlog", maps.get("log"));
		}
		
		/*
		
		Map user = (Map)session.getAttribute("user");
		
		
		session.setAttribute("writer", writer);
		
		if(getChatLog.size()==0){
			
			map.put("qamode", room);
			
		}else {
		}*/
		return "redirect:/chatLog.do";
	}
	
	
	
	@GetMapping("/chatLog.do")
	public String buyqaHandle(@RequestParam Map param, Map map, WebRequest wr) {
		
		Map user = (Map)wr.getAttribute("user", WebRequest.SCOPE_SESSION);
		
		String writer = (String)param.get("writer");
		
		Map writers = sellerrepo.getSeller(writer);
		
		map.put("Seller", writers);
		System.out.println("파라미터     "+param);
		
		List<Map> getChatLog = mrepo.getChatLog((String)param.get("writer"), (String)user.get("ID"));
		Map maps = getChatLog.get(0);
		
		
		
		map.put("qamode", (String)param.get("qamode"));
		map.put("chatlog", maps.get("log"));
		
		mrepo.updateCheckMember((String)param.get("qamode"),(String)user.get("ID"));
		
		/*String ids = (String)param.get("ids");
		List<Map> getChatList =mrepo.getChatOneLog(ids);
		map.put("chatlog", getChatList);
		
		
		Map user = (Map)wr.getAttribute("user", WebRequest.SCOPE_SESSION);
	*/
		return "account.buyQA";
	}
}
