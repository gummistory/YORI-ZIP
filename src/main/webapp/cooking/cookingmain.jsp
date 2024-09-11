<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠킹일지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .search-box {
            text-align: center;
            margin-bottom: 30px;
        }
        .search-box input[type="text"] {
            padding: 10px;
            width: 60%;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .search-box button {
            padding: 10px 20px;
            background-color: #b29e84;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .recipes {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .recipe-item {
            width: 30%;
            margin-bottom: 20px;
        }
        .recipe-item img {
            width: 100%;
            border-radius: 10px;
        }
        .recipe-title {
            text-align: center;
            margin-top: 10px;
            font-size: 18px;
        }
        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .buttons button {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            color: white;
            background-color: #b29e84;
        }
        .footer {
            text-align: center;
            margin-top: 50px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">쿠킹일지</div>

    <div class="search-box">
        <input type="text" placeholder="ex) 고망고 망고빙수">
        <button>검색</button>
    </div>

    <div class="recipes">
        <!-- 레시피 반복 출력 -->
        <c:forEach var="recipe" items="${recipeList}">
            <div class="recipe-item">
                <img src="${recipe.imageUrl}" alt="레시피 이미지">
                <div class="recipe-title">${recipe.name}</div>
                <div class="recipe-date">${recipe.date}</div>
            </div>
        </c:forEach>
    </div>

    <div class="buttons">
        <button>모두 보기</button>
        <button>작성하기</button>
    </div>
    
    <div class="footer">
        추천 발플루언서 목록
    </div>
    
    <div class="influencers">
        <!-- 발플루언서 정보 반복 출력 -->
        <c:forEach var="influencer" items="${influencerList}">
            <div class="influencer-item">
                <img src="${influencer.imageUrl}" alt="발플루언서 이미지">
                <div>${influencer.name}</div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
