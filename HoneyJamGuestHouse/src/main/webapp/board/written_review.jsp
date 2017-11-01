<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>업로드 결과</h1>
제목 : ${requestScope.result.title }<br>
내용 : ${requestScope.result.content }<br>
</body>
</html>