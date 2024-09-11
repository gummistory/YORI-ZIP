<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YoriZip Header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/static/images/logo.png" alt="YoriZip 로고"></a>
        </div>
        <nav class="main-menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/recipe/recipe.jsp">든든한끼</a></li>
                <li><a href="${pageContext.request.contextPath}/recipe/dessert.jsp">달달간식</a></li>
                <li><a href="${pageContext.request.contextPath}/community/community.jsp">쿠킹일지</a></li>
                <li><a href="#">오늘의 메뉴</a></li>
            </ul>
        </nav>
        <nav class="user-menu">
            <div class="search-icon">
                <a href="${pageContext.request.contextPath}/recipe/searchKey.jsp"><img src="${pageContext.request.contextPath}/static/images/search-icon.png" alt="검색"></a>
            </div>
            <ul>
                <!-- 로그인 상태에 따라 표시할 항목들 -->
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="mypage"><a href="#">마이페이지</a></li>
                        <li class="logout"><a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="auth">
                            <a href="${pageContext.request.contextPath}/login/login.jsp" class="login-link">로그인/</a>
                            <a href="${pageContext.request.contextPath}/join/join.jsp" class="signup-link">회원가입</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li class="support"><a href="${pageContext.request.contextPath}/faq/faq.jsp">고객센터</a></li>
            </ul>
        </nav>
        <div class="hamburger-menu">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>

    <!-- 모바일 메뉴 -->
    <div class="mobile-menu">
        <ul>
                           <li><a href="${pageContext.request.contextPath}/recipe/recipe.jsp">든든한끼</a></li>
                <li><a href="${pageContext.request.contextPath}/recipe/dessert.jsp">달달간식</a></li>
                <li><a href="${pageContext.request.contextPath}/community/community.jsp">쿠킹일지</a></li>
                <li><a href="#">오늘의 메뉴</a></li>
            <c:choose>
                <c:when test="${not empty sessionScope.userInfo}">
                    <li class="mypage-mobile"><a href="#">마이페이지</a></li>
                    <li class="logout-mobile"><a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a></li>
                </c:when>
                <c:otherwise>
                    <li class="auth-mobile"><a href="${pageContext.request.contextPath}/login/login.jsp">로그인/회원가입</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="#">고객센터</a></li>
        </ul>
    </div>
</header>

<script src="${pageContext.request.contextPath}/static/js/header.js"></script>
<script src="${pageContext.request.contextPath}/static/js/mypage.js"></script>
<jsp:include page="/mypage/mypage_window.jsp" />

</body>
</html>
