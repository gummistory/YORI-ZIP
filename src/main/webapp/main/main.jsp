<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainpage</title>
</head>
<body>
<header>
  <jsp:include page="header.jsp" />
</header>
<!-- banner  -->
<section>
<jsp:include page="banner.jsp"/>
</section>

<section>
<jsp:include page="toggle.jsp"/>
</section>



<jsp:include page="/chat/chat.jsp" />

<footer>

  <jsp:include page="footer.jsp" />
</footer>
</body>
</html>