<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <style>
        /* 기존 스타일 그대로 유지 */
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

        .PwFind-header {
            font-size: 24px;
            margin-bottom: 30px;
            font-weight: bold;
            text-align: center;
        }

        .input-label {
            font-size: 14px;
            text-align: left;
            margin-bottom: 5px;
            color: #333;
            width: 100%;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-field, .email_send {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
        }

        .input-field {
            margin-right: 10px;
            width: 265px;
        }

        .email_send {
            width: 120px;
            background-color: #5b463c;
            color: #fff;
            border: none;
            cursor: pointer;
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

        .button_findPW {
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

        .links-container {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            font-size: 13px;
        }

        .links-container a {
            text-decoration: none;
            color: #5b463c;
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

    <!-- 아이디 찾기 박스 (컨테이너로 감싸서 중앙 정렬) -->
    <div class="container">
        <div class="email-box">
            <form action="${pageContext.request.contextPath}/auth/find-password" method="post">
                <div class="PwFind-header">비밀번호 찾기</div>
                <div style="width: 100%;">
                    <!-- 아이디 입력 필드 -->
                    <div class="input-label">아이디</div>
                    <input type="text" name="verificationCode" class="input-num" placeholder="아이디를 입력하세요" required>
                    
                    <!-- 이메일 입력 필드와 인증번호 버튼 -->
                    <div class="input-group">
                        <div class="input-label">이메일</div>
                        <input type="email" name="email" class="input-field" placeholder="이메일을 입력하세요" required>
                        <button type="button" class="email_send" onclick="sendVerificationCode()">인증번호 전송</button>
                    </div>
                    
                    <!-- 비밀번호 찾기 버튼 -->
                    <button type="submit" class="button_findPW">비밀번호 찾기</button>
                    
                    <!-- Links Container -->
                    <div class="links-container">
                        <a href="homepageLogin.jsp">로그인 페이지로 가기</a>
                        <a href="findID.jsp">아이디 찾기</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/main/footer.jsp" />
    </footer>

    <script>
        function sendVerificationCode() {
            // AJAX로 이메일을 보내는 로직
            const email = document.querySelector('input[name="email"]').value;
            if (!email) {
                alert('이메일을 입력하세요.');
                return;
            }

            fetch('${pageContext.request.contextPath}/auth/send-verification-code', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ email: email })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('인증번호가 전송되었습니다.');
                } else {
                    alert('인증번호 전송에 실패했습니다. 다시 시도해주세요.');
                }
            })
            .catch(error => console.error('Error:', error));
        }
    </script>
</body>
</html>
