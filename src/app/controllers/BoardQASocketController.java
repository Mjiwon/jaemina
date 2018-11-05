package app.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import app.models.QAMessageRepository;
import app.service.SocketService;

@Controller
public class BoardQASocketController extends TextWebSocketHandler {
	List<WebSocketSession> sockets;
	
	@Autowired
	QAMessageRepository qamr;

	@Autowired
	SocketService socketService;

	@Autowired
	Gson gson;

	public BoardQASocketController() {
		sockets = new ArrayList<>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		try {
			sockets.add(session);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Map<String, Object> attrs = session.getAttributes();
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("문의소켓 연결끝");
		try {
			sockets.remove(session);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		try {
			
			String got = message.getPayload();
			Map user = (Map) session.getAttributes().get("user");
			Map map = gson.fromJson(got, Map.class);
			map.put("sender", user.get("ID"));		
			
			String room = (String)map.get("mode");
			
			List<Map> list = qamr.roomDate(room);
			Map m = list.get(0);
			
			TextMessage msg = new TextMessage(gson.toJson(map));
			
			List<String> userList = new ArrayList<>();
			for (int i = 0; i < sockets.size(); i++) {
				try {
					sockets.get(i).sendMessage(msg);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			Map mongo = new HashMap();
			
			mongo.put("sender", map.get("sender"));
			mongo.put("text", map.get("text"));
			mongo.put("senddate", System.currentTimeMillis());
			mongo.put("checkMember", m.get("member"));
			
			
			int ret = qamr.updatelog(mongo, (String)map.get("mode"));
			if(ret<0) {
				System.out.println("채팅저장 실패");
			}else {
				System.out.println("채팅저장 성공");
			}
			qamr.updateCheckMember(room,(String)user.get("ID"));
			List log = (List)m.get("log");
			
			List checkMember = new ArrayList<>();
			for(int i = 0; i<log.size(); i++) {
				Map a = (Map)log.get(i);
				checkMember = (List)a.get("checkMember");
			}
			
			String target ="";
			if(checkMember.size()>0) {
				target =(String)checkMember.get(0);				
			}
			
			String json = "{\"mode\":\"boardQA\", \"room\":\""+room+"\"}";
			socketService.sendOne(json, target);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		

	}
}
