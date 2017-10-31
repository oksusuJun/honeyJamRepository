<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${sessionScope.loginMember ==null}">
<jsp:forward page="/member/login.jsp"/> 
</c:if>
<a href="${initParam.rootPath }/main.jsp">메인으로 </a>
<hr>

<a href="${initParam.rootPath }/member/view.jsp">내 정보 조회 </a><br>
<a href="${initParam.rootPath }/member/edit.jsp">내 정보 수정 </a><br>
<a href="${initParam.rootPath }/member/reservation_view.jsp">예약조회</a><br>
<a href="${initParam.rootPath }/member/myboard.jsp">내가 작성한 리뷰 </a><br>
<a href="${initParam.rootPath }/member/delete.jsp">탈퇴 </a><br>


</body>
</html> 
