<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 리뷰(후기)작성하는 페이지 -->
<h1>후기 작성</h1>
<form action="${initParam.rootPath }/register" method="post" enctype="multipart/form-data">
제목 : <input type="text" name="title"><br>
내용 : 
<textarea cols="70" rows="15" name="content"></textarea>
<button>등록</button>
</form>
</body>
</html>