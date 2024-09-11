<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/notice.css">
</head>
<body>

<header>
  <jsp:include page="/main/header.jsp" />
</header>


<h2>공지사항</h2>
    
    <div class="notice-container">
        <div class="notice-header">
            <img src="${pageContext.request.contextPath}/static/images/pin-angle.png" alt="Icon" width="24">
            <strong>2024.09.10 신규 출시 예정</strong>
            
        </div>
        <div class="notice-header_none">
            <img src="${pageContext.request.contextPath}/static/images/pin-angle.png" alt="Icon" width="24">
            <h4><a href="noticeview.jsp">2024.09.10 신규 공지</a></h4>
            
        </div>
        <div class="notice-content">
           <table>
         <c:forEach items="${noticeList }" var="notice">
            <tr>
               <td>${notice.seq }</td>
               <td>
                  <a href="notice.do?seq=${notice.seq }">${notice.title }</a> 
               </td>
               <td>${notice.writer }</td>
               <td>${notice.regDate }</td>
            </tr>
         </c:forEach>
      </table>   
        </div>
    </div>
  
      
    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">&raquo;</a>
    </div>
    <jsp:include page="/mypage/mypage_window.jsp" />
   <jsp:include page="/chat/chat.jsp" />
     <jsp:include page="/main/footer.jsp" />
  
 
</body>
</html>