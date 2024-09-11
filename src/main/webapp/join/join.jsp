<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
    @charset "UTF-8";

body{
    margin: 0;
    padding: 0;
    height: 100%;
    display: flex;
    flex-direction: column;
   background-color: #fff;
    font-family: Arial, sans-serif;
   
}

header, footer {
    width: 100%;
}

.join-box {
    margin: auto;
    padding: 20px;
    border-radius: 10px;
    width: 100%;
    max-width: 400px;
    text-align: center;
}

.container{
	background-color: #fff;
}
.join-header {
    font-size: 24px;
    margin-bottom: 30px;
    font-weight: bold;
}

.input-label {
    font-size: 14px;
    text-align: left;
    margin-bottom: 5px;
    color: #333;
    width: 100%;
}

.input-field {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
    box-sizing: border-box;
}

.button_join {
    width: 100%;
    padding: 15px;
    background-color: #5b463c;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 10px;
}

.button_join:hover {
    background-color: #4a3a31;
}

       .form-check {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .form-check input {
            margin-right: 5px;
        }
        .form-check label {
            margin: 0;
        }


/* .links {
    margin-top: 10px;
    font-size: 12px;
}

.links a {
    color: #888;
    text-decoration: none;
}
 */



    
    
    
    </style>
</head>
<body>

    <!-- 헤더 -->
    <header>
        <jsp:include page="/main/header.jsp" />
    </header>

    <!-- 회원가입 박스 (컨테이너로 감싸서 중앙 정렬) -->
    <div class="container">
        <div class="join-box">
            <form action="/myapp/user/register/no" method="post">
                <div class="join-header">회원가입</div>
                <div style="width: 100%;">
                    <!-- 이름  입력 필드 -->
                    <div class="input-label">이름</div>
                    <input type="text" class="input-field" name="userName" placeholder="이름을 입력하세요" required>

                    <!-- ID 입력 필드 -->
                    <div class="input-label">아이디</div>
                    <input type="text" class="input-field" name="userId" placeholder="아이디를 입력하세요" required>

                    <!-- PASSWORD 입력 필드 -->
                    <div class="input-label">비밀번호</div>
                    <input type="password" class="input-field" name="password" placeholder="비밀번호를 입력하세요" required>

                    <div class="input-label">비밀번호 확인</div>
                    <input type="password" class="input-field" name="passwordConfirm" placeholder="비밀번호를 다시 입력하세요" required>

                    <!-- 닉네임 입력 필드 -->
                    <div class="input-label">닉네임</div>
                    <input type="text" class="input-field" name="nickname" placeholder="사용할 닉네임을 입력하세요" required>

                    <!-- 이메일 입력 필드 -->
                    <div class="input-label">이메일</div>
                    <input type="email" class="input-field" name="userEmail" placeholder="이메일을 입력하세요" required>

                    <!-- 전화번호 입력 필드 -->
                    <div class="input-label">전화번호</div>
                    <input type="text" class="input-field" name="phone" placeholder="전화번호를 입력하세요" required>

                    <!-- 개인정보 수집 및 이용 약관 동의 -->
                    <div class="form-check">
                        <input type="checkbox" id="privacyAgree" name="privacyAgree" required>
                        <label for="privacyAgree">[필수] 개인정보 수집 및 이용 약관 동의</label>
                    </div>

                    <!-- 마케팅 정보 동의 -->
                    <div class="form-check">
                        <input type="checkbox" id="marketingAgree" name="marketingAgree">
                        <label for="marketingAgree">[선택] 커뮤니티 이벤트 및 마케팅 정보 동의</label>
                    </div>

                    <!-- 회원가입 버튼 -->
                    <button type="submit" class="button_join">회원가입</button>

                </div>
            </form>
         
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/main/footer.jsp" />
    </footer>

</body>
</html>
