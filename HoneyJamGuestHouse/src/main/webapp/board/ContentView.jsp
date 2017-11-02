<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>

	<tr>
		<th>게시글 ID</th>
		<th>제목</th>
		<th>작성날짜</th>
	</tr>
	
	
	<c:forEach items="${requestScope.itemList}" var="item">
	<tr>
		<td>${item.itemNum}</td>
		<td>${item.title}</td>
		<td>${item.writeDate}</td>
	</tr>
	</c:forEach>

</table>


	<a href="/HoneyJamGuestHouse/board/write.jsp">게시물 작성</a>



</body>
</html>