<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	*{
		margin: 0 auto;
		padding: 0;
		list-style: none;
		text-decoration: none;

	}
	.logo{
		margin-top: 30px;
		width: 400px;
		text-align: center;
		height: 100px;
		line-height: 125px;
	}
	.join_form{
		width: 400px;
		text-align: center;
	}

	input{
		width: 400px;
		height: 50px;
		margin-top: 20px;
	}
	.join_form >form >  button{
		width: 400px;
		height: 70px;
		background: pink;
		color: #fff;
		margin-top: 10px;
		font-weight: bold;
		font-size: 16px;
		line-height: 70px;
		outline: 0;
		border: 0;
	}
</style>
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
<div class="logo">
		<a href="${initParam.rootPath }/main.jsp"><img src="/HoneyJamGuestHouse/img/logo.png" alt="img"></a>
</div>
<div class="join_form">
	<form action="${initParam.rootPath}/memberInsert" method="post" name="join_form">
<input type="text" name="email" placeholder="ID(email)"><br>
<input type="password" name="password" placeholder="Password "><br>
<input type="text" name="nickname" placeholder="닉네임"><br>
<input type="text" name="phoneNum" placeholder="휴대폰번호 "><br> 


<button type="button" onclick="checkVals();">회원가입</button>
</form>
</div>


<c:if test="${requestScope.errorMessage != null}">
<script>
	alert("에러: "+"${requestScope.errorMessage}");
</script>

</c:if>



</body>
</html> 
