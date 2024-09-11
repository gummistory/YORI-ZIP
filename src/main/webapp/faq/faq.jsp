<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/faq.css">

<script>
function switchTab(event) {
    // 모든 탭에서 active 클래스 제거
    const tabs = document.querySelectorAll('.tab');
    tabs.forEach(tab => tab.classList.remove('active'));

    // 클릭된 탭에 active 클래스 추가
    event.target.classList.add('active');
}
</script>
<style>
.container{
	background-color: #fff;
}
.tab-menu {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.tab-menu .tab {
    padding: 10px 20px;
    border: 1px solid #b38c5a;
    background-color: #fff;
    color: #b38c5a;
    margin-right: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.tab-menu .tab.active, .tab-menu .tab:hover {
    background-color: #b38c5a;
    color: #fff;
}
</style>
</head>
<body>
<header>
<jsp:include page="/main/header.jsp" />
</header>


<!-- 버튼  -->
<div class ="container">

   <!-- 탭 메뉴 -->
    <section class="tab-menu">
        <button class="tab active" onclick="switchTab(event)">전체</button>
        <button class="tab" onclick="switchTab(event)">회원문의</button>
        <button class="tab" onclick="switchTab(event)">서비스</button>
             <button class="tab" onclick="switchTab(event)">기타</button>
    </section>


	
		
		<!-- 아코디언식 질문 -->
	 <div class="accordion">
	        <div class="accordion-item">
	            <div class="accordion-header">레시피 댓글, 후기에 노출되는 이름 변경 안 되나요?</div>
	            <div class="accordion-content">
	                <p>레시피 댓글과 후기에 표시되는 이름은 회원 정보에서 변경할 수 있습니다. '내 정보' 섹션에서 이름을 변경 후, 다시 댓글을 작성하면 새로운 이름으로 표시됩니다.</p>
	            </div>
	        </div>
	        <div class="accordion-item">
	            <div class="accordion-header">회원탈퇴는 어떻게 하나요?</div>
	            <div class="accordion-content">
	                <p>회원 탈퇴는 설정 메뉴에서 진행할 수 있습니다. '설정' -> '계정' -> '회원 탈퇴'를 순서대로 선택해 주세요. 탈퇴 후에는 복구가 불가능하니 신중히 선택해 주세요.</p>
	            </div>
	        </div>
	        <!-- 더 많은 항목 추가 가능 -->
	    </div>
	
	
	 <script src="${pageContext.request.contextPath}/static/js/faq.js"></script>
	      <jsp:include page="/mypage/mypage_window.jsp" />
	<jsp:include page="/chat/chat.jsp" />
	
	
	</div>
  	
  	<footer>
  	  	<jsp:include page="/main/footer.jsp" />
  	</footer>

</body>
</html>