<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>修改分享</title>
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
			background-image: url(images-index/bg-3.jpg);
		}
		#operationbox {
			height: 100%;
			width: 50%;
			margin: 0 auto;
			text-align: center;
			background-color: rgba(45, 52, 80,0.5);;
		}
		#editcontent {
			height: 700px;
			width: 70%;
			margin: 0 auto;
			/*background-color: graytext;*/
		}
		#title {
			width: 60%;
			height: 30px;
			text-align: center;
			margin-top: 30px;
		}
		#summary {
			text-align: center;
			width: 80%;
			height: 50px;
			margin-top: 30px;
		}
		#content {
			height: 80px;
			width: 98%;
			margin-top: 5px;
			text-align: center;
		}
		#pic {
			height: 30px;
			width: 100%;
			margin-top: 40px;
			text-align: center;
			/*opacity: 0;*/

		}
		#submit {
			height: 40px;
			width: 80%;
			margin-top: 15px;
			text-align: center;
		}
	</style>
</head>
<body id="body">
	<jsp:include page="header.jsp"/>
	<div id="operation">
		<div id="operationbox">
			<br>
			<h2 style="color:#5DE6E6;">修改文章</h2>
			<hr>
			<div id="editcontent">
				<form action="lvu_update" method="post" enctype="multipart/form-data">
					<input id="user.id" type="hidden" name="user.id" value="${user.id}"/>
					<input id="user.name" type="hidden" name="user.name" value="${user.name}"/>
					<input id="user.permit" type="hidden" name="user.permit" value="${user.permit}"/>
					<!-- 这里如果不传works.id， update.Action将不能从数据库找到要修改的works -->
					<input id="works.id" type="hidden" name="works.id" value="${works.id}"/>
					
					<input id="title" type="text" name="works.title" readonly="readonly" value="${works.title}"/> <br>
					<input id="summary" type="text" name="works.summary" value="${works.summary}"/> <br>
					
					<input id="pic" type="file" name="pic" accept="image/png, image/gif, image/jpg, image/jpeg"/>
					<input id="content" type="text" name="works.content[0]" value="${works.content[0]}"/> <br>
				
					<input id="pic" type="file" name="pic" accept="image/png, image/gif, image/jpg, image/jpeg"/>
					<input id="content" type="text" name="works.content[1]" value="${works.content[1]}"/> <br>
					
					<input id="pic" type="file" name="pic" accept="image/png, image/gif, image/jpg, image/jpeg"/> 
					<input id="content" type="text" name="works.content[2]" value="${works.content[2]}"/> <br>
					
					<input id="submit" type="submit" value="提交"> <br>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>