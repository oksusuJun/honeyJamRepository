<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<br>
	<br>
	
	<c:if test="${sessionScope.loginMember ==null}">
<jsp:forward page="/member/login.jsp"/> 
</c:if>

	<table>
	
	<tr>
    <th>게시물 번호</th>
    <th>게시물 제목</th> 
 	</tr>
	
	<c:forEach items="${requestScope.boardList}" var="item">
	<tr>
	<td>${item.itemNum}</td>
	<td><a href='${initParam.rootPath}/member/boardContent.jsp?num=${item.itemNum}'>${item.title}</a></td>
	</tr>
	</c:forEach>
	
	</table>


</body>
</html>