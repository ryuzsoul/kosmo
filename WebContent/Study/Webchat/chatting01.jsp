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
var webSocket = new WebSocket("ws://localhost:8080/Kosmo/ChatServer01");
var messageWindow = document.getElementById("messageWindow");
messageWindow.value="";
var message = document.getElementById("inputMessage");

webSocket.onopen = function(event) {
	messageWindow.value += "서버연결됨 \n";
};
webSocket.onclose = function(event) {
	messageWindow.value += "서버종료됨 \n";
};
webSocket.onerror = function(event) {
	messageWindow.value += "채팅중 에러발생 \n";
};
webSocket.onmessage = function(event) {
	messageWindow.value += "서버에서수신=> "+event.data+"\n";
};

function sendMessage() {
	var message = document.getElementById("inputMessage");
	messageWindow.value += "서버로 전송=>"+ message.value +"\n";
	webSocket.send(message.value);
	message.value = "";
}

function disconnect() {
	webSocket.close();
}
</script>
</body>
</html>