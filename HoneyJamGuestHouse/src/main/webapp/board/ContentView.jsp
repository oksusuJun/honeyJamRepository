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
	min-height: 500px;
	margin-top: 50px;
	margin-bottom: 50px;
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
				<c:forEach items="${requestScope.list}" var="item">
					<tr>
						<td>${item.itemNum}</td>
						<td><a href="${initParam.rootPath }/findBoard?item=${item.itemNum}">${item.title}</a></td>
						<td>${item.email }</td>
						<td>${item.writeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<%-- 페이징 처리 --%>
<p>
	<%--첫페이지로 이동--%>
	<a href="${initParam.rootPath}/BoardViewServlet?page=1">첫페이지&nbsp;&nbsp;</a>


	<%--
		이전 페이지 그룹 처리.
		만약에 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리.
	 --%>
	
	
	<c:choose>
	
		<c:when test="${requestScope.pageBean.previousPageGroup}">
			<a href="${initParam.rootPath }/BoardViewServlet?page=${requestScope.pageBean.beginPage-1}">◁</a>
		</c:when>
		<c:otherwise>
				◁
		</c:otherwise>
	
	
	</c:choose>
	
	
	
	<%-- 
		현재 page가 속한 page 그룹내의 페이지들 링크.
		현재 pageGroup의 시작page ~ 끝 page
		- 만약에 p가 현재페이지면 링크처리를 하지 않고 p가 현재페이지가 아니라면 링크처리.
	 --%>
	 
	<c:forEach begin="${requestScope.pageBean.beginPage}" 
				end="${requestScope.pageBean.endPage}" var="num">
		
		<c:choose>		
		
		<c:when test="${requestScope.pageBean.page == num}">
			${num}
		</c:when>
		<c:otherwise>
		<a href="${initParam.rootPath }/BoardViewServlet?page=${num}">	${num} </a>
		</c:otherwise>
		</c:choose>
		
	</c:forEach>





	<%-- 
		다음페이지 그룹으로 이동
		만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
	 --%>
	<c:choose>
	
		<c:when test="${requestScope.pageBean.nextPageGroup}">
			<a href="${initParam.rootPath }/BoardViewServlet?page=${requestScope.pageBean.endPage+1}">▷</a>
		</c:when>
		<c:otherwise>
				▷
		</c:otherwise>
	
	
	</c:choose>
	
	
	
	<%-- 마지막 페이지로 이동 --%>
	
	
	<a href="${initParam.rootPath}/BoardViewServlet?page=${requestScope.pageBean.totalPage}">마지막페이지</a>
	
</p>
	
	<a href="/HoneyJamGuestHouse/board/write.jsp"><button>게시물 작성</button></a>
	
	
	

	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>


</body>
</html>