<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>文章详细</title>
	<style type="text/css">
		#body {
			height: 900px;
			margin: 0 auto;
			margin-left: 3%;
			margin-right: 3%;
		}
		#mainbox {
			width: 100%;
			height: auto;
			overflow: scroll;
			//background-image: url(./images-index/bg-3.jpg);
			background-color: silver;
		}
		#mainEassay {
			width: 80%;
			height: auto;
			margin: 0 auto;
			text-align: center;
			background-color: rgba(255,255,255,0.3);
		}
		#butn {
			color: #999
			height: 100px;
			width: 100%;
			font-style: oblique;
			font-size: 15px;
			background-color: red;
		}
		#edit {
			width: 40px;
			float: left;
		}
		#delete {
			width: 40px;
			float: right;
		}
		#title {
			height: 40px;
			width: 100%;
			padding-top: 50px;
			text-align: center;
			font-style:oblique;
			font-size: 40px;
		}
		#tips {
			height: 20px;
			width: 100%;
			font-style: oblique;
			font-size: 15px;
			margin-top: 20px;
			color: #999;
		}
		#summary {
			height: auto;
			width: 90%;
			margin-left: 5%;
			margin-right: 5%;
			margin-top: 20px;
			margin-bottom: 40px;
		}
		#time {
			width: 35%;
			margin-right: 15%;
			text-align: right;
			height: 100%;
			float: left;
		}
		#author {
			width: 35%;
			height: 100%;
			margin-right: 15%;
			text-align: right;
			float: left;
		}
		#content {
			height: auto;
			width: 100%;
		}
		#pic {
			height: 300px;
			width: 60%;
			margin-left: 20%;
			margin-right: 20%;
			text-align: center;
		}
		#text {
			height: auto;
			width: 90%;
			margin-top: 20px;
			margin-left: 5%;
			margin-right: 5%;
		}
	</style>
</head>
<body id="body">
	<jsp:include page="header.jsp"/>
	<div id="mainbox">
		<div id="mainEassay">
			<s:if test="user.name == works.authorName">
				<div id="butn">
					<div id="edit"><a class="one" href="lvu_edit.action?works.id=${works.id}&user.id=${user.id}">编辑</a></div>
					<div id="delete"><a class="one" href="lvu_delete.action?works.id=${works.id}&user.id=${user.id}">删除</a></div>
				</div>
			</s:if>
			<div id="title">${works.title}</div>
			<div id="tips">
				<div id="time">发表时间：${works.time}</div>
				<div id="author">作者：${works.authorName}</div>
			</div>
			<div id="summary">${works.summary}</div>
			
			<div id="clear"></div>
			
			<div id="content">
				<div id="pic"><img src="./images-index/bg-3.jpg" height="100%" width="100%"></div>
				<div id="text">${works.content[0]}</div>
			</div>
			<div id="content">
				<div id="pic"><img src="${works.pic[1]}" height="100%" width="100%"></div>
				<div id="text">${works.content[1]}</div>
			</div>
			<div id="content">
				<div id="pic"><img src="${works.pic[2]}" height="100%" width="100%"></div>
				<div id="text">${works.content[2]}</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>