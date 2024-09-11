<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Best Recipes</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }

        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .subtext {
            color: #666;
            margin-bottom: 20px;
        }

        .tab-menu {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            border-radius: 30px;
            margin: 0 5px;
            border: 1px solid #e1dfdd;
            background-color: #f9f7f5;
            color: #666;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .tab.active {
            background-color: #2ecc71;
            color: #fff;
        }

        .recipe-list {
            display: flex;
            overflow-x: auto;
            padding-bottom: 10px;
        }

        .recipe-item {
            position: relative;
            width: 220px;
            margin-right: 15px;
            border-radius: 10px;
            overflow: hidden;
        }

        .recipe-item img {
            width: 100%;
            height: auto;
            display: block;
        }

        .badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #2ecc71;
            color: #fff;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
        }

        .pick {
            background-color: #f39c12;
        }

        .recipe-title {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 10px;
            font-size: 16px;
            text-align: center;
        }

        .more-recipes {
            text-align: right;
            margin-top: 10px;
        }

        .more-recipes a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Best Recipes</h2>
        <p class="subtext">셰프의 다양한 베스트 레시피를 열람해보세요 :)</p>
        
        <!-- 탭 메뉴 -->
        <section class="tab-menu">
            <button class="tab active" onclick="switchTab(event)">All</button>
            <button class="tab" onclick="switchTab(event)">든든 한끼</button>
            <button class="tab" onclick="switchTab(event)">달달 간식</button>
        </section>
        
        <!-- 레시피 리스트 -->
        <div class="recipe-list">
            <div class="recipe-item">
                <div class="badge">Best</div>
                <img src="${pageContext.request.contextPath}/static/images/toggle1.jpg" alt="Pancake">
                <div class="recipe-title">홈메이드 메이플 팬케이크</div>
            </div>
            <div class="recipe-item">
                <img src="${pageContext.request.contextPath}/static/images/toggle2.jpg" alt="Pasta">
                <div class="recipe-title">건강한 시금치 파스타</div>
            </div>
            <div class="recipe-item">
                <div class="badge pick">Pick</div>
                <img src="${pageContext.request.contextPath}/static/images/toggle1.jpg" alt="Bread">
                <div class="recipe-title">심플 베이킹 - 모닝빵편</div>
            </div>
            <div class="recipe-item">
                <img src="${pageContext.request.contextPath}/static/images/toggle2.jpg" alt="Sweet Potato">
                <div class="recipe-title">잔반 걱정 끝, 쏘야 만들기</div>
            </div>
            <div class="recipe-item">
                <img src="${pageContext.request.contextPath}/static/images/toggle1.jpg" alt="Kimchi Stew">
                <div class="recipe-title">자취생의 김치찌개</div>
            </div>
        </div>

        <!-- 더 보기 링크 -->
        <div class="more-recipes">
            <a href="#">베스트 레시피 더 둘러보기 ></a>
        </div>
    </div>

    <script>
        function switchTab(event) {
            const tabs = document.querySelectorAll('.tab');
            tabs.forEach(tab => tab.classList.remove('active'));
            event.target.classList.add('active');
        }
    </script>
</body>
</html>
