<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body {
	margin-top: 100px;
	max-width: 960px;
	min-width: 960px;
}

.body_left {
	width: 17%;
	float: left;
}

.myinfo {
	width: 100%;
	height: 200px;
	float: left;
	line-height: 200px;
	background: #525f78;
	color: #fff;
}

.menu {
	width: 100%;
	min-height: 200px;
	float: left;
	background: #a4a4a4;
}

.menu>a {
	border-bottom: 0.1px solid grey;
	color: #fff;
	width: 90%;
	float: left;
	text-align: left;
	height: 40px;
	line-height: 40px;
	padding-left: 10%;
}

.content {
	width: 60%;
	float: left;
	padding-left: 10%;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<c:if test="${sessionScope.loginMember ==null}">
		<jsp:forward page="/member/login.jsp" />
	</c:if>

	<div class="body">
		<div class="body_left">
			<div class="myinfo">
				${sessionScope.loginMember.email } 님<br> 환영합니다.
			</div>
			<div class="menu">
				<a href="${initParam.rootPath }/member/mypage.jsp">내 정보 조회 </a> <a href="${initParam.rootPath}/member/edit.jsp">내 정보 수정 </a> <a
					href="${initParam.rootPath}/member/reservation_view.jsp">예약조회</a> <a href="${initParam.rootPath}/member/myboard.jsp">내가
					작성한 리뷰 </a> <a href="${initParam.rootPath}/member/delete.jsp">탈퇴 </a><br>
			</div>
		</div>

		<div class="content">
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
		</div>
	</div>

</body>
</html>