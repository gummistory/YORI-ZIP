<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 상세 정보</title>
    <style>
        .recipeDetail {
            width: 80%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 5px;
            background-color: #fff;
        }

        .recipeContent {
            display: flex; /* 이미지와 텍스트를 나란히 배치 */
            align-items: flex-start; /* 이미지와 텍스트의 상단을 맞춤 */
            gap: 20px; /* 이미지와 텍스트 사이의 간격 */
        }

        .recipeImg img {
            width: 400px; /* 이미지 너비 조정 */
            height: 450px;
            border-radius: 5px;
        }

        .recipeTitle {
            font-size: 24px;
            margin: 20px 0;
            text-align: center;
        }

        .recipeInfo {
            font-size: 14px;
            color: #666;
            flex: 1; /* 텍스트 영역이 남은 공간을 차지하도록 설정 */
        }

        .recipeInstructions {
            margin-top: 30px;
            font-size: 15px;
        }

        .recipeInstructions img {
            max-width: 500px;
            height: 200px;
            margin-top: 10px;
        }

        .backToListButton {
            display: inline-block;
            padding: 10px 20px;
            margin-bottom: 20px;
            font-size: 16px;
            color: #b38c5a;
            background-color: #fff;
            border: 1px solid #b38c5a;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .backToListButton:hover {
            background-color: #b38c5a;
            color : #fff;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/main/header.jsp" />
    </header>

    <div class="recipeDetail">
        <!-- 목록으로 돌아가기 버튼 -->
        <a href="recipe.jsp" class="backToListButton">목록으로 돌아가기</a>
        
        <h1 class="recipeTitle">레시피 상세 정보</h1>
        <div class="recipeContent">
            <div class="recipeImg">
                <!-- 레시피 이미지가 여기에 표시됩니다 -->
            </div>
            <div class="recipeInfo">
                <!-- 레시피 정보가 여기에 표시됩니다 -->
            </div>
        </div>

        <div class="recipeInstructions">
            <!-- 조리 순서가 여기에 표시됩니다 -->
        </div>
    </div>
    
    <script>
    $(document).ready(function() {
        const urlParams = new URLSearchParams(window.location.search);
        const recipeId = urlParams.get('recipeId');

        if (!recipeId) {
            $('.recipeContent').html('<p>레시피 ID가 제공되지 않았습니다.</p>');
            return;
        }

        const apiKey = '67f9fcdd1106497bb4f2'; // API 키
        const apiUrl = `http://openapi.foodsafetykorea.go.kr/api/67f9fcdd1106497bb4f2/COOKRCP01/json/1/100`;

        $.ajax({
            method: "GET",
            url: apiUrl,
        })
        .done(function(res) {
            console.log("전체 응답 데이터:", res); // 전체 응답 데이터 확인
            if (res.COOKRCP01.row && res.COOKRCP01.row.length > 0) {
                const recipe = res.COOKRCP01.row.find(r => r.RCP_SEQ === recipeId);

                if (recipe) {
                    console.log("특정 레시피 데이터:", recipe); // 특정 레시피 데이터 확인
                    $('.recipeTitle').text(recipe.RCP_NM);

                    const recipeImgDiv = $('<div>').addClass('recipeImg');
                    const recipeImg = $('<img>').attr('src', recipe.ATT_FILE_NO_MAIN).attr('alt', 'Recipe Image');
                    recipeImgDiv.append(recipeImg);

                    const recipeInfo = $('<div>').addClass('recipeInfo');
                    recipeInfo.append($('<p>').text("조리 방법: " + recipe.RCP_WAY2));
                    recipeInfo.append($('<p>').text("요리 종류: " + recipe.RCP_PAT2));
                    recipeInfo.append($('<p>').text("중량(1인분): " + (recipe.INFO_WGT || '정보 없음') + "g"));
                    recipeInfo.append($('<p>').text("칼로리: " + recipe.INFO_ENG + " kcal"));
                    recipeInfo.append($('<p>').text("탄수화물: " + recipe.INFO_CAR + " g"));
                    recipeInfo.append($('<p>').text("단백질: " + recipe.INFO_PRO + " g"));
                    recipeInfo.append($('<p>').text("지방: " + recipe.INFO_FAT + " g"));
                    recipeInfo.append($('<p>').text("나트륨: " + recipe.INFO_NA + " mg"));
                    recipeInfo.append($('<p>').text("해쉬태그: " + (recipe.HASH_TAG || '없음')));
                    recipeInfo.append($('<p>').text("재료 정보: " + recipe.RCP_PARTS_DTLS));

                    const recipeInstructions = $('<div>').addClass('recipeInstructions');

                    const steps = [
                        { text: recipe.MANUAL01, img: recipe.MANUAL_IMG01 },
                        { text: recipe.MANUAL02, img: recipe.MANUAL_IMG02 },
                        { text: recipe.MANUAL03, img: recipe.MANUAL_IMG03 },
                        { text: recipe.MANUAL04, img: recipe.MANUAL_IMG04 },
                        { text: recipe.MANUAL05, img: recipe.MANUAL_IMG05 },
                        { text: recipe.MANUAL06, img: recipe.MANUAL_IMG06 },
                        { text: recipe.MANUAL07, img: recipe.MANUAL_IMG07 },
                        { text: recipe.MANUAL08, img: recipe.MANUAL_IMG08 },
                        { text: recipe.MANUAL09, img: recipe.MANUAL_IMG09 },
                        { text: recipe.MANUAL10, img: recipe.MANUAL_IMG10 },
                        { text: recipe.MANUAL11, img: recipe.MANUAL_IMG11 },
                        { text: recipe.MANUAL12, img: recipe.MANUAL_IMG12 },
                        { text: recipe.MANUAL13, img: recipe.MANUAL_IMG13 },
                        { text: recipe.MANUAL14, img: recipe.MANUAL_IMG14 },
                        { text: recipe.MANUAL15, img: recipe.MANUAL_IMG15 },
                        { text: recipe.MANUAL16, img: recipe.MANUAL_IMG16 },
                        { text: recipe.MANUAL17, img: recipe.MANUAL_IMG17 },
                        { text: recipe.MANUAL18, img: recipe.MANUAL_IMG18 },
                        { text: recipe.MANUAL19, img: recipe.MANUAL_IMG19 },
                        { text: recipe.MANUAL20, img: recipe.MANUAL_IMG20 }
                    ];

                    steps.forEach((step, index) => {
                        if (step.text) {
                            recipeInstructions.append($('<p>').text(step.text));
                        }
                        if (step.img) {
                            const img = $('<img>').attr('src', step.img).attr('alt', `Step ${index + 1}`);
                            recipeInstructions.append(img);
                        }
                    });

                    $('.recipeContent').html('');  // 기존 내용을 지우고 새로 삽입
                    $('.recipeContent').append(recipeImgDiv).append(recipeInfo);
                    $('.recipeDetail').append(recipeInstructions);  // 조리 단계를 따로 추가
                } else {
                    $('.recipeContent').html('<p>레시피를 찾을 수 없습니다.</p>');
                }
            } else {
                $('.recipeContent').html('<p>레시피를 불러올 수 없습니다.</p>');
            }
        })
        .fail(function(xhr, status, error) {
            console.error("Failed to fetch data: " + status + " " + error);
            $('.recipeContent').html('<p>레시피를 불러올 수 없습니다.</p>');
        });
    });
    </script>
    
    <!-- 푸터 -->
    <footer>
        <jsp:include page="/main/footer.jsp" />
    </footer>
</body>
</html>
