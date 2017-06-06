<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Header</title>
	<style type="text/css">
		a.one{color:#999; text-decoration:none}
		a.one:link{color:#999}
		a.one:hover{color:red}
		a.one:active{color:#999}
		a.one:visited{color:#999}
	
		#head {
			font-size: 12px;
			height: 20px;
			width: 100%;
	
			border-bottom: 10px solid #666;
			margin-bottom: 10px;
		}
		#user {
			float: left;
		}
		#minimap {
			float: right;
			height: 100%;
		}
	</style>
</head>
<body>
	<div id="head">
		<s:if test="user != null && logined">
			<div id="user">
				<a class="one" href="person.action?id=${user.id}"> <s:property value="user.name"/>, 欢迎您</a>
			</div>
		</s:if>
		<s:else>
			<div id="user">
				<a class="one" href="login.jsp">[亲，请登录]</a>
				&nbsp;&nbsp;
				<a class="one" href="login.jsp">[免费注册]</a>
			</div>
		</s:else>
		
		<div id="minimap">
			<img src="images-index/user.png"><a class="one" href="index.action">驴友主页</a>&nbsp;
			<img src="images-index/user.png"><a class="one" href="">个人中心</a>&nbsp;
			<img src="images-index/user.png"><a class="one" href="index.action">驴友作品</a>&nbsp;
		</div>
	</div>
</body>
</html>