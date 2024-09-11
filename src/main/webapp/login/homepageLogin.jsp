<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/hompageLogin.css">
  <script>
        function showError(message) {
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body>
<body onload="showError('${loginError}')">
    <!-- 헤더 -->
    <header>
        <jsp:include page="/main/header.jsp" />
    </header>

    <!-- 로그인 박스 (컨테이너로 감싸서 중앙 정렬) -->
    <div class="container">
        <div class="login-box">
            <form action="${pageContext.request.contextPath}/auth/login" method="get">
                <div class="login-header">로그인</div>
                <div style="width: 100%;">
                    <!-- ID 입력 필드 -->
                    <div class="input-label">아이디</div>
                    <input type="text" class="input-field" name="email" placeholder="아이디를 입력하세요" required>
                    <!-- PASSWORD 입력 필드 -->
                    <div class="input-label">비밀번호</div>
                    <input type="password" class="input-field" name="password" placeholder="비밀번호를 입력하세요" required>
                    <!-- 로그인 버튼 -->
                    <button type="submit" class="button_login">로그인</button>
                    <div class="links">
                        <a href="findID.jsp">아이디 찾기</a> / <a href="findPass.jsp">비밀번호 찾기</a>
                    </div>
                </div>
            </form>
         
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/main/footer.jsp" />
    </footer>

</body>
</html>
