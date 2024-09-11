<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>이상형 월드컵 게임</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/game_main.css">
    <script src="${pageContext.request.contextPath}/static/js/game_main.js"></script> <!-- 외부 스크립트 파일 연결 -->
</head>
<body>

<header>
<jsp:include page="/main/header.jsp" />
</header>

<%
    String meal = request.getParameter("meal");
    String round = request.getParameter("round");

    String[] allimages = {
    		"${pageContext.request.contextPath}/static/images/minigame/bibimbab.png", "${pageContext.request.contextPath}/static/images/minigame/budaejjigae.png", "${pageContext.request.contextPath}/static/images/minigame/gunmandu.png", "${pageContext.request.contextPath}/static/images/minigame/janchigugsu.png",
            "${pageContext.request.contextPath}/static/images/minigame/ramen.png", "${pageContext.request.contextPath}/static/images/minigame/salad.png", "stonepotrice.png", "${pageContext.request.contextPath}/static/images/minigame/tteokbokki.png"
    };

    String[] selectedImages;

    if ("8".equals(round)) {
        selectedImages = new String[8];
        System.arraycopy(allimages, 0, selectedImages, 0, 8);
    } else if ("16".equals(round)) {
        selectedImages = new String[16];
        for (int i = 0; i < 16; i++) {
            selectedImages[i] = allimages[i % 8];
        }
    } else {
        selectedImages = new String[0];
    }

    // Java에서 배열을 JavaScript 배열로 변환하는 방법
    StringBuilder jsArray = new StringBuilder("[");
    for (int i = 0; i < selectedImages.length; i++) {
        jsArray.append("\"").append(selectedImages[i]).append("\"");
        if (i < selectedImages.length - 1) {
            jsArray.append(",");
        }
    }
    jsArray.append("]");
%>

<div class="header-container">
    <h1>Round: <%= round %></h1>
    <h2>식사: <%= meal %></h2>
</div>

<div class="container">
    <div class="food-item">
        <input type="image" id="image1" src="${pageContext.request.contextPath}/static/images/minigame<%= selectedImages[0] %>">
    </div>

    <div class="vs-text">VS</div>

    <div class="food-item">
        <input type="image" id="image2" src="${pageContext.request.contextPath}/static/images/minigame/<%= selectedImages[1] %>">
    </div>
</div>

<!-- JavaScript로 selectedImages 배열 전달 -->
<script>
    let selectedImages = <%= jsArray.toString() %>; // JavaScript 배열로 변환
</script>
<footer>
  <jsp:include page="/main/footer.jsp" />

</footer>
</body>
</html>