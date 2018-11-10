package app.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;


@Service
public class SocketService {	
	@Autowired
	Gson gson;
	
	public List<WebSocketSession> list; // 로그인하면 소켓리스트에 추가
	
	public SocketService() {
		list = new ArrayList<>();
	}
	
	// WebSocketSession 추가
	public boolean addSocket(WebSocketSession target) {
		return list.add(target);
	}
	
	// WebSocketSession 삭제
	public boolean removeSocket(WebSocketSession target) {
		return list.remove(target);
	}
	
	// 판매자에게 메세지 보내기
	public void sendOne(String txt, String target) {
		TextMessage msg = new TextMessage(txt);
		for(int i=0;i<list.size();i++) {
			try {
				WebSocketSession ws = list.get (i);
				Map info = (Map)ws.getAttributes().get("user");
				String userid = (String)info.get("ID");
				System.out.println(userid + "    " + target);
				if(userid.equals(target)) {
					ws.sendMessage(msg);
					break;				
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void sendOne(Map data, String target) {
		sendOne(gson.toJson(data),target);
	}
	
	
}
