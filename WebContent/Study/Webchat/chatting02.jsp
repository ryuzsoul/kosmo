<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap4 CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<input type="text" id="chat_id"
  value="<%=session.getId().substring(0, 10)%>"  
  style="border:1px dotted red; width:200px;" />
<fieldset style="width:350px; text-align:center;">
  <legend>채팅창</legend>  
  <!-- 대화입력창 -->  
  <input type="text" id="inputMessage" style="width:300px; margin-bottom:5px;"/>
  <br />
  <input type="button" onclick="sendMessage();" value="보내기"/>
  <input type="button" onclick="disconnect();" value="채팅종료"/> 
  <br />
  <!-- 대화출력창 -->
  <textarea id="messageWindow" style="width:300px; height:400px; margin-top:10px;" readonly></textarea>
</fieldset>
<script>
var messageWindow = document.getElementById("messageWindow");
var inputMessage = document.getElementById('inputMessage');
var chat_id = document.getElemntById('chat_id').value;
var webSocket = new WebSocket('ws://localhost:8080/Kosmo/ChatServer02');
webSocket.onopen = function(event) {
	wsOpen(event);
};
webSocket.onmessage = function(event) {
	  wsMessage(event);
};
webSocket.onclose = function(event) {
	  wsClose(event);
};	
webSocket.onerror = function(event) {
    wsError(event);
};  

function wsMessage(event) {
	var message = event.data.split('|');
	var sender = message[0];
	var content = message[1];
	if (content=='') {
		
	} else{
		messageWindow.value += sender+':'+content+'\n';
	}
}

function sendMessage() {
	messageWindow.value += 'ME:'+inputMessage.value+'\n';
	webSocket.send(chat_id+'|'+inputMessage.value);
	inputMessage.value='';
}
</script>
</body>
</html>