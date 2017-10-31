<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>

function checkform(){
	
	var f = document.delete_form;
	
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
	}else if(f.password.value.length==0){
		alert("비밀번호를 입력하세요");
		f.password.focus();
	}else{
		f.submit();
	}
	
}

</script>

<body>



<c:if test="${sessionScope.loginMember ==null}">
<jsp:forward page="/member/login.jsp"/> 
</c:if>

					탈퇴하려면 ID와 비밀번호를 다시한번 입력해주세요 
					<form action="${initParam.rootPath}/deleteMember" method="post" name="delete_form">
						ID(email) : <input type="text" name="email"><br>
						password : <input type="password" name="password"><br>
						<button type="button" onclick="checkform();">회원탈퇴</button>
					</form>
			

<c:if test="${requestScope.errorMessage != null}">
	<script>
		alert("에러: "+"${requestScope.errorMessage}");
	</script>
</c:if>




</body>
</html>