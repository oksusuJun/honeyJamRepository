<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">


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


<c:if test="${sessionScope.loginMember ==null}">
		<jsp:forward page="/member/login.jsp" />
</c:if>

<form action="/HoneyJamGuestHouse/boardInsert" method="post" onsubmit="return checkVals();" name="write">

제목: <input type="text" name="title"><br>
내용:
<textarea cols="70" rows="15" name="content"></textarea><br>
<button>등록</button>
</form>


</body>
</html>