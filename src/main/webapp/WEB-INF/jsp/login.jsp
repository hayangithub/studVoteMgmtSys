<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Login Register | Notika - Notika Admin Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon
		============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/bootstrap.min.css" />">
<!-- font awesome CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/font-awesome.min.css"/>">
<!-- owl.carousel CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/owl.carousel.css"/>">
<link rel="stylesheet"
	href="<c:url value="/static/css/owl.theme.css"/>">
<link rel="stylesheet"
	href="<c:url value="/static/css/owl.transitions.css"/>">
<!-- animate CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/animate.css"/>">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/normalize.css"/>">
<!-- mCustomScrollbar CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/scrollbar/jquery.mCustomScrollbar.min.css"/>">
<!-- wave CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/wave/waves.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/static/css/wave/button.css"/>">
<!-- Notika icon CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/notika-custom-icon.css"/>">
<!-- main CSS
		============================================ -->
<link rel="stylesheet" href="<c:url value="/static/css/main.css"/>">
<!-- style CSS
		============================================ -->
<link rel="stylesheet" href="<c:url value="/static/style.css"/>">
<!-- responsive CSS
		============================================ -->
<link rel="stylesheet"
	href="<c:url value="/static/css/responsive.css"/>">
<!-- modernizr JS
		============================================ -->
<script
	src="<c:url value="/static/js/vendor/modernizr-2.8.3.min.js"/>"></script>

