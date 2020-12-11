package websocket;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("ChatServer02")
public class ChatServer02 {
	private static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("연결되었습니다");
		System.out.println("Open session id:"+ session.getId());
		System.out.println("session.getBasicRemote():"+ session.getBasicRemote());
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("종료되었습니다.");
	}
	
	@OnMessage
	public void onMessage(String message, Session session) 
			throws IOException{
		System.out.println(session.getId()+":"+message);
		
		synchronized (clients) {
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
	
}
