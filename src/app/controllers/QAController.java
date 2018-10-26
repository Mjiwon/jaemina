package app.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import app.service.SocketService;

@Controller
public class QAController extends TextWebSocketHandler{
	
	@Autowired
	SocketService socketService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		socketService.addSocket(session);
		//Map<String, Object> attrs = session.getAttributes();
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		socketService.removeSocket(session);
	}

}
