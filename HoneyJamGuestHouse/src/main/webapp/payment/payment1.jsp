<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<style>
	table {
		margin: 10px;
		border-collapse: collapse;
		margin: 10px auto;
		width : 90%;
	}
	
	table td {
		padding: 12px 10px;
		border: 1px solid black;
	}
	
	.wrapper {
		width: 960px;
		margin: 0 auto;
	}
</style>
</head>
<body>
<div class="wrapper">
<h1>1/3 예약정보, 결제정보 확인</h1>
	<table>
		<tr>
			<td colspan="2">예약 정보</td>
		</tr>
		<tr>
			<td>예약자</td>
			<td>test@test.com</td>
		</tr>
		<tr>
			<td>객실</td>
			<td>202호</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>2018년 1월 1일 ~ 2018년 1월 2일</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>남자</td>
		</tr>
		<tr>
			<td>인원</td>
			<td>2명</td>
		</tr>
		<tr>
			<td>요금</td>
			<td>30,000원</td>
		</tr>
	</table>


	<table>
		<tr>
			<td colspan="2">결제 정보</td>
		</tr>
		<tr>
			<td>예약자 이름</td>
			<td><input type=text name="name" size=15 placeholder = 홍길동></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><select name="rdata_phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
			</select>
			-
				<input type="number" name="rdata_phone2"  style="width:60px /* height: 20px */"; id="rdata_phone2" maxlength="4" onkeyup="phoneChk(this.value);">
			-
				<input type="number" name="rdata_phone3" style="width:60px /* height: 20px */"; id="rdata_phone3" maxlength="4" onkeyup="phoneChk2(this.value);">
			</td>
		</tr>
		<tr>
			<td>결제 수단</td>
			<td>
				<form>
					<input type="radio" name="pay" value="card" checked="checked">카드
					<input type="radio" name="pay" value="deposit" >무통장입금
				</form>
			</td>
		</tr>
	</table>
	<div style="text-align: center;">
		<button onclick="location.href='./payment2-1.jsp'" style="padding:10px 50px;">다음(무통장)</button>
		<button onclick="location.href='./payment3-1.jsp'" style="padding:10px 50px;">다음(카드)</button>
	</div>	
	</div>
</body>
</html>