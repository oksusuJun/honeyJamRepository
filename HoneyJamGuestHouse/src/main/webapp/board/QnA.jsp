<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HoneyJam</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/HoneyJamGuestHouse/css/QnAmenu.css">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<script src="/HoneyJamGuestHouse/scripts/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>
<style type="text/css">
	.content{
	margin-top: 10px;
	width: 880px;
	min-height: 600px;
	}
	.text{
	width: 100%;
	height: 150px;
	line-height: 150px;
	font-size: 44px;
	font-weight: bold;
	margin-top: 70px;
	}
	h3{
	text-align: left;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="text">QnA</div>
	<div class="content">
		<div id="accordion">
			<h3>Q . 게스트하우스에 조식주나요?</h3>
			<div>
				<p>A . 각각의 방마다 조식옵션이 다릅니다.</p>
			</div>
			<h3>Q . 게스트하우스는 언제 체크인하나요?</h3>
			<div>
				<p>A . 체크인시간은 pm 1 : 00 입니다.</p>
			</div>
			<h3>Q . 게스트하우스는 언제 체크아웃하나요?</h3>
			<div>
				<p>A . 체크아웃시간은 am 11 : 00 입니다.</p>
			</div>
			<h3>Q . 게스트하우스에 수건이 있나요?</h3>
			<div>
				<p>A. 게스트하우스에서 수건은 제공해드립니다.</p>
			</div>
			<h3>Q . 게스트하우스에 화장실이 방마다있나요?</h3>
			<div>
				<p>A. 화장실은 방마다1개 와 공용화장실이 있습니다.</p>
			</div>
			<h3>Q . 성수기와 비수기 가격이 다른가요?</h3>
			<div>
				<p>A. 저희 게스트하우스는 성수기,비수기 모두 가격이 동일합니다.</p>
			</div>
			<h3>Q . 방마다 에어콘이 있나요?</h3>
			<div>
				<p>A. 저희 게스트하우스는 방마다 에어콘이 있어 쾌적한 환경을 제공해드립니다..</p>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>

</body>
</html>