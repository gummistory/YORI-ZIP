<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/chat_list.css">
</head>
<body>

 <!-- 모달 열기 이미지 -->
    <img src="${pageContext.request.contextPath}/static/images/Group 252.png" alt="모달 열기 이미지" class="open-chat-img">

    <!-- 모달 오버레이 및 컨테이너 -->
    <div class="chat-overlay">
        <div class="chat-container">
            <div class="chat-header">
           
            </div>
            <div class="chat-body">
            
            
            <div class="chat-body-head">            
            </div>
              
                    <div class="chat-footer">
                <button>새 문의하기</button>
            </div>
            </div>
            
         
            <!-- 네비게이션바 -->
           <div class="nav_bar">
           <img src="${pageContext.request.contextPath}/static/images/homeicon_grey.png" alt="YORI:ZIP 로고" onclick="location.">
           
           </div>
           <div class="nav_bar2">
           <img src="${pageContext.request.contextPath}/static/images/chaticon_color.png" alt="YORI:ZIP 로고">
           
           </div><div class="nav_bar3">
           <img src="${pageContext.request.contextPath}/static/images/seticon.png" alt="YORI:ZIP 로고">
           
           </div>
           
        </div>
    </div>

    <!-- 우측 하단 닫기 버튼 -->
     <button class="close-btn-fixed">&times;</button>   

<script src="${pageContext.request.contextPath}/static/js/chat.js"></script>
</body>
</html>