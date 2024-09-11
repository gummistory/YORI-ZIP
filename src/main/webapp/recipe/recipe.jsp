<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 목록</title>
    <link rel="stylesheet" href="./recipe.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            font-size: 24px;
            color: #333;
        }

        .filter {
            text-align: center;
            margin-bottom: 20px;
        }

        .filter button, .filter input {
            border: none;
            background-color: #fff;
            color: #b38c5a;
            padding: 10px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 3px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.2s;
        }

        .filter button:hover, .filter input:hover {
            background-color: #f1f1f1;
        }

        .filter button.active {
            background-color: #b38c5a;
            color: #fff;
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

        .search-bar {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-bar input {
            width: 300px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/main/header.jsp" />
    </header>
    <h1>메인 요리</h1>

    <div class="filter">
        <button data-category="모두보기" class="active">모두보기</button>
        <button data-category="밥">밥</button>
        <button data-category="국&찌개">국&찌개</button>
        <button data-category="일품">일품</button>
        <button data-category="반찬">반찬</button>
    </div>

    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="레시피 제목 검색...">
    </div>

    <div class="RecipeContentList">
        <!-- 레시피 목록이 여기에 표시됩니다 -->
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        let allRecipes = [];

        $(document).ready(function() {
            // 초기 데이터 로드
            loadRecipes();

            // 카테고리 필터 클릭 시
            $('.filter button').click(function() {
                $('.filter button').removeClass('active');
                $(this).addClass('active');
                const category = $(this).data('category');
                filterRecipes(category);
            });

            // 검색 입력 시
            $('#searchInput').on('input', function() {
                const searchTerm = $(this).val().toLowerCase();
                searchRecipes(searchTerm);
            });

            function loadRecipes() {
                $.ajax({
                    method: "GET",
                    url: `http://openapi.foodsafetykorea.go.kr/api/67f9fcdd1106497bb4f2/COOKRCP01/json/10/100`,
                })
                .done(function (res) {
                    if (res.COOKRCP01.row && res.COOKRCP01.row.length > 0) {
                        allRecipes = res.COOKRCP01.row;
                        displayRecipes(allRecipes);
                    } else {
                        $(".RecipeContentList").empty();
                        $(".RecipeContentList").append('<p>No recipes found.</p>');
                    }
                })
                .fail(function(xhr, status, error) {
                    console.error("Failed to fetch data: " + status + " " + error);
                    $(".RecipeContentList").empty();
                    $(".RecipeContentList").append('<p>Error fetching recipes. Please try again later.</p>');
                });
            }

            function displayRecipes(recipes) {
                $(".RecipeContentList").empty();
                recipes.forEach(function(recipe) {
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

                    recipeContent.click(function() {
                        window.location.href = "recipelist.jsp?recipeId=" + recipe.RCP_SEQ;
                    });
                });
            }

            function filterRecipes(category) {
                if (category === "모두보기") {
                    displayRecipes(allRecipes);
                } else {
                    const filteredRecipes = allRecipes.filter(recipe => recipe.RCP_PAT2 === category);
                    displayRecipes(filteredRecipes);
                }
            }

            function searchRecipes(term) {
                const filteredRecipes = allRecipes.filter(recipe => recipe.RCP_NM.toLowerCase().includes(term));
                displayRecipes(filteredRecipes);
            }
        });
    </script>
    <footer>
        <jsp:include page="/main/footer.jsp" />
    </footer>
</body>
</html>
