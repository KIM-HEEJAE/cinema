<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<title>공지사항/자주 묻는 질문</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="http://code.jquery.com/jquery-3.6.1.js"></script>

<link rel="icon" href="../../../resources/images/clearicon.ico" type="image/x-icon">
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
a:hover {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

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
	margin: 0 400px 0 400px;
	text-align: center;
	background-color: none;
	color: white;
	padding: 0px 40px 0px 40px;
	display: flex;
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

.navbar {
	overflow: hidden;
	background-color: #eee;
	font-family: Arial, sans-serif;
 	 display: flex;
     flex-direction: column;
     position: fixed;
     top: 0;
     left: 0;
     width: 240px;
     height: 100%;
     padding: 20px; /* 원하는 여백값으로 조정하세요 */
}

.navbar a {
	font-family: "Noto Sans KR", sans-serif;
	float: left;
	font-size: 18px;
	color: black;
	text-align: center;
	padding: 14px 0px;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #ffe0cc;
	color: black;
}

.navbar-right {
	float: right;
}
</style>

<div class="navbar">
	<c:choose>
		<c:when test="${sessionScope.userid == null}">
			<!-- 로그인하지 않은 사용자를 위한 컨텐츠가 필요하다면 여기에 추가 -->
		</c:when>
		<c:otherwise>
		<div class="logo">
			<a href="/"><img
				src="/resources/images/icon/mainlogo2white.png"
				style="width: 200px; height: auto;"></a>
		</div>
		
			<a href="/board/list.do">공지사항/자주 묻는 질문</a>
			<a href="/admin/list.do">상품목록</a>
			<a href="/admin/write.do">상품등록</a>
			<a href="/admin/event_list.do">이벤트</a>
			<a href="/admin/member_list.do">회원관리</a>
			<a href="/admin/logout.do" class="navbar-right" style ="text-align : center;">로그아웃</a>
			<p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p>
			<p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p>
			<p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p>
			
		</c:otherwise>
	</c:choose>
</div>

<script>
	function list(page) {
		location.href = "/board/list.do?cur_page=" + page
				+ "&search_option=${search_option}&keyword=${keyword}";

	}
</script>

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

</head>

<body class="p-3 m-0 border-0 bd-example m-0 border-0" >
	
	<header>
	
		<div class="adminlogo">
			<a href="/"><img
				src="/resources/images/icon/adminsystem.png"
				style="width: 600px; height: auto; margin: 40px 0 0 283px;"></a>
		</div>

	</header>
	<br><hr style="border: 1px solid rgb(168, 12, 12); margin: 0 0 20px 283px;">
	
	<div class = section1 style = "margin: 0 50px 0 283px;">
	<form name="form1" method="post"
		action="/board/search.do">
		<select name="search_option">
			<c:choose>
				<c:when test="${search_option == null || search_option == 'all'}">
					<option value="all" selected>전체검색</option>
					<option value="subject">제목</option>
					<option value="contents">내용</option>
				</c:when>


				<c:when test="${search_option == 'subject'}">
					<option value="all">전체검색</option>
					<option value="subject" selected>제목</option>
					<option value="contents">내용</option>
				</c:when>
				<c:when test="${search_option == 'contents'}">
					<option value="all">전체검색</option>
					<option value="subject">제목</option>
					<option value="contents" selected>내용</option>
				</c:when>
			</c:choose>
		</select> <input name="keyword" value="${keyword}"> <input
			type="submit" value="확인" id="btnSearch">

		<button type="button" value="글쓰기"
			onclick="location.href='/board/write.do'">글쓰기</button>
	</form>
	<table class="table" border="1">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">제목</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>

		<tbody class="table-group-divider">

			<c:forEach var="dto" items="${list}">
				<tr onclick="location.href='/board/post.do?num=${dto.num}'">
					<td scope="row">${dto.num}</td>
					<td><c:choose>
							<c:when test="${dto.type == 1}">공지사항</c:when>
							<c:when test="${dto.type == 2}">자주 묻는 질문</c:when>
						</c:choose></td>
					<td><a>${dto.subject}</a></td>
					<td>${dto.reg_date.substring(0, 10)}</td>
					<td>${dto.see}</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td colspan="7"><c:if test="${page.curPage > 1}">
						<a href="#" onclick="list('1')">[처음]</a>
					</c:if> <c:if test="${page.curBlock > 1}">
						<a href="#" onclick="list('${page.prevPage}')">[이전]</a>
					</c:if> <c:forEach var="num" begin="${page.blockStart}"
						end="${page.blockEnd}">
						<c:choose>
							<c:when test="${num == page.curPage}">
								<span style="color: red">${num}</span>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="list('${num}')">${num}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${page.curBlock < page.totBlock}">
						<a href="#" onclick="list('${page.nextPage}')">[다음]</a>
					</c:if> <c:if test="${page.curPage < page.totPage}">
						<a href="#" onclick="list('${page.totPage}')">[마지막]</a>
					</c:if></td>
			</tr>
	</table>
	</div>
	
</body>
</html>