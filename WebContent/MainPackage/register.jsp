<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>LvU驴友分享网</title>
	<style type="text/css">
		#body {
			height: 400px;
			width: 100%;
			margin: 0 auto;
		}
		#register {
			height: 100%;
			width: 100%;
			margin-top: 5%;
			margin-bottom: 5%;
			background-color: blue;
		}
		#registerbox {
			height: 100%;
			width: 30%;
			margin-left: 35%;
			margin-right: 35%;
			text-align: center;
			background-color: fuchsia;
		}
	</style>
</head>
<body id="body">
	<jsp:include page="header.jsp"/>
	<div id="register">
		<div id="registerbox">
			<s:actionerror/>
			<s:form action="register" method="post">
				<s:textfield id="name" name="user.name" label="用户名"/>
				<s:password id="password" name="user.password" label="密码"/>
				<s:password id="repassword" name="repassword" label="确认密码"/>
				<s:submit value="注册" align="center"/>
			</s:form>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>