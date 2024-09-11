document.addEventListener('DOMContentLoaded', function () {
    // 콘솔에 myPageModal 요소가 제대로 선택되는지 확인
    console.log(document.getElementById("myPageModal")); // null이 아니라면 문제가 없습니다.

    // 마이페이지 li 클릭 시 팝업 열기
    var myPageLink = document.querySelector('.mypage a');
    if (myPageLink) {
        myPageLink.onclick = function (event) {
            event.preventDefault(); // 기본 링크 동작 막기
            document.getElementById("myPageModal").style.display = "flex";
        }
    }

    // 팝업 닫기
    function closeModal() {
        document.getElementById("myPageModal").style.display = "none";
    }

    // 오버레이 클릭 시 팝업 닫기
    var modalOverlay = document.getElementById("myPageModal");
    if (modalOverlay) {
        modalOverlay.onclick = function (event) {
            if (event.target === modalOverlay) {
                closeModal();
            }
        }
    }
});
