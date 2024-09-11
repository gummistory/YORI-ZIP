<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>미니게임</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/game_index.css">
	<style>
	.menu-recommendation{
	 background: url('${pageContext.request.contextPath}/static/images/minigame/background.jpg') no-repeat center center/cover;
	   justify-content: center;
	}
	
	</style>
</head>
<body>
<header>
<jsp:include page="/main/header.jsp" />
</header>

<div class="menu-recommendation">
    <h1>메뉴 추천</h1>
    <p>월드컵</p>
    
    <!-- post 방식 url에 데이터 노출하지 않고 데이터 전송 -->
    <form action="/myapp/minigame/main.jsp" method="post">
        <select id="meal" name="meal">
            <option value="점심">점심</option>
            <option value="저녁">저녁</option>
        </select>

        <select id="round" name="round">
            <option value="8">8강</option>
            <option value="16">16강</option>
        </select>

        <button type="submit">시작</button>
    </form>
</div>
<footer>
  <jsp:include page="/main/footer.jsp" />

</footer>
</body>
</html>
