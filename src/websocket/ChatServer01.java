package websocket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatServer01")
public class ChatServer01 {

	@OnOpen
	public void onOpen() {
		System.out.println("연결됨");
	}
	
	@OnClose
	public void onClose() {
		System.out.println("종료됨");
	}
	
	@OnMessage
	public String onMessage(String message) {
		System.out.println("클라이언트메세지="+message);
		String echoMsg = "서버메세지="+message;
		return echoMsg;
	}
	
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
}
