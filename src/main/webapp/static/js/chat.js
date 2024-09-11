/**
 * 
 */
 const openModalImg = document.querySelector('.open-chat-img');
        const modalOverlay = document.querySelector('.chat-overlay');
        const closeBtnFixed = document.querySelector('.close-btn-fixed');

        // 이미지 클릭 시 모달 열기
        openModalImg.addEventListener('click', () => {
            modalOverlay.style.display = 'block';
            closeBtnFixed.style.display = 'block'; // X 버튼 표시
        });

        // 닫기 버튼 클릭 시 모달 닫기
        closeBtnFixed.addEventListener('click', () => {
            modalOverlay.style.display = 'none';
            closeBtnFixed.style.display = 'none'; // X 버튼 숨기기
        });
        
        /*토글버튼*/
        function toggleButtons() {
            var buttons = document.querySelectorAll('.chatbtn');
            buttons.forEach(function(button) {
                button.classList.toggle('show');
            });

        }
        
        