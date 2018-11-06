package app.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import app.models.AccountRepository;
import app.models.BoardRepository;
import app.models.CateRepository;
import app.models.ProfileRepository;
import app.models.QAMessageRepository;
import app.models.ReplyRepository;
import app.models.SellerRepository;
import app.models.WishlistRepository;
import app.service.SocketService;

@Controller
public class BoardReplyController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	Gson gson;

	@Autowired
	BoardRepository boardrepo;

	@Autowired
	AccountRepository accountrepo;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	QAMessageRepository oamr;

	@Autowired
	SellerRepository sellerrepo;
	
	@Autowired
	CateRepository caterepo;
	
	@Autowired
	WishlistRepository wishrepo;
	
	@Autowired
	ProfileRepository profilerepo;

	@Autowired
	ReplyRepository replyrepo;
	
	@Autowired
	QAMessageRepository mrepo;

	
	// 댓글 입력
	@RequestMapping(path = "/ajax/replyWrite.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ReplyWriteAjaxHandle(@RequestParam Map reply) {
		String bno = (String) reply.get("bno");
		int bno1 = Integer.parseInt(bno);

		String writer = (String) reply.get("writer");

		Map only = new HashMap();
			only.put("bno", bno);
			only.put("writer", writer);

		List<Map> onlyreply = replyrepo.onlyreply(only);

		if (onlyreply.size()==0) {
			int i = replyrepo.WriteReply(reply);
			return gson.toJson(i);
		} else {
			return gson.toJson(0);
		}
	}

	// 댓글 리스트
	@RequestMapping(path = "/ajax/replylist.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String RepleAjaxHandle(@RequestParam Map data) {
		String bno = (String) data.get("bno");
		int bbno = Integer.parseInt(bno);
		List<Map> replylist = replyrepo.ReplyLIst(bbno);
		return gson.toJson(replylist);
	}
	//댓글 수정
	@RequestMapping(path = "/ajax/modifyreply.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String RepleModifyAjaxHandle(@RequestParam Map data) {
		String bbno=(String)data.get("bno");
		int bno=Integer.parseInt(bbno);
			data.put("bno", bno);
		int update = replyrepo.Modify_Reply(data);
		return gson.toJson(update);
	}
			
	@RequestMapping("/modifyreply.do")
	public String modifyreply(@RequestParam String bno, Map map) {
			map.put("bno", bno);
		return "/WEB-INF/views/board/modifyreply.jsp";
	}
	//댓글 삭제
	@RequestMapping(path = "/ajax/deletereply.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String RepleDeleteAjaxHandle(@RequestParam Map data) {
					
		String bbno=(String)data.get("bno");
		int bno=Integer.parseInt(bbno);
			data.put("bno", bno);
		int delete = replyrepo.deletereply(data);
		return gson.toJson(delete);
	}
	
}
