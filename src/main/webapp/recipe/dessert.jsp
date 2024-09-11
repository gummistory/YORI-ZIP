<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후식 레시피</title>
    <style>
    	.dessert{
    	text-align:center;
    	}
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

        .recipeInfo {
            font-size: 14px;
            color: #666;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .pagination button {
            border: none;
            background-color: #fff;
            color: #333;
            padding: 10px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 3px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.2s;
        }

        .pagination button:hover {
            background-color: #b38c5a;
            color: #fff;
        }

        .pagination button.active {
            background-color: #fff;
            color: #b38c5a;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <!-- 헤더 -->
    <header>
        <jsp:include page="/main/header.jsp" />
    </header>
    <div class="dessert">
     <h2>달달간식</h2>
    </div>
   
    
    <div class="RecipeContentList">
        <!-- 레시피 목록이 여기에 표시됩니다 -->
    </div>

    <div class="pagination">
        <!-- 페이지네이션 버튼이 여기에 표시됩니다 -->
    </div>

    <script>
        $(document).ready(function() {
            let currentPage = 1;
            const itemsPerPage = 12;
            let dessertRecipes = [];

            // API 호출을 통해 후식 레시피 데이터 가져오기
            $.ajax({
                method: "GET",
                url: "http://openapi.foodsafetykorea.go.kr/api/67f9fcdd1106497bb4f2/COOKRCP01/json/1/500",
            })
            .done(function(res) {
                if (res.COOKRCP01.row && res.COOKRCP01.row.length > 0) {
                    // 후식 레시피 필터링
                    dessertRecipes = res.COOKRCP01.row.filter(recipe => recipe.RCP_PAT2 === "후식");
                    displayRecipes(dessertRecipes, currentPage);
                    setupPagination(dessertRecipes.length, itemsPerPage);
                } else {
                    $(".RecipeContentList").append('<p>No dessert recipes found.</p>');
                }
            })
            .fail(function(xhr, status, error) {
                console.error("Failed to fetch data: " + status + " " + error);
                $(".RecipeContentList").append('<p>Error fetching recipes. Please try again later.</p>');
            });

            function displayRecipes(recipes, page) {
                $(".RecipeContentList").empty();
                const startIndex = (page - 1) * itemsPerPage;
                const endIndex = startIndex + itemsPerPage;
                const paginatedRecipes = recipes.slice(startIndex, endIndex);

                paginatedRecipes.forEach(function(recipe) {
                    const recipeContent = $('<div>').addClass('RecipeContent');
                    const recipeImgDiv = $('<div>').addClass('recipeImg');
                    const recipeImg = $('<img>').attr('src', recipe.ATT_FILE_NO_MAIN).attr('alt', 'Recipe Image');
                    recipeImgDiv.append(recipeImg);

                    const recipeDetails = $('<div>').addClass('recipeDetails');
                    const recipeTitle = $('<h3>').addClass('recipeTitle').text(recipe.RCP_NM);
                    const recipeInfo = $('<div>').addClass('recipeInfo');

                    recipeInfo.append($('<p>').text(recipe.RCP_WAY2));
                    recipeInfo.append($('<p>').text(recipe.RCP_PAT2));
                    recipeInfo.append($('<p>').text("Calories: " + recipe.INFO_ENG + " kcal"));

                    recipeDetails.append(recipeTitle).append(recipeInfo);
                    recipeContent.append(recipeImgDiv).append(recipeDetails);

                    $(".RecipeContentList").append(recipeContent);
                    
                    recipeContent.click(function(){
                    	window.location.href="dessertlist.jsp?recipeId=" + recipe.RCP_SEQ;
                    })
                });
            }

            function setupPagination(totalItems, itemsPerPage) {
                const totalPages = Math.ceil(totalItems / itemsPerPage);
                $('.pagination').empty();

                for (let i = 1; i <= totalPages; i++) {
                    const button = $('<button>').text(i);
                    if (i === currentPage) {
                        button.addClass('active');
                    }

                    button.click(function() {
                        currentPage = i;
                        displayRecipes(dessertRecipes, currentPage);
                        $('.pagination button').removeClass('active');
                        $(this).addClass('active');
                    });

                    $('.pagination').append(button);
                }
            }
        });
    </script>
        <footer>
        <jsp:include page="/main/footer.jsp" />

</footer>
</body>
</html>
 