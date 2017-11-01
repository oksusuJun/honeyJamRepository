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
	<button style="padding:10px 50px; display:block; margin:0 auto;">다음</button>
	<table>
		<tr>
			<td>지불방법</td><td>무통장 입금</td>
		</tr>
		<tr>
			<td>예약번호</td><td>A1234</td>
		</tr>
		<tr>
			<td>객실이름</td><td>202호</td>
		</tr>
		<tr>
			<td>졔좌정보</td><td>신한 9999-88888-77777 예금주 : 꿀잠</td>
		</tr>
		<tr>
			<td>결제금액</td><td>30,000원</td>
		</tr>
		<tr>
			<td colspan="2">※ 예약 후 1시간 이내 입금되지 않을 경우 자동 취소 됩니다.</td>
		</tr>
	</table>	
	<button style="padding:10px 50px; display:block; margin:0 auto;">예약하기</button>
		

	<table>
		<tr>
			<td>지불방법</td><td>카드</td>
		</tr>
		<tr>
			<td>예약번호</td><td>A1234</td>
		</tr>
		<tr>
			<td>객실이름</td><td>202호</td>
		</tr>
		<tr>
			<td>결제금액</td><td>30,000원</td>
		</tr>
	</table>
	<button style="padding:10px 50px; display:block; margin:0 auto;">결제하기</button>
	</div>
</body>
</html>