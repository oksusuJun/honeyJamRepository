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

<h1>${sessionScope.loginMember.email}의 회원정보 조회 </h1>

이메일 : ${sessionScope.loginMember.email}<br>
닉네임 : ${sessionScope.loginMember.nickname}<br>
전화번호 : ${sessionScope.loginMember.phoneNum }<br>

<a href="${initParam.rootPath }/member/edit.jsp">내 정보 수정</a>

</body>
</html> 
