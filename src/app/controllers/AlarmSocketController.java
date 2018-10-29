package app.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import app.service.SocketService;

@Controller
public class AlarmSocketController extends TextWebSocketHandler{
 
	@Autowired
	SocketService service;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		service.addSocket(session);
		System.out.println("로그인 소켓 리스트" + service.list);
		Map<String, Object> attrs = session.getAttributes();
		System.out.println(attrs);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		service.removeSocket(session);
	}
}
