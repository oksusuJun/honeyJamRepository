<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script>

	

function checkVals(){
	var f = document.edit;
	if(f.oldPass.value.length ==0){
		alert("기존 비밀번호를 입력하세요");
		f.oldPass.focus();
		return false;		
	}else if(f.password.value.length == 0){
		alert("새 비밀번호를 입력하세요");
		f.password.focus();
		return false;
	}else if(f.nickname.value.length ==0){
		alert("닉네임을 입력하세요");
		f.nickname.focus();
		return false;
	}else if(f.phoneNum.value.length==0){
		alert("전화번호를 입력하세요");
		f.phoneNum.focus();
		return false;
	}else if(f.password.value != f.password1.value){
		alert("새 비밀번호를 다시 확인해주세요")
		f.password.value = "";
		f.password1.value ="";
		f.password.focus();
		return false;
	}else if(f.oldPass.value != "${sessionScope.loginMember.password}"){
		alert("기존 비밀번호가 틀렸어요");
		f.oldPass.value="";
		f.oldPass.focus();
		return false;
	}else{
		return true;
	}
	
	
}

function checkPassword(){
	var f = document.edit;
	if(f.password.value != f.password1.value){
		alert("새 비밀번호를 다시 확인해주세요")
		f.password.value = "";
		f.password1.value ="";
		f.password.focus();
		return false;
	}else if(f.oldPass.value != "${sessionScope.loginMember.password}"){
		alert("기존 비밀번호가 틀렸어요");
		f.oldPass.value="";
		f.oldPass.focus();
		return false;
	}else{
		return true;
	}
	
}



</script>

<body>

<c:if test="${sessionScope.loginMember ==null}">
<jsp:forward page="/member/login.jsp"/> 
</c:if>

<jsp:include page="/member/mypage.jsp"></jsp:include>
<br><br>

<h1>회원정보수정</h1>
<form action="${initParam.rootPath }/memberEdit" method="post" name="edit"
 onsubmit="return checkVals();">
 
email : ${sessionScope.loginMember.email }<br>
기존 비밀번호 : <input type="password" name="oldPass"><br>
새 비밀번호 : <input type="password" name="password"><br>
새 비밀번호 한번 더 확인 : <input type="password" name="password1"><br>
nickname : <input type="text" name="nickname" value="${sessionScope.loginMember.nickname }"><br>
phone number : <input type="text" name="phoneNum" value="${sessionScope.loginMember.phoneNum }"><br>
<button>정보수정</button>
</form>

<c:if test="${requestScope.errorMessage != null }">
<script>
	alert("에러: "+"${requestScope.errorMessage}");
</script>
</c:if>

</body>
</html>