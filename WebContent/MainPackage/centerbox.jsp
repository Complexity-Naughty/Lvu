<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Content</title>
	<style type="text/css">
	
		a{color:#999; text-decoration:none}
		a:link{color:#999}
		a:hover{color:red}
		a:active{color:#999}
		
		#cutline {
			height: 20px;
			width: 100%;
			margin-top: 20px;
			border-bottom: 2px solid #999;
		}
		#workshare {
			border-left: 5px solid #999;
			height: 100%;
			width: 60%;
			float: left;
			font-style: italic;
			font-color: #999;
		}
		#search {
			float:right;
			margin-right: 20px;
		}
		#works {
			width: 100%;
			height: 200px;
			margin-top: 2%;
			background-color: blue;
		}
		#works_pic {
			height: 100%;
			width: 30%;
			float: left;
			background-color: black;
		}
		#works_inf {
			height: 100%;
			width: 70%;
			float: left;
		}
		#works_title {
			height: 20%;
			width: 100%;
			text-align: center;
			line-height: 40px;
			font-size: 25px;
			background-color: green;
		}
		#works_summary {
			height: 70%;
			width: 100%;
			background-color: red;
		}
		#works_tips {
			height: 10%;
			width: 100%;
			color: #666;
			background-color: yellow;
		}
		#works_author {
			height: 100%;
			width: 45%;
			margin-left: 5%;
			text-align: right;
			float: left;
			background-color: gray;
		}
		#works_time {
			height: 100%;
			width: 50%;
			text-align: right;
			float: left;
			background-color: teal;
		}
		#pageCount {
			width: 80%;
			height: 20px;
			magin-top: 40px;
			margin-left: 10%;
			margin-right: 10%;
			text-align: center;
			
		}
		#pageBtn {
			width: 16%;
			float: left;
			border-top: 1px solid #666;
			border-left: 1px solid #666;
			border-right: 1px solid #666;
			border-bottom: 1px solid #666;
		}
	</style>
</head>
<body>
	<jsp:include page="boxbanner.jsp" flush="true"/>
	<jsp:include page="picscroll.jsp" flush="true"/>
	<!-- 作品展示 分割线-->
	<div id="cutline">
		<div id="workshare"><h4>作品展示</h4></div>
		<div id="search">
			<form action="worksList">
				<s:if test="key == null">
					<input id="key" name="key" placeholder="请输入查找内容" height="100%">
				</s:if>
				<s:else>
					<input id="key" name="key" value="${key}" height="100%">
				</s:else>
				<input id="submit" type="submit" value="查找">
			</form>
		</div>
	</div>
	<!-- 作品展示 -->
	<s:action name="worksList" namespace="/MainPackage"/>
	<c:forEach items="${worksList }" var="works">
		<div id="works">
			<!-- 这个图片自适应这个问题真的是很烦，之前在scroll.jsp页面处理好了，但是突然又忘记了，事实证明该长点脑子 -->
			<!-- 发现在img标签里指定height ，他就会自动缩放  适应父div， 以后长个脑子吧-->
			
				<!-- <div id="works_pic"><img height="100%" src="${works.pic[0]}"/></div> --> 
				<div id="works_pic"> <img src="./images-clock/bg.png" height="100%" width="100%"/> </div> 
				<div id="works_inf">
					<div id="works_title"> <a href="#">【${works.title}】</a> </div>
					<div id="works_summary">${works.summary}梗概</div>
					<div id="works_tips">
						<div id="works_author">作者：${works.authorName}</div>
						<div id="works_time">时间：${works.time}</div>
					</div>
				</div>
		</div>
	</c:forEach>
	<div id="pageCount">
		<div id="pageBtn"><a href="worksList.action?pageNum=1">首页</a></div>
		<div id="pageBtn"><a href="worksList.action?pageNum=${pageNo>1 ? pageNo-1 : 1}">上一页</a></div>
		<div id="pageBtn">${pageNo} / ${pageCount}</div>
		<div id="pageBtn"><a href="worksList.action?pageNum=${pageNo<pageCount ? pageNo+1 : pageCount }">下一页</a></div>
		<div id="pageBtn"><a href="worksList.action?pageNum=${pageCount }">末页</a></div>
	</div>
	
</body>
</html>