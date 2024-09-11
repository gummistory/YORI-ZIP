<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스마트 에디터 2.0 JSP 적용</title>
    <!-- 스마트 에디터 관련 스타일 및 스크립트 추가 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/smarteditor2/css/smart_editor2.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
    <h2>글쓰기</h2>
    
    <form action="submitPost.jsp" method="post">
        <!-- 에디터를 사용할 textarea -->
        <textarea name="content" id="content" rows="10" cols="100"></textarea>
        
        <br>
        <input type="submit" value="저장하기">
    </form>

    <!-- 스마트 에디터 2.0 초기화 스크립트 -->
    <script type="text/javascript">
        var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "content",  // 에디터가 적용될 textarea의 id
            sSkinURI: "${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html",  // 에디터 스킨 경로
            fCreator: "createSEditor2"
        });

        function submitPost() {
            // 스마트에디터의 내용을 textarea에 적용
            oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
            
            // 데이터가 정상적으로 입력되었는지 확인
            var content = document.getElementById("content").value;
            if(content == "" || content == null) {
                alert("내용을 입력하세요.");
                return false;
            }
            
            // 폼 제출
            return true;
        }
    </script>
</body>
</html>
