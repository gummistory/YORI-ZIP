<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mypage_mycooklist.css">
</head>
<body>

  	<jsp:include page="/main/header.jsp" />
  	<h2>나의 쿠킹일지</h2>
  	
	<div class="mycooklist_container">
	
	    <div class="mycooklist_header">
	        <input type="checkbox" id="selectAll" value='selectall' onclick='selectAll(this)'>
	        <h4>전체선택</h4>
	        <button class="delete-btn">삭제</button>
	    </div>
	    <ul class="cooklist">
	        <li>
	            <input type="checkbox" id="cook1">
	            <label for="cook1"><a href="../main/view.jsp">8.15 우리집 쿠킹일지</a></label>
	        </li>
	        <li><input type="checkbox"></li>
	        <li><input type="checkbox"></li>
	        <li><input type="checkbox"></li>
	        <li><input type="checkbox"></li>
	        <li><input type="checkbox"></li>
	        <li><input type="checkbox"></li>
	        <li><input type="checkbox"></li>
	        <li><input type="checkbox"></li>      
	    </ul>
	</div>
	     <button class="write_cook" onclick="">작성하기</button>
	      
	<div class="pagination">
	    <a href="#">&laquo;</a>
	    <a href="#" class="active">1</a>
	    <a href="#">2</a>
	    <a href="#">&raquo;</a>
	</div>
    
    <jsp:include page="/mypage/mypage_window.jsp" />
	<jsp:include page="/chat/chat.jsp" />
  	<jsp:include page="/main/footer.jsp" />
  	
  	
  	<script src="${pageContext.request.contextPath}/static/js/mypage_mycooklist.js"></script>
  	
</body>
</html>