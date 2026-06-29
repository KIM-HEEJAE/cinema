<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 20px;
    }
    h2 {
        color: #007bff;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }
    td, th {
        border: 1px solid #dee2e6;
        text-align: left;
        padding: 8px;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    td {
        background-color: #ffffff;
    }
</style>
<script>
	// 이 함수는 페이지가 로드될 때 실행됩니다.
	function displayMemberGrade() {
		// 회원의 구매액을 예시로 설정합니다. 실제 애플리케이션에서는 서버로부터 받아온 데이터를 사용하게 될 것입니다.
		var buyAmount = ${dto.buy}
		; // 이 부분은 서버로부터 받아온 실제 구매액으로 대체해야 합니다.

		var grade = ""; // 회원 등급을 저장할 변수

		// 구매액에 따른 회원 등급을 결정
		if (buyAmount >= 0 && buyAmount < 100000) {
			grade = "일반";
		} else if (buyAmount >= 100000 && buyAmount < 200000) {
			grade = "브론즈";
		} else if (buyAmount >= 200000 && buyAmount < 300000) {
			grade = "실버";
		} else if (buyAmount >= 300000) {
			grade = "골드";
		}

		// 회원 등급을 표시할 HTML 요소를 찾아서 등급을 업데이트합니다.
		document.getElementById("memberGrade").innerHTML = grade;
	}
</script>
</head>
<body onload="displayMemberGrade()">
	<h2>${dto.name}님의회원정보</h2>
	<table>
		<tr>
			<td>아이디</td>
			<td>${dto.userid}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${dto.pwd1}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${dto.birth}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${dto.addr1}</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${dto.addr2}</td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td>${dto.join_date}</td>
		</tr>
		<tr>
			<td>회원등급</td>
			<td id="memberGrade"></td>
		</tr>
		<tr>
				<td colspan="2" align="center"> <input
					type="button" value="목록"
					onclick="location.href='/admin/member_list.do'">
				</td>
			</tr>
	</table>
</body>
</html>