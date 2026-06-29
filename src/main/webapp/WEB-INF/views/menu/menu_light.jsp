<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<style>

body {
	font-family: Arial, sans-serif;
}


.section1 {
	margin: 0 330px; /* 왼쪽과 오른쪽 양쪽에 여백 추가 */
	padding: 0px;
	width: auto;
}


footer {
	background-color: #eee;
}

.foot {
	margin: 0 330px;
}

header {
	margin: 0 330px;
	text-align: center;
	background-color: white;
	color: white;
	padding: 0px 40px 0px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	/*box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /*그림자 효과야*/ */
	bottom: 0;
}


.logo img {
	width: 150px;
	height: auto;
}



.main-menu {
	display: flex;
	gap: 5px;
	font-size: 14px;
	color: #bbb;
	font-weight: bold;
	margin : 0 0 80px 20px;
}

.main-menu a {
	font-family: "Noto Sans KR", sans-serif;
	color: #aaa;
	text-decoration: none;
	font-weight: bold;
	font-size: 14px;
	transition: color 0.3s ease;
}

.main-menu a:hover {
	color: #ffcc00;
}

.bigmenu {
	margin: 0 0px;
	/* background-color: #222; */
	background-color: none;
	color: white;
	padding: 100px 20px 10px 60px;
	display: flex;
	/* justify-content: space-between; */
	align-items: center;
	
}

.bigmenu ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigmenu ul li {
	font-family: "Noto Sans KR", sans-serif;
	font-size : 18px;
	position: relative;
	margin-right: 5px;
	padding: 0 20px;
	font-weight: bold;
	transition: color 0.3s ease;
	white-space: nowrap;
}

.bigmenu ul li a {
	color: black;
	text-decoration: none;
	font-weight: bold;
	transition: color 0.3s ease;
}

.bigmenu ul li a:hover {
	color: #ffcc00;
}

.combo-box {
	position: relative;
	cursor: pointer;
}

.submenu {
	display: none;
	position: absolute;
	direction: row;
	top: 100%;
	left: 0;
	background-color: #ccc;
	border: 1px soild rgb(168,12,12);
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	list-style: none;
	padding: 0px;
	display: flex;
	flex-wrap: wrap;
	/*justify-content: space-between;*/
}

.submenu a {
	color: white;
	text-decoration: none;
	display: block;
	padding: 1px 1px;
	transition: background-color 0.3s ease;
}

.submenu a:hover {
	background-color: #777;
}

.search {
	margin-left: auto;
	display: flex;
	align-items: center;
}

.search input {
	padding: 8px;
	border: none;
	border-radius: 4px;
	margin-right: 10px;
}

.search button {
	border: none;
	background: url('search-icon.png') no-repeat center center;
	background: cover;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="../../../resources/images/clearicon.ico" type="image/x-icon">
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		hideMenu(1);
		hideMenu(2);
		hideMenu(3);
		hideMenu(4);
		hideMenu(5);
	});
	function showMenu(menuNum) {
		// 숨겨진 모든 서브메뉴를 숨김
		for (let i = 1; i <= 5; i++) {
			hideMenu(i);
		}
		// 선택된 메뉴의 서브메뉴를 표시
		document.getElementById("submenu" + menuNum).style.display = "block";
	}
	function hideMenu(menuNum) {
		document.getElementById("submenu" + menuNum).style.display = "none";
	}
	function keepShow(menuNum) {
		clearTimeout(hideMenuTimeout);
	}

	function hideDelay(menuNum) {
		hideMenuTimeout = setTimeout(function() {
			hideMenu(menuNum);
		}, 100); // 딜레이
	}
</script>

