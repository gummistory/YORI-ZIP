// selectedImages 변수를 다시 선언하지 않도록 주의합니다.
let winners = [];
let currentPair = [];
let roundCount = 8; // 현재 라운드 (8강 -> 4강 -> 준결승 -> 결승)

function selectImage(index) {
    winners.push(currentPair[index]); // 선택된 이미지를 winners에 저장

    if (selectedImages.length > 0) {
        // 다음 라운드로 진행
        nextRound();
    } else if (winners.length === 2 && roundCount === 4) {
        // 결승전으로 넘어감
        roundCount = 2;
        selectedImages = winners;
        winners = [];
        nextRound();
    } else if (winners.length === 1 && roundCount === 2) {
        // 결승전 승자가 결정됨
        alert("최종 승자는 " + winners[0] + " 입니다!");
    } else if (selectedImages.length === 0 && roundCount > 2) {
        // 다음 라운드로 넘어가도록 이미지와 승자를 정리
        selectedImages = winners;
        winners = [];
        roundCount = roundCount / 2; // 라운드를 절반으로 줄임 (8강 -> 4강 -> 준결승)
        nextRound();
    }
}

function nextRound() {
    if (selectedImages.length >= 2) {
        // 새로운 페어를 선택합니다.
        currentPair = selectedImages.splice(0, 2);

        // 이미지 업데이트
        document.getElementById('image1').src = '/static/images/minigame/' + currentPair[0];
        document.getElementById('image2').src = '/static/images/minigame/' + currentPair[1];

        // 선택 이벤트 설정
        document.getElementById('image1').onclick = () => selectImage(0);
        document.getElementById('image2').onclick = () => selectImage(1);
    } else if (winners.length > 0) {
        // 라운드가 끝났지만 이미지는 부족하므로 다음 라운드를 준비
        selectedImages = winners;
        winners = [];
        roundCount = roundCount / 2;
        nextRound();
    }
}

function startGame() {
    nextRound(); // 첫 라운드를 시작
}

document.addEventListener("DOMContentLoaded", startGame);