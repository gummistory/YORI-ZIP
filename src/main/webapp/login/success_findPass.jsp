<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 성공</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            background-color: #fff;
            font-family: Arial, sans-serif;
        }

        header, footer {
            width: 100%;
        }

        .container {
            background-color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 120px); /* Adjust based on header and footer height */
        }

     

        .pwFind-header {
            font-size: 24px;
            margin-bottom: 30px;
            font-weight: bold;
            text-align: center;
        }

     

        .input-group {
            
            margin-bottom: 20px;
        }


        .input-field {
            margin-right: 10px;
            width: 265px;
        }

     

          .input-num {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
        }

        .button_findLogin {
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



        .social-login {
            margin-top: 20px;
            text-align: center;
        }

        .social-icons img {
            width: 40px;
            height: 40px;
            margin: 0 5px;
        }
    </style>
</head>
<body>

    <!-- 헤더 -->
    <header>
        <jsp:include page="/main/header.jsp" />
    </header>

   
    <div class="container">
        <div class="email-box">
            <form action="homepageLogin.jsp" method="post">
                <div class="pwFind-header">비밀번호 찾기</div>
                <div style="width: 100%;">
                    <!-- 비밀번호 찾기 완료  -->
                    <div class="input-group">
                        <div class="input-label">본인 인증이 완료 되었습니다. 비밀번호 재 설정 해주세요.</div>
                    </div>

                    <div class="input-label">비밀번호 재설정</div>
                    <input type="text" name="verificationCode" class="input-num" placeholder="비밀번호를 입력하세요" required>
                   <div class="input-label">비밀번호 확인</div>
                    <input type="text" name="verificationCode" class="input-num" placeholder="비밀번호를 디시 한번 입력하세요" required>
                    <!-- 아이디 찾기 버튼 -->
                    <button type="submit" class="button_findLogin">로그인</button>
         
			
                </div>
            </form>
            <div class="social-login">
                <h3>소셜 로그인</h3>
                <div class="social-icons">
                    <img src="kakao-icon.png" alt="Kakao">
                    <img src="naver-icon.png" alt="Naver">
                    <img src="google-icon.png" alt="Google">
                </div>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/main/footer.jsp" />
    </footer>

</body>
</html>
