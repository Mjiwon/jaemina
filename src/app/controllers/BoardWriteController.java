package app.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

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
public class BoardWriteController {

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

	
	
	// 판매글로 이동
		@GetMapping("/write.do")
		public String writeGetHandle(Map map, HttpSession session) {
			// profile 정보 불러와서 판매자 등록을 했는지 여부 판단해서 안했으면 판매자 등록페이지로 보내주고 아니면 글쓰기로 보내기
			String id = (String)((Map)session.getAttribute("user")).get("ID");
			Map profile = profilerepo.Sellerinfo(id);
			if(profile==null) {
				return "/WEB-INF/views/account/seller/addseller.jsp";
			}else {
				List<Map> bcatelist = caterepo.getBigCate();
				map.put("bigcate", bcatelist);
				
				return "account.boardWrite";
			}
		}

		// 판매글 DB에 insert
		@PostMapping("/write.do")
		public String writePostHandle(@RequestParam Map map, @RequestParam MultipartFile imgpath, WebRequest wr)
				throws IOException {
			// 파일(이미지) 업로드
			Integer no = boardrepo.getSequenceVal();
			map.put("no", no); // 뷰로 보낼 게시판 번호

			String filename = map.get("writer") + "-" + no + "-" + map.get("title") + "-board" + ".jpg";
			String path = ctx.getRealPath("\\storage\\board");
			String addr = (String) map.get("addr");
			System.out.println(addr);

			File dir = new File(path);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File dst = new File(dir, filename);
			imgpath.transferTo(dst);

			String img = path + "\\" + filename;
			map.put("imgpath", "\\storage\\board" + "\\" + filename);
				
			if(addr != null) {
				boardrepo.addBoard2(map);
			}else {
				boardrepo.addBoard1(map);
			}

			return "redirect:board/detail.do?no=" + no;
		}
}
