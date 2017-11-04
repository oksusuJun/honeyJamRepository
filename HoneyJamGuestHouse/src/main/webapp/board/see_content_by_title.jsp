<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@font-face{
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}
.content {
	min-width: 1080px;
	width: 1080px;
	min-height: 300px;
	margin-top: 50px;
}

table {
	width: 100%;
}

tr {
	height: 60px;
	border-bottom: 1px solid #ccc;
	line-height: 20px;
	background: #fafafa;
}

td{
	font-weight:normal;
	background: #fff
}

button {
	width: 100px;
	height: 40px;
	border: solid 1px pink;
	background: #fff;
	outline: 0;
	border-radius: 30px;
}

.content_top {
	width: 100%;
	height: 50px;
	line-height: 50px;
	color: #FF5A5F !important;
	text-align: left;
	border-bottom: 3px solid #FF5A5F !important;
	font-family: myFont;
	font-size: 28px;
}
</style>
<body>
<!-- 메인 - 리뷰게시판 - 제목을 클릭하면 내용을 보여주는 페이지 -->
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="content">
		<div class="content_top">&nbsp;&nbsp;♥HoneyJam 후기♥</div>
		<table>
			<thead>
				<tr>
					<th width="15%;">제목</th>
					<th width="45%;" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.item.title }</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>내용</td>
						<td width="45%;" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.item.content }</td>
					</tr>
			</tbody>
		</table>
	</div>
	<a href="/HoneyJamGuestHouse/BoardViewServlet"><button>뒤로가기</button></a>
	<c:if test="${sessionScope.loginMember.email == 'admin'}">
		<a href="${initParam.rootPath }/boardDelete?itemNum=${requestScope.item.itemNum}"><button>삭제</button></a>	
	</c:if>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>

</body>
</html>