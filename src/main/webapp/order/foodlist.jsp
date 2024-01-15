<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foodlist.css?after">
</head>
<body>
	<div class="background">
		<div class="outerbox">
			<form action="deleteForm.food" method="post" class="wrapper">
				<div class="wrapper__left">
					<div class="wrapper__left__top">
						<div class="left__top__title">
							<div class="top__title__name"><a href="${pageContext.request.contextPath }/order/main.jsp">메뉴선택</a></div>
						</div>
						<div class="left__top__button">
							<button type="submit" class="top_button" >주문하기</button>
						</div>
					</div>
					<div class="divideLine"></div>
					<div class="wrapper__left__bottom"></div>
				</div>
				<div class="wrapper__right">
					<div class="wrapper__right__title">Order List</div>
					<div class="wrapper__right__table">
						<table class="right__table">
							<thead>
								<tr>
									<th>번 호</th>
									<th>상 품 명</th>
									<th>가 격</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="vo" items="${list }">
								<tr>
								    <td>${vo.order_Num }</td>
								    <td>${vo.food_Name }</td>
								    <td>${vo.order_Price }</td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>
					</div>
					<div class="wrapper__right__cost" style="font-size: 25px; font-weight: bold; color: red;">
						결제 금액 : 
						<c:set var="total" value="0"/>
						<fmt:formatNumber var="total" value="${total }"/>
						
						<c:forEach var="vo" items="${list }">
							<fmt:parseNumber var="num" value="${vo.order_Price}" />
							<fmt:parseNumber var="total" value="${total + num }" />
						</c:forEach>
						<c:out value="${total }"/> 
					</div>
					<div class="wrapper__right__bottom">Copyright &copy; By Choi 2024.XX.XX~</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>