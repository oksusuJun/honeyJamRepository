<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메인 - 리뷰게시판 - 제목을 클릭하면 내용을 보여주는 페이지 -->
<h1>클릭한 게시물</h1>
제목 : ${requestScope.item.title } 
작성 글 : ${requestScope.item.content }

</body>
</html>