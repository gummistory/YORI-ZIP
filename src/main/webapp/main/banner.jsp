<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<style>
        .swiper {
            width: 100%; /* Adjust to fit your layout */
            height: 300px; /* Adjust height as needed */
        }
        .swiper-slide img {
            width: 100%;
            height: auto;
        }
        /* 네비게이션 버튼의 색상 */
.swiper-button-next,
.swiper-button-prev {
    color: white; /* 버튼의 화이트 색상 설정 */
}

/* 페이지네이션의 색상 */
.swiper-pagination-bullet {
    background: white; /* 페이지네이션 버틀의 화이트 색상 설정 */
}

/* 페이지네이션의 활성화된 상태 색상 */
.swiper-pagination-bullet-active {
    background: white; /* 활성화된 페이지네이션 버틀의 화이트 색상 설정 */
}
        
    </style>

</head>
<body>
	<div class="swiper">
			  <!-- Additional required wrapper -->
			  <div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/static/images/banner1.png">
				</div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/static/images/banner2.png">
				 </div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/static/images/banner3.png">
				</div>
			
			  </div>
			  <!-- If we need navigation buttons -->
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
              <div class="swiper-pagination"></div>

			  <!-- If we need scrollbar -->
			  <div class="swiper-scrollbar"></div>
		</div>
​
    <script src="${pageContext.request.contextPath}/static/js/banner.js"></script>

</body>
</html>