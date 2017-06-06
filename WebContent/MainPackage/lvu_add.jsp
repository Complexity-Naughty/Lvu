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
			background-image: url(images-index/bg-3.jpg);
		}
		#operationbox {
			height: 100%;
			width: 50%;
			margin: 0 auto;
			text-align: center;
			background-color: rgba(45, 52, 80,0.5);;
		}
		#addcontent {
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
		#type {
			width: 40%;
			height: 20px;
			text-align: center;
			margin-top: 10px;
		}
		#summary {
			text-align: center;
			width: 80%;
			height: 50px;
			margin-top: 10px;
		}
		#content {
			height: 80px;
			width: 98%;
			margin-top: 20px;
			text-align: center;
		}
		#pic {
			height: 30px;
			width: 100%;
			margin-top: 10px;
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
			<h2 style="color:#5DE6E6;">添加文章</h2>
			<hr>
			<div id="addcontent">
				<form action="lvu_add" method="post" enctype="multipart/form-data">
					<input id="user.id" type="hidden" name="user.id" value="${user.id}"/>
					<input id="user.name" type="hidden" name="user.name" value="${user.name}"/>
					<input id="user.permit" type="hidden" name="user.permit" value="${user.permit}"/>
					
					<input id="title" type="text" name="works.title" placeholder="标题"/> <br>
					<select id="type" name="works.type">
						<option value="all">游首页</option>
						<option value="local">国内游</option>
						<option value="aboard">国外游</option>
						<option value="scenery">风景游</option>
						<option value="food">美食游</option>
						<option value="notes">日记游</option>
					</select>
					<input id="summary" type="text" name="works.summary" placeholder="摘要"/> <br>
					
					<input id="pic" type="file" name="pic" accept="image/png, image/gif, image/jpg, image/jpeg"/>
					<input id="content" type="text" name="works.content[0]" placeholder="请输入第1段说明文字"/> <br>
				
					<input id="pic" type="file" name="pic" accept="image/png, image/gif, image/jpg, image/jpeg"/>
					<input id="content" type="text" name="works.content[1]" placeholder="请输入第2段说明文字"/> <br>
					
					<input id="pic" type="file" name="pic" accept="image/png, image/gif, image/jpg, image/jpeg"/> 
					<input id="content" type="text" name="works.content[2]" placeholder="请输入第3段说明文字"/> <br>
					
					<input id="submit" type="submit" value="提交"> <br>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>