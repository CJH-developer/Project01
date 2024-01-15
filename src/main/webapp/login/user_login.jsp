<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="../css_user/user_login.css?after">
</head>
<body>
	<div class="background">
		<div class="outerbox">
			<div class="wrapper">
				<div class="wrapper__header">
					<div class="header__title">로그인</div>
				</div>
				<form action="loginForm.user" method="post" class="wrapper_form">
					<div class="wrapper__body">
						<input type="text" class="body_input" name="id" placeholder="아이디를 입력하세요." >
						<input type="password" class="body_input" name="pw" placeholder="비밀번호를 입력하세요." >
					</div>
					<div class="wrapper__footer">
						<div class="footer__button">
							<button class="join_button" type="submit" value="로그인">로그인</button>
							<a href="${pageContext.request.contextPath }/login/join.user">
								<button class="join_button" type="button" value="회원가입" >회원가입</button>
							</a>
						</div>
						<div class="wrapper__footer__title">Copyright &copy; By Choi 2024.XX.XX~</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>