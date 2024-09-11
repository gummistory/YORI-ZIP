<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1011065752596-smegiakpteob7t8b6jbloh8ghnfch52o.apps.googleusercontent.com">
    <title>YoriZip 로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: url('${pageContext.request.contextPath}/static/images/login/loginbanner.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="YoriZip 로고">
        </div>
        <div class="login-buttons">
            <!-- 카카오 로그인 버튼 -->
            <div class="text-center">
                <a href="/myapp/auth/kakao">
                    <img src="${pageContext.request.contextPath}/static/images/login/kakao_login_medium_narrow.png" alt="카카오 로그인" class="kakao-img">
                </a>
            </div>
            <div class="text-center">
                <a href="/myapp/auth/naver">
                    <img src="${pageContext.request.contextPath}/static/images/login/kakao_login_medium_narrow.png" alt="카카오 로그인" class="kakao-img">
                </a>
            </div>
            
            <!-- 네이버 로그인 버튼 노출 영역 -->
            <div id="naver_id_login"></div>
            <!-- //네이버 로그인 버튼 노출 영역 -->
            
            <!-- 구글 로그인 버튼 -->
           <div id="google-signin-button">
    <div class="g-signin2" data-onsuccess="onSignIn" data-width="250" data-height="45" data-longtitle="true"></div>
</div>

             <a href="homepageLogin.jsp" class="btn email">이메일로 계속하기</a>
         
        </div>
        <div class="signup">
            <p>아직 회원이 아니신가요? <a href="/myapp/join/join.jsp">회원가입</a></p>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- 카카오 SDK -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
    window.Kakao.init('3fbb0605f3deb24068646bf835aeffe1'); // JavaScript 키 사용
    console.log(Kakao.isInitialized()); // SDK 초기화 확인
    
    function kakaoLogin(){
        window.Kakao.Auth.login({
            scope: 'profile_nickname, profile_image, account_email',
            success: function(authObj) {
                console.log(authObj);
                window.Kakao.API.request({
                    url: '/v2/user/me',
                    success: res => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account);
                    }
                });
            }
        });
    }
    </script>
    
    <!-- 네이버 로그인 초기화 Script -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript">
    var naver_id_login = new naver_id_login("8njUNhQJZagPjfuWz7OM", "http://localhost:8888/myapp/main/main.jsp");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 3, 40);
    naver_id_login.setDomain(".service.com");
    naver_id_login.setState(state);
    naver_id_login.init_naver_id_login();

    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        console.log(naver_id_login.getProfileData('name'));
        console.log(naver_id_login.getProfileData('email'));
        console.log(naver_id_login.getProfileData('nickname'));
        console.log(naver_id_login.getProfileData('profile_image'));
    }

    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile(naverSignInCallback);
    </script>
    
 <!-- goolge -->
 <script src="https://apis.google.com/js/platform.js" async defer></script>
 <script>
  function onSignIn(googleUser) {
    // 구글 사용자 프로필 정보 가져오기
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId());
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail());

    // ID 토큰을 서버에 전송하거나 추가 작업을 수행할 수 있습니다.
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
  }
</script>
 
</body>
</html>