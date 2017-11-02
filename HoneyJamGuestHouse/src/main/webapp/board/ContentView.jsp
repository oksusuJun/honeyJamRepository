<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<title>HoneyJam</title>
<style type="text/css">
@font-face{
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}
.content {
	min-width: 1080px;
	width: 1080px;
	min-height: 700px;
	margin-top: 50px;
}

table {
	width: 100%;
}

th {
	height: 60px;
	border-bottom: 1px solid #ccc;
	line-height: 20px;
	background: #fafafa;
}

td {
	height: 30px;
}

button {
	width: 100px;
	height: 40px;
	border: solid 1px pink;
	background: #fff;
	outline: 0;
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
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="content">
		<div class="content_top">&nbsp;&nbsp;HoneyJam을 이용해주신 후기입니다.</div>
		<table>
			<thead>
				<tr>
					<th width="15%;">NO.</th>
					<th width="45%;" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</th>
					<th width="20%">작성자</th>
					<th width="20%">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.itemList}" var="item">
					<tr>
						<td>${item.itemNum}</td>
						<td>${item.title}</td>
						<td>${item.email }</td>
						<td>${item.writeDate}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
	<a href="/HoneyJamGuestHouse/board/write.jsp"><button>게시물 작성</button></a>


	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>


</body>
</html>