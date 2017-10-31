<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/member/mypage.jsp"></jsp:include>
	<br>
	<br>

	<table>
	
	<tr>
    <th>게시물 번호</th>
    <th>게시물 제목</th> 
 	</tr>
	
	<c:forEach items="${requestScope.boardList}" var="item">

		<li>${item.title}</li>

	</c:forEach>
	
	</table>


</body>
</html>