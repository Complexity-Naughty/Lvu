<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>添加分享</title>
	<style type="text/css">
		#body {
			height: 800px;
			margin: 0 auto;
			margin-left: 3%;
			margin-right: 3%;
		}
		#operation {
			height: 100%;
			width: 100%;
			margin: 0 auto;
			margin-top: 2%;
			margin-bottom: 2%;
			background-color: blue;
		}
		#operationbox {
			height: 100%;
			width: 50%;
			margin: 0 auto;
			text-align: center;
			background-color: fuchsia;
		}
		#addcontent {
			height: 90%;
			width: 70%;
			margin: 0 auto;
			background-color: graytext;
		}
		#content {
			height: 60px;
			width: 98%;
		}
		#content {
			height: 80px;
			width: 98%;
		}
		#pic {
			height: 30px;
			width: 100%;
		}
		#submit {
			height: 40px;
			width: 100%;
		}
	</style>
</head>
<body id="body">
	<jsp:include page="header.jsp"/>
	<div id="operation">
		<div id="operationbox">
			<br>
			<h4>添加文章</h4>
			<hr>
			<div id="addcontent">
				<s:form action="lvu_add" method="post" enctype="multipart/form-data">
					<s:hidden id="user.id" name="user.id" value="%{user.id}"/>
					<s:hidden id="user.name" name="user.name" value="%{user.name}"/>
					<s:hidden id="user.permit" name="user.permit" value="%{user.permit}"/>
					
					<s:textfield id="title" name="works.title" label="标题"/>
					
					<s:textarea id="summary" name="works.summary" label="纲要"/>
					
					<s:textarea id="content" name="works.content[0]" label="内容1"/>
					<s:file id="pic" name="pic" label="图片1" accept="image/png, image/gif, image/jpg"/>
					
					<s:textarea id="content" name="works.content[1]" label="内容2"/>
					<s:file id="pic" name="pic" label="图片2" accept="image/png, image/gif, image/jpg"/>
					
					<s:textarea id="content" name="works.content[2]" label="内容2"/>
					<s:file id="pic" name="pic" label="图片3" accept="image/png, image/gif, image/jpg"/>
					<s:submit id="submit" value="提交"/>
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>