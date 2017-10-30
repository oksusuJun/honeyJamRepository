<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<a href="${initParam.rootPath }/main.jsp">메인으로 </a>
<hr>


<form action="${initParam.rootPath }/login" method="post">
id(email) : <input type="text" name="email"><br>
password : <input type="password" name="password"><br>
<button>로그인</button>
</form>


<c:if test="${requestScope.errorMessage !=null}">
	<script>
	alert("에러: "+ "${requestScope.errorMessage }");
	</script>
</c:if>
</body>
</html> 
