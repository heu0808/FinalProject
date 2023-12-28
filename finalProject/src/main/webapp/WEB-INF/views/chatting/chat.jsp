<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="././resources/css/chat.css">
</head>
<body>
   <header>
        <div class="cr-left">
            <img class="prev-menu" src="./resources/icon/left-arrow.png" onclick="prevAction()" >
            <span class="ct-name">&nbsp;&nbsp;sender</span> 
            <div class="ct-info">
                <span> &nbsp;평균&nbsp;</span>
                <span class="ct-time">6시간&nbsp;</span>
                <span>이내 응답</span>
            </div>
        </div>
        <div class="cr-right">
            <button class="btn-tr">거래하기</button>
            <button class="btn-rv">리뷰작성</button>
        </div>
    </header>
    <div class="chat-area">
		<c:forEach var="msg" items="${msgList}">
			<c:choose>
				<c:when test="${msg.senderNo eq loginUser.memberNo}">
					<div class="box2">
			        	<div class="chatbox-right">
							${msg.msg} ${msg.memberName}
			                <div class="chat-time-right-load">
					             <script>
				                    var timestamp = new Date('${msg.createDate}');
				                    var formattedTime = new Intl.DateTimeFormat('ko-KR', {
				                        hour: 'numeric',
				                        minute: 'numeric',
				                        hour12: true  // 12시간 형식 사용
				                    }).format(timestamp);
				                    document.write(formattedTime);
				                </script>
			                </div>
			                <div class="chat-count-right-load">안읽음</div>
			            </div>
					</div>	
				</c:when>
				<c:otherwise>
					<div class="box">
			        	<div class="chatbox">
							${msg.msg}
			                <div class="chat-time">
					             <script>
				                    var timestamp = new Date('${msg.createDate}');
				                    var formattedTime = new Intl.DateTimeFormat('ko-KR', {
				                        hour: 'numeric',
				                        minute: 'numeric',
				                        hour12: true  // 12시간 형식 사용
				                    }).format(timestamp);
				                    document.write(formattedTime);
				                </script>
			                </div>
			                <div class="chat-count">안읽음</div>
			            </div>
					</div>	
				</c:otherwise>				
			</c:choose>
		</c:forEach>
        <!-- <div class="cr-time">2023년 11월 27일 월요일</div>
        <div class="box">
            <div class="chatbot-chatbox">
                <span class="text-output">
                    안녕하세요! 품앗이 상담 챗봇입니다. <br>
                    원하시는 서비스를 선택해주시면 됩니다.
                </span>
            </div>
        </div>
        <div class="box">
            <div class="chatbox">
                <div class="chat-header"><h3>서비스 목록</h3></div>
                <br>
                <button class="option-btn">가격 안내를 받고 싶습니다.</button>
                <button class="option-btn">전화 상담 안내를 받습니다.</button>
                <button class="option-btn">예약을 하고 싶습니다.</button>
                <br>
                <div class="chat-time">오후 2:06</div>
            </div>
        </div>  -->
    
        <!-- <div class="box2">
            <div class="chatbox-right">
                가격 안내를 받고 싶습니다.
                <div class="chat-time-right">오후 2:06</div>
                <div class="chat-count-right">안읽음</div>
            </div>
        </div> -->
        <!-- <div class="box">
            <div class="chatbot-chatbox">
                <span class="text-output">
                    주 1회 1시간씩 한 달 총 15만원 <br>
                    주 2회 40분씩 한 달 총 20만원입니다<br>
                    카드 결제도 됩니다^^
                </span>
            </div>
        </div>
    
        <div class="box">
            <div class="chatbox">
                <div class="chat-header"><h3>제약 없이 마음놓고</h3></div>
                <br>
                <button class="option-btn">가격 안내를 받고 싶습니다.</button>
                <button class="option-btn">전화 상담 안내를 받습니다.</button>
                <button class="option-btn">예약을 하고 싶습니다.</button>
                <br>
                <div class="chat-time">오후 2:08</div>
            </div>
        </div>
    
        <div class="box2">
            <div class="chatbox-right">
                읽으시면 채팅 주세요
                <div class="chat-time-right">오후 2:09</div>
            </div>
        </div> -->
    
        <div class="cr-time">2024년 1월 04일 목요일</div>
        <!-- <div class="box" id="chat-container">
            <div class="chatbox">
                <span class="text-output">ㅇ</span>
                <div class="chat-time">오후 5:08</div>
                <div class="chat-count">안읽음</div>
            </div>
        </div>
        <div class="box2" id="msg-container">
            <div class="chatbox-right">
                <div class="chat-time-right">Timestamp</div>
                <div class="chat-count-right">안읽음</div>
            </div>
        </div> -->
    
    </div>

    <br><br><br><br><br>
    <br><br><br><br><br>
    <br><br><br><br><br>
    <br><br><br><br><br>
    
    <footer class="cr-ft">
        <button class="send-btn2"></button>
        <input class="text-area" id="type-text" type="text" name="msg">
        <button class="send-btn" id="msg-btn" onclick="sendMsg();">전송</button>
    </footer>
    <script>
        function prevAction(){
            history.go(-1);
        }
        //socket연결 요청
        const socket = new WebSocket("ws://localhost:5555/finalProject/chat");

        //socket연결 성공 시
        socket.onopen = function(){
            console.log("웹소켓 연결 ok...");
        }

        //socket연결 끊어졌을 시 
        socket.onclose = function(){
            console.log("웹소켓 끊어짐...");
        }

        //socket연결 실패했을 시 
        socket.onerror = function(){
            console.log("웹소켓 연결 실패...");
            alert("웹 소켓 연결 실패");
        }


        //socket연결로 부터 데이터가 도착했을때
        //서버로부터 데이터가 도착했을 때
        socket.onmessage = function(ev){
            console.log(ev.data);
            //msgContainer.innerHTML += (ev.data + "<br>");
                     
            // 새로운 메시지를 담을 div 엘리먼트 생성
            const newMessageDiv = document.createElement('div');
            newMessageDiv.className = 'chatbox';

            // 텍스트 내용을 담을 span 엘리먼트 생성
            const textOutputSpan = document.createElement('span');
            textOutputSpan.className = 'text-output';
            textOutputSpan.textContent = ev.data;

            // 시간을 나타낼 div 엘리먼트 생성
            const chatTimeDiv = document.createElement('div');
            chatTimeDiv.className = 'chat-time';
            const timestamp = new Date().toLocaleDateString();
            chatTimeDiv.textContent = timestamp;

            // '안읽음'을 나타낼 div 엘리먼트 생성
            const chatCountDiv = document.createElement('div');
            chatCountDiv.className = 'chat-count';
            chatCountDiv.textContent = '안읽음';

            // 생성한 엘리먼트들을 조립
            newMessageDiv.appendChild(textOutputSpan);
            newMessageDiv.appendChild(chatTimeDiv);
            newMessageDiv.appendChild(chatCountDiv);

            const chatArea = document.querySelector(".chat-area");
            chatArea.appendChild(newMessageDiv);            
            
        }
	
        function sendMsg(){
        	const msgInput = document.querySelector("input[name=msg]"); //텍스트 입력칸 msgInput에 대입
        	const str = msgInput.value; //str에 텍스트 담기
        	//연결된 socket session에 데이터 전송

            const messageBox2 = document.createElement("div");
            messageBox2.className = "box2";

            const chatboxRight = document.createElement("div");
            chatboxRight.className = "chatbox-right";
            chatboxRight.textContent = str;

            const chatTimeRight = document.createElement("div");
            chatTimeRight.className = "chat-time-right";
            const timestamp = new Date().toLocaleDateString();
            chatTimeRight.textContent = timestamp;

            const chatCountRight = document.createElement("div");
            chatCountRight.className = "chat-count-right";
            chatCountRight.textContent = "안읽음";

            messageBox2.appendChild(chatboxRight);
            messageBox2.appendChild(chatTimeRight);
            messageBox2.appendChild(chatCountRight);

        	socket.send(str); //소켓에 str 텍스트 보내기

            //const msgContainer = document.getElementById("msg-container");
            //msgContainer.appendChild(messageBox2);
            
            const chatArea = document.querySelector(".chat-area");
            chatArea.appendChild(messageBox2);
        	
        	msgInput.value = ""; //텍스트 입력칸 비우기
        }

        $("#type-text").on("keypress", function(ev) {
            if (ev.keyCode === 13) {
                sendMsg();
            }
        });
        
    </script>
</body> 
</html>