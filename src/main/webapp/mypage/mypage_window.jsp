<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mypage.css">
</head>
<body>



    <!-- 팝업창 오버레이 -->
    <div id="myPageModal" class="modal-overlay">
        <div class="modal">

            <div class="profile-container">
                <img src="<c:out value='${sessionScope.user.profileImgUrl}'/>" alt="Icon" width="50">
                <h4><c:out value="${sessionScope.user.userName}"/></h4>
                <button class="close-btn" onclick="closeModal()">X</button>
            </div>
            <p><c:out value="${sessionScope.user.nickname}"/></p>
            <hr>
            <hr>
            <div class="modal-menu">
                <a href="/myapp/mypage/mypage_userinfo.jsp">회원정보 수정</a>
                <a href="">찜한 쿠킹일지</a>
                <a href="">나의 쿠킹일지</a>
                <a href="/myapp/${sessionScope.user.id}/favorite">스크랩 레시피</a>
                <a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a>
            </div>
        </div>
    </div>
	 <script src="${pageContext.request.contextPath}/static/js/mypage.js"></script>


</body>
</html>