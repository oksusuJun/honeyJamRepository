<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face{
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}

.content {
	min-width: 1080px;
	width: 1080px;
	min-height: 400px;
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
	border: solid 2px pink;
	outline: 0;
	border-radius: 30px;
	font-weight: bold;
	font-size: 15px;
	background: #fff
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

<script>
function checkVals(){
	var f = document.write;
	if(!f.title.value.length){
		alert("제목을 입력하세요");
		return false;
	}else if(f.content.value.length==0){
		alert("내용을 입력하세요");
		return false;
	}
	
	return true;
}

</script>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<c:if test="${sessionScope.loginMember ==null}">
		<jsp:forward page="/member/login.jsp" />
</c:if>

<form action="/HoneyJamGuestHouse/boardInsert" method="post" onsubmit="return checkVals();" name="write">
	
	<div class="body">
	
	<div class="content">
		<div class="content_top">&nbsp;&nbsp;♥HoneyJam 후기작성♥</div>
		<table>
			<thead>
				<tr>
					<th width="15%;">제목</th>
					<th width="45%;" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title"></th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>내용</td>
						<td width="45%;" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="70" rows="15" name="content"></textarea></td>
					</tr>
			</tbody>
		</table>
	</div>
	</div>
<button>등록</button>
</form>


</body>
</html>