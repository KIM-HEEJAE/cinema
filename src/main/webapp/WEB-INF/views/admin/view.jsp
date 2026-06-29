<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="viewport" content="width=1024" />
<meta name="keywords"
	content="CGV, 시지브이, 영화관, 극장, 영화, 티켓, 박스오피스, 극장, Movie, Theater, Cinema, Cgv, cgv, 예매, 상영작" />
<meta name="description"
	content="영화 그 이상의 다양하고 즐거운 몰입의 경험을 만듭니다. 라이프스타일 플랫폼 CGV" />
<meta property="og:site_name" content="영화 그 이상의 감동. CGV" />
<meta id="ctl00_og_title" property="og:title"
	content="기프트샵 &lt; 기프트샵 | 영화 그 이상의 감동. CGV"></meta>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../include/admin_menu.jsp"%>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품명</td>
				<td><input name="product_name" value="${dto.product_name}"></td>
			</tr>
			<tr>
				<td>상품분류</td>
				<td><select id="product_type" name="product_type">
						<option value="0" ${dto.product_type == 0 ? 'selected' : ''}>분류</option>
						<option value="1" ${dto.product_type == 1 ? 'selected' : ''}>팝콘</option>
						<option value="2" ${dto.product_type == 2 ? 'selected' : ''}>음료</option>
						<option value="3" ${dto.product_type == 3 ? 'selected' : ''}>스낵</option>
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${dto.price}"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" name="description">${dto.description}</textarea></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><img src="/cinema/images/${dto.filename}" width="300px"
					height="300px"> <br> <input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="hidden"
					name="product_code" value="${dto.product_code}"> <input
					type="button" value="수정" onclick="update_product()"> <input
					type="button" value="목록"
					onclick="location.href='/cinema/product_servlet/list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>