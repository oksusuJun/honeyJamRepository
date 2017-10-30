<%@ page contentType="text/html; charset=UTF-8"%>
<script src="jquery-1.12.3.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".mainmenu > li").on("mouseover", function() {
			$(this).children(".submenu").stop().slideDown();
		})
		$(".mainmenu > li").on("mouseleave", function() {
			$(this).children(".submenu").stop().slideUp();
		})
	})
</script>
<style type="text/css">
* {
	margin: 0 auto;
	list-style: none;
	padding: 0;
	text-align: center;
	color: black;
	list-style: none;
	text-decoration: none;
}

body {
	min-width: 1080px;
}

header {
	margin: 0 auto;
	width: 100%;
	height: 49px;
	border-bottom: 1px solid #000;
	padding: 5px 5px;
}

.header_left {
	margin-left: 15%;
	float: left;
	height: 100%;
	width: 40%;
}

.header_left_img {
	width: 20%;
	float: left;
	border-right: 1px solid #000;
	height: 100%;
}

.header_left_menu {
	float: left;
	width: 70%;
	height: 100%;
}

.mainmenu {
	float: left;
	width: 100px
}

.mainmenu>li {
	height: 50px;
}

.mainmenu>li>a {
	line-height: 50px;
}

.submenu {
	display: none;
}

.submenu>li {
	width: 100%;
	float: none;
	height: 30px;
	height: 40px;
	background-color: rgba(0, 0, 0, 0.1);
}

.submenu>li>a {
	line-height: 40px;
}

.header_right {
	width: 15%;
	margin-right: 15%;
	float: right;
	height: 100%;
}

.header_right>ul {
	width: 100%;
	height: 100%;
}

.header_right>ul>li {
	width: 40%;
	height: 100%;
	float: left;
	background: #fff;
	cursor: pointer;
	border: 1px solid #000;
}

.header_right>ul>li>a {
	line-height: 49px;
}
</style>

<header>
	<div class="header_left">
		<div class="header_left_img">
			<img src="#" alt="img" title="img">
		</div>
		<div class="header_left_menu">
			<ul class="mainmenu">
				<li><a href="#">소개</a>
					<ul class="submenu">
						<li><a href="#">서브메뉴1</a></li>
						<li><a href="#">서브메뉴2</a></li>
						<li><a href="#">서브메뉴3</a></li>
					</ul></li>
			</ul>
			<ul class="mainmenu">
				<li><a href="#">메뉴1</a>
					<ul class="submenu">
						<li><a href="#">서브메뉴1</a></li>
						<li><a href="#">서브메뉴2</a></li>
						<li><a href="#">서브메뉴3</a></li>
					</ul></li>
			</ul>
			<ul class="mainmenu">
				<li><a href="#">커뮤니티</a>
					<ul class="submenu">
						<li><a href="#">서브메뉴1</a></li>
						<li><a href="#">서브메뉴2</a></li>
						<li><a href="#">서브메뉴3</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div class="header_right">
		<ul>
			<li><a href="#">login</a></li>
			<li><a href="#">mypage</a></li>
		</ul>

	</div>
</header>