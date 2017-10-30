<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<script>

function checkVals(){
	
	var f = document.join_form;
	
	if(f.email.value.length == 0){
		alert("email을 꼭 입력하세요");
		f.email.focus();
	}else if(f.password.value.length ==0){
		alert("비밀번호를 입력하세요");
		f.password.focus();
	}else if(f.nickname.value.length==0){
		alert("닉네임을 입력하세요");
		f.nickname.focus();
	}else if(f.phoneNum.value.length==0){
		alert("전화번호를 입력하세요");
		f.phoneNum.focus();
	}else{
		f.submit();
	}
	
}

</script>
<body>
<a href="${initParam.rootPath }/main.jsp">메인으로 </a>
<hr>
<h1>회원가입</h1>
<form action="${initParam.rootPath}/memberInsert" method="post" name="join_form">


ID(email) : <input type="text" name="email"><br>
Password : <input type="password" name="password"><br>
닉네임 : <input type="text" name="nickname"><br>
휴대폰번호 : <input type="text" name="phoneNum"><br> 

<button type="button" onclick="checkVals();">회원가입</button>
</form>


<c:if test="${requestScope.errorMessage != null}">
<script>
	alert("에러: "+"${requestScope.errorMessage}");
</script>

</c:if>




</body>
</html> 
