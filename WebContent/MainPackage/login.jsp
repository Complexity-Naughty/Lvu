<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>驴友之家欢迎您</title>
	<script src="js/jquery-2.2.4.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$(".form").slideDown(500);
			
			$("#landing").addClass("border-btn");

			$("#registered").click(function() {
				$("#landing").removeClass("border-btn");
				$("#landing-content").hide(500);
				$(this).addClass("border-btn");
				$("#registered-content").show(500);
				
			})

			$("#landing").click(function() {
				$("#registered").removeClass("border-btn");
				$(this).addClass("border-btn");
				
				$("#landing-content").show(500);
				$("#registered-content").hide(500);
			})
		});
	</script>
	<style>
		* {
			margin:  0 auto;
			padding: 0;
			font-family: "微软雅黑";
		}
		
		body {
			height: 500px;
			/*background: #F7F7F7;*/
			margin-left: 3%;
			margin-right: 3%;
		}
		#content {
			height: 500px;
			/*background-color: silver;*/
			background: url(images-index/bg-3.jpg);
		}
		
		.form {
			position: absolute;
			top: 50%;
			left: 50%;
			margin-left: -185px;
			margin-top: -15%;
			height: 420px;
			width: 340px;
			font-size: 18px;
			-webkit-box-shadow: 0px 0px 10px #A6A6A6;
			background: rgba(45,80,20,0.5);
		}
		
		.border-btn {
			border-bottom: 1px solid #ccc;
		}
		
		#landing,
		#registered {
			float: left;
			text-align: center;
			width: 170px;
			padding: 15px 0;
			/*color: #545454;*/
			color: #999;
		}
		
		#landing-content {
			clear: both;
		}
		
		.inp {
			height: 30px;
			margin: 0 auto;
			margin-bottom: 30px;
			width: 200px;
		}
		
		.inp>input {
			text-align: center;
			height: 30px;
			width: 200px;
			margin: 0 auto;
			transition: all 0.3s ease-in-out;
		}
		
		.login {
			border: 1px solid #A6A6A6;
			color: #a6a6a6;
			height: 30px;
			width: 202px;
			text-align: center;
			font-size: 13.333333px;
			margin-left: 70px;
			line-height: 30px;
			margin-top: 30px;
			transition: all 0.3s ease-in-out;
		}
		
		.login:hover {
			background: #A6A6A6;
			color: #fff;
		}
		
		#bottom {
			margin-top: 30px;
			font-size: 13.333333px;
			color: #a6a6a6;
		}
		
		#registeredtxt {
			float: left;
			margin-left: 80px;
		}
		
		#forgotpassword {
			float: right;
			margin-right: 80px;
		}
		
		#photo {
			border-radius: 80px;
			border: 1px solid #ccc;
			height: 80px;
			width: 80px;
			margin: 0 auto;
			overflow: hidden;
			clear: both;
			margin-top: 30px;
			margin-bottom: 30px;
		}
		
		#photo>img:hover {
			-webkit-transform: rotateZ(360deg);
			-moz-transform: rotateZ(360deg);
			-o-transform: rotateZ(360deg);
			-ms-transform: rotateZ(360deg);
			transform: rotateZ(360deg);
		}
		
		#photo>img {
			height: 80px;
			width: 80px;
			-webkit-background-size: 220px 220px;
			border-radius: 60px;
			-webkit-transition: -webkit-transform 1s linear;
			-moz-transition: -moz-transform 1s linear;
			-o-transition: -o-transform 1s linear;
			-ms-transition: -ms-transform 1s linear;
		}
		
		
		#registered-content {
			margin-top: 40px;
			display: none;
		}
		
		.fix {
			clear: both;
		}
		.form{
			display: none;
		}
	</style>
</head>

<body>
	<jsp:include page="header.jsp"/>
	<div id="content">
		<div class="form">
			<div id="landing">登陆</div>
			<div id="registered">注册</div>
			<div class="fix"></div>
			<div id="landing-content">
				<form action="login" method="post">
					<div class="inp"><s:actionerror/></div>
					<div id="photo"><img src="images-index/photo.jpg" /></div>
					<div class="inp"><input type="text" placeholder="用户名" name="user.name"/></div>
					<div class="inp"><input type="password" placeholder="密码" name="user.password"/></div>
					<input class="login" type="submit" value="登陆"/>
				</form>
			</div>
			<div id="registered-content">
				<form action="register"method="post">
					<div class="inp"><s:actionerror/></div>
					<div class="inp"><input type="text" placeholder="请输入用户名" name="user.name"/></div>
					<div class="inp"><input type="password" placeholder="请输入密码" name="user.password"/></div>
					<div class="inp"><input type="password" placeholder="请再次输入密码" name="repassword"/></div>
					<input class="login" type="submit" value="立即注册"/>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>

</html>