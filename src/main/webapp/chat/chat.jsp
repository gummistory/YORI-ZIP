<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/chat.css">
</head>
<body>

 <!-- 모달 열기 이미지 -->
    <img src="${pageContext.request.contextPath}/static/images/Group 252.png" alt="모달 열기 이미지" class="open-chat-img">

    <!-- 모달 오버레이 및 컨테이너 -->
    <div class="chat-overlay">
        <div class="chat-container">
            <div class="chat-header">
                <img src="${pageContext.request.contextPath}/static/images/Group 290.png" alt="YORI:ZIP 로고">
                <div>
                    <h2>YORI:ZIP</h2>
                    <h4>운영시간 보기 ></h4>
                </div>
            </div>
            <div class="chat-body" id="chat-content">
            <div class="chat-body-head">
            <img src="${pageContext.request.contextPath}/static/images/Group 290.png" alt="YORI:ZIP 로고">
            <h4>YORI:ZIP</h4>
            </div>
                <p>안녕하세요. YORI:ZIP 고객센터입니다! 어떤 도움이 필요하신가요?</p>
                <p>[고객센터 운영 시간]<br>
                   채팅 상담: 9:00-17:30<br>
                   유선 상담: 10:00-17:00<br>
                   점심: 12:00-13:00<br>
                   주말/공휴일 OFF</p>
                    <button class="chatbtnMain" onclick="toggleButtons()" >자주 묻는 질문</button>
                    <button class="chatbtn" onclick="location.href='https://naver.com'">쿠킹일지는 어떻게 작성하나요?</button>
                    <button class="chatbtn" onclick="location.href='https://naver.com'">공지사항</button>
                    <button class="chatbtn" onclick="location.href='https://naver.com'">자주 묻는 질문</button>
                    <div class="chat-footer">
                <button>문의하기</button>
            </div>
            </div>
            
         
            <!-- 네비게이션바 -->
           <div class="nav_bar">
           <img src="${pageContext.request.contextPath}/static/images/homeicon.png" alt="YORI:ZIP 로고" onclick="loadPage('chat_list.jsp')">
           
           </div>
           <div class="nav_bar2">
          
           <img src="${pageContext.request.contextPath}/static/images/chaticon.png" alt="YORI:ZIP 로고" onclick="loadPage('chat_list.jsp')">
           
           
           
           </div><div class="nav_bar3">
           <img src="${pageContext.request.contextPath}/static/images/seticon.png" alt="YORI:ZIP 로고" onclick="loadPage('chat_list.jsp')">
           
           </div>
           
        </div>
    </div>

    <!-- 우측 하단 닫기 버튼 -->
     <button class="close-btn-fixed">&times;</button>   

<script src="${pageContext.request.contextPath}/static/js/chat.js"></script>
</body>
</html>