<body>
	<header>
	
		<div class="logo">
			<a href="/"><img
				src="/resources/images/icon/mainlogo2white.png"
				style="width: 250px; height: 150;">
		</div>

		<div class="bigmenu">
		<ul>
			<li><a href="/moviechart.do" onmouseover="showMenu(1)"
				onmouseout="hideDelay(1)" onmousemove="keepShow(1)">예매</a>
				<ul class="submenu" id="submenu1" onmouseover="keepShow(1)"
					onmouseout="hideDelay(1)">
					<li><a href="/moviechart.do">영화먼저</a></li>
					<li><a href="/findcinema.do">극장먼저</a></li>
				</ul></li>
			<li><a href="/moviechart.do" onmouseover="showMenu(2)"
				onmouseout="hideDelay(2)" onmousemove="keepShow(2)">영화</a>
				<ul class="submenu" id="submenu2" onmouseover="keepShow(2)"
					onmouseout="hideDelay(2)">
					<li><a href="/moviechart.do">영화 예매</a></li>
					<li><a href="/moviechart.do">상영중인 영화</a></li>
				</ul></li>
			<li><a href="/findcinema.do" onmouseover="showMenu(3)"
				onmouseout="hideDelay(3)" onmousemove="keepShow(3)">극장</a>
				<ul class="submenu" id="submenu3" onmouseover="keepShow(3)"
					onmouseout="hideDelay(3)">
					<li><a href="/findcinema.do">극장 예매</a></li>
					<li><a href="/findcinema.do">쌍용시네마 찾기</a></li>
				</ul></li>
			<li><a href="../store/index.jsp" onmouseover="showMenu(4)"
				onmouseout="hideDelay(4)" onmousemove="keepShow(4)">스토어</a>
				<ul class="submenu" id="submenu4" onmouseover="keepShow(4)"
					onmouseout="hideDelay(4)">
					<li><a href="#">팝콘, 매점</a></li>
					<li><a href="#">굿즈</a></li>
				</ul></li>
			<li><a href="/list.do" onmouseover="showMenu(5)"
				onmouseout="hideDelay(5)" onmousemove="keepShow(5)">이벤트/혜택</a>
				<ul class="submenu" id="submenu5" onmouseover="keepShow(5)"
					onmouseout="hideDelay(5)">
					<li><a href="#">진행중인 이벤트</a></li>
					<li><a href="#">기프티콘</a></li>
				</ul></li>
		</ul>

		<!-- <div class=search>
			<input type="text" name="search" size="50">
			<button style="border: none; background: none;"></button>
		</div>-->
		
	</div> 
		<div>
			<c:choose>
				<c:when test='${sessionScope.userid==null}'>
					<div class="main-menu">
						 
						<a href="/login.do">로그인</a>&nbsp;|&nbsp; <a
							href="/member/register.do">회원가입</a>&nbsp;|&nbsp;<a
							href="/mypage/detail.do">마이페이지</a>&nbsp;|&nbsp;<a
							href="/cboard/main.do">고객센터</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="main-menu">
						${sessionScope.name}님&nbsp;&nbsp;|&nbsp;<a
							href="/member/logout.do">로그아웃</a>&nbsp;|&nbsp;<a
							href="/mypage/detail.do">마이페이지</a>&nbsp;|&nbsp;<a
							href="/cboard/main.do">고객센터</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	
	</header>
	<br><hr style="border: 1px solid rgb(168, 12, 12); margin: 0 0 0 0;">
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
			<footer style="background : #eee; margin:0; padding : 150px 0 50px 0">
		<div class = "foot" >
			<hr style="border: 1px solid #ccc; margin: 0 0 50px 0;">
		    <div style=" color: #666; padding: 10px; line-height: 0.7; font-size : 12px">
		        <p>&copy; 2024 SSANG YONG CINEMA. All rights reserved.</p>
		        <p>(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)</p>
		        <p>대표이사 : 한승찬  /  사업자등록번호 : 104-81-45690  /  통신판매업신고번호 : 2017-서울용산-0662 사업자정보확인</p>
		        <p>호스팅사업자 : 쌍용엔터테이먼트  /  대표이메일 : hanseung@naver.com</p>
		        <div style="margin-top: 10px;">
		            <a href="#">Terms of Service</a> | <a href="menu-test.do">Privacy Policy</a>
		        </div>
		    </div>
	    </div>
</footer>
	
</body>