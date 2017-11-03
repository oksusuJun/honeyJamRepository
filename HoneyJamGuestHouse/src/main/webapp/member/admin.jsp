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

<h1>관리자가 할 수 있는 일들을 추가해볼까요?</h1>
<h1>1.회원 삭제 기능</h1>
<form action="${initParam.rootPath}/AdminDeleteMember" method="post">
삭제하고자 하는 회원의 email(id): <input type="text" name="delete_email"><button>회원 삭제하기</button>
</form>


<h1>3. reservation 삭제 기능 등 </h1>

</body>
</html>