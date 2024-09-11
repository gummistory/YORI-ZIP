<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>레시피 목록</title>
	<style>
		.RecipeContentList {
			display: grid;
			grid-template-columns: repeat(4, 1fr);
			gap: 20px;
			max-width: 1200px;
			margin: 0 auto;
			padding: 20px;
		}

		.RecipeContent {
			border: 1px solid #ddd;
			border-radius: 5px;
			overflow: hidden;
			text-align: center;
			cursor: pointer;
			background-color: #fff;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			transition: transform 0.2s, box-shadow 0.2s;
		}

		.RecipeContent:hover {
			transform: translateY(-5px);
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}

		.recipeImg img {
			width: 100%;
			height: 200px;
			object-fit: cover;
		}

		.recipeDetails {
			padding: 15px;
		}

		.recipeTitle {
			font-size: 18px;
			margin: 10px 0;
			color: #333;
		}
	</style>
</head>
<body>
<!-- 헤더 -->
<header>
	<jsp:include page="/main/header.jsp" />
</header>

<div class="RecipeContentList">
	<!-- 모델에서 가져온 favoriteRecipes 목록을 출력 -->
	<c:forEach var="recipe" items="${favoriteRecipes}">
		<div class="RecipeContent" data-recipe-id="${recipe.recipeId}">
			<div class="recipeImg"></div> <!-- 이미지가 이 div에 동적으로 추가됩니다. -->
			<div class="recipeDetails">
				<h3 class="recipeTitle"> <!-- 레시피 제목이 여기에 동적으로 추가됩니다. -->
					<a href="http://localhost:8888/myapp/recipe/recipelist.jsp?recipeId=${recipe.recipeId}">
						
					</a>
				</h3>
			</div>
		</div>
	</c:forEach>
</div>

<footer>
	<jsp:include page="/main/footer.jsp" />
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// API 호출하여 레시피 정보 가져오기 (1~100번째 레시피)
		$.ajax({
			method: "GET",
			url: `http://openapi.foodsafetykorea.go.kr/api/67f9fcdd1106497bb4f2/COOKRCP01/json/1/100`,
		})
		.done(function(res) {
			if (res.COOKRCP01.row && res.COOKRCP01.row.length > 0) {
				// 각 레시피 콘텐츠에 대해 레시피 정보를 추가
				$('.RecipeContent').each(function() {
					const recipeId = $(this).data('recipe-id');
					const recipeContent = $(this);

					// API에서 recipeId와 일치하는 레시피를 찾음
					const recipe = res.COOKRCP01.row.find(r => r.RCP_SEQ === String(recipeId));
					if (recipe) {
						// 이미지 추가
						const imageUrl = recipe.ATT_FILE_NO_MAIN;
						const imageElement = $('<img>').attr('src', imageUrl).attr('alt', 'Recipe Image');
						recipeContent.find('.recipeImg').append(imageElement);

						// 제목 추가
						const recipeTitleElement = $('<h3>').addClass('recipeTitle').text(recipe.RCP_NM);
						recipeContent.find('.recipeDetails').prepend(recipeTitleElement);
					}
				});
			}
		})
		.fail(function(xhr, status, error) {
			console.error("데이터 가져오기 실패: " + status + " " + error);
		});
	});
</script>
</body>
</html>
