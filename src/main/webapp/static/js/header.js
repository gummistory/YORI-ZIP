
	document.addEventListener('DOMContentLoaded', function() {
    var hamburgerMenu = document.querySelector('.hamburger-menu');
    var mobileMenu = document.querySelector('.mobile-menu');

    // 햄버거 메뉴 클릭 시 모바일 메뉴 토글
    hamburgerMenu.addEventListener('click', function() {
        mobileMenu.classList.toggle('active');
    });

    // 로그인 상태를 저장할 변수 (여기서는 예제용으로 false로 설정)
    var isLoggedIn = false; // 실제 로그인 상태를 여기에 맞게 설정

    var userMenu = document.querySelector('.user-menu');
    var mobileMenu = document.querySelector('.mobile-menu');

    // 로그인 상태에 따라 user-menu 및 mobile-menu 업데이트
    if (isLoggedIn) {
        userMenu.classList.add('logged-in');
        mobileMenu.classList.add('logged-in');
    } else {
        userMenu.classList.remove('logged-in');
        mobileMenu.classList.remove('logged-in');
    }

 // 데스크탑 로그아웃 버튼 클릭 시 처리
    document.querySelector('.user-menu .logout a').addEventListener('click', function(event) {
        event.preventDefault();
        logoutUser(); // 로그아웃 함수 호출
    });

    // 모바일 로그아웃 버튼 클릭 시 처리
    document.querySelector('.mobile-menu .logout-mobile a').addEventListener('click', function(event) {
        event.preventDefault();
        logoutUser(); // 로그아웃 함수 호출
    });

    // 로그아웃 함수
    function logoutUser() {
        // AJAX 요청을 사용하여 서버의 로그아웃 엔드포인트 호출
        fetch('/auth/logout', {
            method: 'GET', // 로그아웃은 GET 요청으로 처리
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (response.redirected) {
                // 로그아웃이 성공적으로 처리되면 리다이렉트된 URL로 이동
                window.location.href = response.url;
            }
        })
        .catch(error => console.error('Error:', error));
    }

});
