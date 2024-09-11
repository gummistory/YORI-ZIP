<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/noticeview.css">
</head>
<body>
 <jsp:include page="/main/header.jsp" />
  <h2>공지사항</h2>
    
    <div class="notice-container">
        <div class="notice-header">
            <img src="${pageContext.request.contextPath}/static/images/pin-angle.png" alt="Icon" width="24">
            <strong>2024.09.10 신규 출시 예정</strong>
        </div>
        <div class="notice-content">
            <p>안녕하세요.</p>
            <p>2024.09.10 새로운 출시 예정입니다. 원활한 이용 부탁드리며, 문의사항이나 오류 사항 등 있을 시엔 1:1 chat 이용 부탁드립니다.</p>
            <p>다양한 레시피로 찾아뵙겠습니다.</p>
            <p>감사합니다.</p>
            
            <%-- <div>
            <textarea class="notice-content">${dto.content}</textarea>
            </div> --%>
        </div>
    </div>
    
    <div>
      <a href="notice.jsp" class="back-button">이전</a>
   </div>
   
   
   <!-- 임시로 페이징 css 넣은 부분, 아래 스크립트릿 부분 넣으면 이 부분은 삭제 -->
    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">&raquo;</a>
    </div>


      <%--  <table border="1" width="90%">
             <tr>
                <td align="center">
                   <!--  [첫번째페이지][이전블럭] [1] [2] [3] [4] [5] [다음블럭][마지막페이지] , 아래 rquest.getRequestURI()는 현재주소값을 가져옴-->
                    <%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %> 
                </td>
             </tr>
          </table> --%>
          <jsp:include page="/mypage/mypage_window.jsp" />
          <jsp:include page="/chat/chat.jsp" />
      <jsp:include page="/main/footer.jsp" />
</body>
</html>