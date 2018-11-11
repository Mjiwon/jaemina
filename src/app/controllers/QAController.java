package app.controllers;

import java.text.SimpleDateFormat;
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

import app.models.CateRepository;
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

	@Autowired
	CateRepository caterepo;
	
	/*@GetMapping("/qalist.do")
	public String buyqaHandle(Map map , HttpSession session, @RequestParam Map param) {
		Map user = (Map)session.getAttribute("user");
		String id= (String)user.get("ID");
		List<Map> getChatList = mrepo.getChatList((String)user.get("ID"));		
		
		if(getChatList!=null) {

			Map z = new HashMap<>();
			   List log = new ArrayList<>();
			   for(int i = 0; i<getChatList.size();i++) {
				   z = getChatList.get(i);
				   log = (List)z.get("log");
			   }
			   
			   List check = new ArrayList<>();
			   for(int i = 0; i<log.size();i++) {
				   Map b = (Map)log.get(i);
				   check = (List)b.get("checkMember");
				   if(check.contains((String)user.get("ID"))) {
					   z.put("noCheck",true);
				   }
			   }
			
		}
		map.put("chatList", getChatList);
		return "account.qaList";
	}
	
	*/
	
	@GetMapping("/qa/buyqa.do")
	public String buyqaHandle(@RequestParam Map param,@RequestParam String[] members, Map map, HttpSession session) {
		int no = Integer.parseInt((String)param.get("no"));
		String writer = (String)param.get("writer");
		
		map.put("no", no);
		map.put("writer", (String)param.get("writer"));
		map.put("members", members);
		Map user = (Map)session.getAttribute("user");
		String userid = (String)user.get("ID");
		
		Map writers = sellerrepo.getSeller((String)param.get("writer"));
		map.put("Seller", writers);
		
		List<Map> getChatLog = mrepo.getChatLog(members[0], members[1]);
		System.out.println("작성자 " + (String)param.get("writer") + " / 나 " + (String)user.get("ID") );
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

		return "redirect:/chatLog.do";
	}
	
	@GetMapping("/qa/buyqaa.do")
	public String buyqaaHandle(@RequestParam Map param,@RequestParam String[] members, Map map, HttpSession session) {
		String writer = (String)param.get("writer");
		map.put("writer", (String)param.get("writer"));
		map.put("members", members);
		Map user = (Map)session.getAttribute("user");
		String userid = (String)user.get("ID");
		
		Map writers = sellerrepo.getSeller((String)param.get("writer"));
		map.put("Seller", writers);
		
		List<Map> getChatLog = mrepo.getChatLog(members[0], members[1]);
		System.out.println("작성자 " + (String)param.get("writer") + " / 나 " + (String)user.get("ID") );
		if(getChatLog.size()==0) {
			String room = UUID.randomUUID().toString().split("-")[0].toString();	
			
			List member = new ArrayList<>();
			member.add((String)param.get("writer"));
			member.add(user.get("ID"));

			
			Map log = new HashMap<>();
			log.put("room", room);
			log.put("writer", writer);
			log.put("member", member);	
			log.put("log", new ArrayList<>());
			
			mrepo.insertOne(log);
			
			map.put("qamode", room);
			
		}else {
			Map maps = getChatLog.get(0);
			String room = (String)maps.get("room");
			map.put("qamode", room);
			map.put("chatlog", maps.get("log"));
		}

		return "redirect:/chatLog.do";
	}
	
	
	
	@GetMapping("/chatLog.do")
	public String buyqaHandle(@RequestParam Map param,@RequestParam String[] members, Map map, WebRequest wr) {
		
		Map user = (Map)wr.getAttribute("user", WebRequest.SCOPE_SESSION);
		
		String writer = (String)param.get("writer");
		
		Map writers = sellerrepo.getSeller(writer);

		map.put("Seller", writers);
		
		List<Map> getChatLog = mrepo.getChatLog(members[0], members[1]);
		Map maps = getChatLog.get(0);
		
		
		List m = (List)maps.get("log");
		for(int i = 0; i<m.size();i++) {
			Map ma = (Map)m.get(i);
			ma.get("senddate");
			ma.put("senddate", new SimpleDateFormat("yyyy-MM-dd HH:mm").format(ma.get("senddate")));
		}
		
		map.put("mode", (String)param.get("qamode"));
		System.out.println("모드가 " + (String)param.get("qamode"));
		map.put("chatlog", maps.get("log"));
		map.put("member", maps.get("member"));
		List<Map> bcatelist = caterepo.getBigCate();
		List<Map> scatelist = caterepo.getSmallcateAllList();
		map.put("smallcate", scatelist);
		map.put("bigcate", bcatelist);
		
		
		mrepo.updateCheckMember((String)param.get("qamode"),(String)user.get("ID"));
	
		return "account.buyQA";
	}
}
