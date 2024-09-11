<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠킹일지</title>

    <style>


        h1 {
            margin: 20px 0;
            text-align: center;
            font-size: 24px;
            color: #333;
        }

        .write-button {
            text-align: right;
            margin-bottom: 20px;
            padding-right: 20px;
        }

        .write-button button {
            background-color: #b38c5a;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .write-button button:hover {
            background-color: #a77c49;
        }

        .album-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .album-item {
            position: relative;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .album-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .album-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .album-title {
            position: absolute;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            width: 100%;
            text-align: center;
            padding: 10px 0;
            font-size: 16px;
        }

        .pagination {
            text-align: center;
            padding: 20px;
        }

        .pagination a {
            margin: 0 5px;
            padding: 10px 15px;
            color: #333;
            border: 1px solid #ddd;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.2s;
        }

        .pagination a.active {
            background-color: #b38c5a;
            color: #fff;
            border-color: #b38c5a;
        }

        .pagination a:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <!-- 헤더 -->
    <header>
       
        <jsp:include page="/main/header.jsp" />
    </header>
 <h1>쿠킹일지</h1>
    <!-- 글쓰기 버튼 -->
    <div class="write-button">
        <button onclick="location.href='/writePost.jsp'">글쓰기</button>
    </div>

    <!-- 앨범 형식 게시물 -->
    <div class="album-container">
        <c:forEach var="post" items="${postList}">
            <div class="album-item" onclick="location.href='/postDetail.jsp?postId=${post.id}'">
                <img src="${post.imageUrl}" alt="${post.title}">
                <div class="album-title">${post.title}</div>
            </div>
        </c:forEach>
    </div>

    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="?page=${i}" class="${page == i ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>

    <footer>
        <jsp:include page="/main/footer.jsp" />
    </footer>

</body>
</html>
