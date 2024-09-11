<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mypage_userinfo_next.css">
</head>
<body>

<header>
	<jsp:include page="/main/header.jsp" />
</header>

<h2>회원정보 수정</h2>

<form action="${pageContext.request.contextPath}/mypage/update-userinfo" method="post">
	<div class="userinfo_next_container">
		<h4>이름</h4>
		<input type="text" name="userName" class="next_input" value="${user.userName}" required>
		<h4>닉네임</h4>
		<input type="text" name="nickname" class="next_input" value="${user.nickname}" required>
		<h4>이메일</h4>
		<input type="text" name="userEmail" class="next_input" value="${user.userEmail}" readonly>
		<h4>비밀번호</h4>
		<input type="password" name="password" class="next_input" required>
		<h4>비밀번호 확인</h4>
		<input type="password" name="passwordConfirm" class="next_input" required>
		<h4>프로필 이미지 URL</h4>
		<input type="text" name="profileImgUrl" class="next_input" value="${user.profileImgUrl}">

		<div class="button-container">
			<button type="submit" class="userinfo1">회원정보 수정</button>
			<button type="button" class="userinfo2" onclick="location.href='${pageContext.request.contextPath}/mypage/delete-user'">회원탈퇴</button>
		</div>
	</div>
</form>

<jsp:include page="/mypage/mypage_window.jsp" />
<jsp:include page="/chat/chat.jsp" />
<jsp:include page="/main/footer.jsp" />

<script src="${pageContext.request.contextPath}/static/js/mypage_userinfo_next.js"></script>
</body>
</html>
