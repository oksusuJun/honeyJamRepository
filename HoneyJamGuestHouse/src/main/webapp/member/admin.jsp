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



<c:if test="${sessionScope.loginMember.email != 'admin'}">
		<jsp:forward page="/main.jsp" />
	</c:if>
	
	

<h1>관리자 메뉴</h1>

<br>
<h2>1.회원 정보 조회, 회원 강퇴 시키기</h2>
<br>

<form action="${initParam.rootPath}/adminSearchMember" method="post">
조회하고자 하는 회원의 email(id): <input type="text" name="search_email">
<button>회원 조회</button>
</form>

<br>


<!-- 여기 삭제 -->
<form action="${initParam.rootPath}/adminSearchByNickname" method="post">
조회하고자 하는 회원의 닉네임: <input type="text" name="search_nickname">
<button>회원 조회</button>
</form>

<c:if test="${requestScope.errorMessage !=null}">
	<span style="{color:red;}">${requestScope.errorMessage}</span>
</c:if>


<br>
<br>
<br>
<br>

<h2>2.특정 날짜의 예약현황 보기</h2>
<form action="${initParam.rootPath}/reservationSelectByDate" method="post">
조회하고자 하는 날짜(20171011 형태로 입력) : <input type="text" name="date">
<button>해당날짜 조회</button>
</form>


</body>
</html>