<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 호출</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/call.css?after">
<script src="${pageContext.request.contextPath }/js/drag.js"></script>

</head>
<body>
	<div class="wrapper">
		<div class="wrapper__left">
			<div class="wrapper__left__body">
				<div class="left__body__call" draggable="true" id="a">냅킨</div>
				<div class="left__body__call" draggable="true" id="a">물티슈</div>
				<div class="left__body__call" draggable="true" id="a">물 리필</div>
				<div class="left__body__call" draggable="true" id="a">얼음</div>
				<div class="left__body__call" draggable="true" id="a">기본안주리필</div>
			</div>
			<div class="wrapper__left__body">
				<div class="left__body__call" draggable="true">젓가락</div>
				<div class="left__body__call" draggable="true">앞접시</div>
				<div class="left__body__call" draggable="true">국그릇</div>
				<div class="left__body__call" draggable="true">이쑤시개</div>
				<div class="left__body__call" draggable="true">유아 식기</div>
			</div>
			<div class="wrapper__left__body">
				<div class="left__body__call" draggable="true">담요</div>
				<div class="left__body__call" draggable="true">핸드폰충전</div>
				<div class="left__body__call" draggable="true">테이블정리</div>
				<div class="left__body__call" draggable="true">포장</div>
				<div class="left__body__call" draggable="true">결제</div>
			</div>
		</div>
		<div class="wrapper__right">
			<div class="wrapper__body">
				<div class="wrapper__right__header" id="wrapper__right__id" ondrop="drop(event)" ondragover="allowDrop(event)" >주문목록</div>
				<div class="wrapper__right__divideLine"></div>
				<div class="wrapper__right__footer">호출하기</div>
			</div>
		</div>
	</div>
</body>
</html>