<style>
.btn-login {
	background-color: #00c292;
	border: none;
	color: white;
	padding: 8px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.btn-login:hover {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Login Register area Start-->
	<div class="login-content">
		<!-- Login -->
		<div class="nk-block toggled" id="l-login">
			<form:form id="loginForm"
				action="${pageContext.request.contextPath}/dashboard" method="POST" modelAttribute="admin">
				<div class="nk-form">
				<c:if test="${not empty errorMessage}">
				   <div class="input-group">
						<div class="nk-int-st">
							<p style="color:red;font-weight:bold;font-size:14px;"> <c:out value="${errorMessage}"/> </p>
						</div>
					</div>
				</c:if>
				
					<div class="input-group">
						<span class="input-group-addon nk-ic-st-pro"><i
							class="notika-icon notika-support"></i></span>
						<div class="nk-int-st">
							<input type="text" name="email" value="${admin.email}" class="form-control"
								placeholder="Username">
						</div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i
							class="notika-icon notika-edit"></i></span>
						<div class="nk-int-st">
							<input type="password" name="password"
								class="form-control" placeholder="Password">
						</div>
					</div>
					<div class="fm-checkbox">
						<label><input type="checkbox" class="i-checks"> <i></i>
							Keep me signed in</label>
					</div>
					<br> <input type="submit" class="btn-login" value="Submit" />

				</div>
			</form:form>
			<div class="nk-navigation nk-lg-ic">
				<a href="#" data-ma-action="nk-login-switch"
					data-ma-block="#l-register"><i
					class="notika-icon notika-plus-symbol"></i> <span>Register</span></a> <a
					href="#" data-ma-action="nk-login-switch"
					data-ma-block="#l-forget-password"><i>?</i> <span>Forgot
						Password</span></a>
			</div>
		</div>

		<!-- Register -->
		<div class="nk-block" id="l-register">
			<div class="nk-form">
				<div class="input-group">
					<span class="input-group-addon nk-ic-st-pro"><i
						class="notika-icon notika-support"></i></span>
					<div class="nk-int-st">
						<input type="text" class="form-control" placeholder="Username">
					</div>
				</div>

				<div class="input-group mg-t-15">
					<span class="input-group-addon nk-ic-st-pro"><i
						class="notika-icon notika-mail"></i></span>
					<div class="nk-int-st">
						<input type="text" class="form-control"
							placeholder="Email Address">
					</div>
				</div>

				<div class="input-group mg-t-15">
					<span class="input-group-addon nk-ic-st-pro"><i
						class="notika-icon notika-edit"></i></span>
					<div class="nk-int-st">
						<input type="password" class="form-control" placeholder="Password">
					</div>
				</div>

				<a href="#l-login" data-ma-action="nk-login-switch"
					onclick="loginSubmit()" data-ma-block="#l-login"
					class="btn btn-login btn-success btn-float"><i
					class="notika-icon notika-right-arrow"></i></a>
			</div>

			<div class="nk-navigation rg-ic-stl">
				<a href="#" data-ma-action="nk-login-switch"
					data-ma-block="#l-login"><i
					class="notika-icon notika-right-arrow"></i> <span>Sign in</span></a> <a
					href="" data-ma-action="nk-login-switch"
					data-ma-block="#l-forget-password"><i>?</i> <span>Forgot
						Password</span></a>
			</div>
		</div>

		<!-- Forgot Password -->
		<div class="nk-block" id="l-forget-password">
			<div class="nk-form">
				<p class="text-left">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla
					enim feugiat commodo sed ac lacus.</p>

				<div class="input-group">
					<span class="input-group-addon nk-ic-st-pro"><i
						class="notika-icon notika-mail"></i></span>
					<div class="nk-int-st">
						<input type="text" class="form-control"
							placeholder="Email Address">
					</div>
				</div>

				<a href="#l-login" data-ma-action="nk-login-switch"
					data-ma-block="#l-login"
					class="btn btn-login btn-success btn-float"><i
					class="notika-icon notika-right-arrow"></i></a>
			</div>

			<div class="nk-navigation nk-lg-ic rg-ic-stl">
				<a href="" data-ma-action="nk-login-switch" data-ma-block="#l-login"><i
					class="notika-icon notika-right-arrow"></i> <span>Sign in</span></a> <a
					href="" data-ma-action="nk-login-switch"
					data-ma-block="#l-register"><i
					class="notika-icon notika-plus-symbol"></i> <span>Register</span></a>
			</div>
		</div>
	</div>
	<!-- Login Register area End-->
	<!-- jquery
		============================================ -->
	<script
		src="<c:url value="/static/js/vendor/jquery-1.12.4.min.js"/>"></script>
	<!-- bootstrap JS
		============================================ -->
	<script src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
	<!-- wow JS
		============================================ -->
	<script src="<c:url value="/static/js/wow.min.js"/>"></script>
	<!-- price-slider JS
		============================================ -->
	<script src="<c:url value="/static/js/jquery-price-slider.js"/>"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script src="<c:url value="/static/js/owl.carousel.min.js"/>"></script>
	<!-- scrollUp JS
		============================================ -->
	<script src="<c:url value="/static/js/jquery.scrollUp.min.js"/>"></script>
	<!-- meanmenu JS
		============================================ -->
	<script
		src="<c:url value="/static/js/meanmenu/jquery.meanmenu.js"/>"></script>
	<!-- counterup JS
		============================================ -->
	<script
		src="<c:url value="/static/js/counterup/jquery.counterup.min.js"/>"></script>
	<script src="<c:url value="/static/js/counterup/waypoints.min.js"/>"></script>
	<script
		src="<c:url value="/static/js/counterup/counterup-active.js"/>"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script
		src="<c:url value="/static/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"/>"></script>
	<!-- sparkline JS
		============================================ -->
	<script
		src="<c:url value="/static/js/sparkline/jquery.sparkline.min.js"/>"></script>
	<script
		src="<c:url value="/static/js/sparkline/sparkline-active.js"/>"></script>
	<!-- flot JS
		============================================ -->
	<script src="<c:url value="/static/js/flot/jquery.flot.js"/>"></script>
	<script src="<c:url value="/static/js/flot/jquery.flot.resize.js"/>"></script>
	<script src="<c:url value="/static/js/flot/flot-active.js"/>"></script>
	<!-- knob JS
		============================================ -->
	<script src="<c:url value="/static/js/knob/jquery.knob.js"/>"></script>
	<script src="<c:url value="/static/js/knob/jquery.appear.js"/>"></script>
	<script src="<c:url value="/static/js/knob/knob-active.js"/>"></script>
	<!--  Chat JS
		============================================ -->
	<script src="<c:url value="/static/js/chat/jquery.chat.js"/>"></script>
	<!--  wave JS
		============================================ -->
	<script src="<c:url value="/static/js/wave/waves.min.js"/>"></script>
	<script src="<c:url value="/static/js/wave/wave-active.js"/>"></script>
	<!-- icheck JS
		============================================ -->
	<script src="<c:url value="/static/js/icheck/icheck.min.js"/>"></script>
	<script src="<c:url value="/static/js/icheck/icheck-active.js"/>"></script>
	<!--  todo JS
		============================================ -->
	<script src="<c:url value="/static/js/todo/jquery.todo.js"/>"></script>
	<!-- Login JS
		============================================ -->
	<script src="<c:url value="/static/js/login/login-action.js"/>"></script>
	<!-- plugins JS
		============================================ -->
	<script src="<c:url value="/static/js/plugins.js"/>"></script>
	<!-- main JS
		============================================ -->
	<script src="<c:url value="/static/js/main.js"/>"></script>
	<script>
		
	</script>
</body>

</html>