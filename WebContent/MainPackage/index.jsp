<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- 访问一个action 但是因为我的struts里设置的此action跳转此页面，此时不适用， 会死循环 ， 因此我采用更改struts.xml默认访问url的方法-->
	<!-- /* <meta http-equiv="refresh" content="0;url=worksList.action">*/  -->
	<title>LvU驴友分享网</title>
	<style type="text/css">
		/*对于单独定义超链接颜色，只需要a.name 就可以了，name对应<a class="name">*/
		a.two{color:#00AAAA; text-decoration:none}
		a.two:link{color:#00AAAA}
		a.two:hover{color:#00EEEE; font-style:normal}
		a.two:active{color:red}
		a.two:visited{color:#00AAAA}
		#body {
			margin-left: 3%;
			margin-right: 3%;
			background-color: #EEEEEE;
		}
		
		#mainbox {
			width: 100%;
			height: auto;
			overflow: scroll;
			background-color: #D5D5D5;
		}
		
		#leftbox {
			width: 12%;
			height: 800px;
			float: left;
			margin-left: 3%;
		}
		
		#centerbox {
			width: 60%;
			height: auto;
			float: left; //
			background-color: white;
		}
		
		#rightbox {
			width: 25%;
			height: 500px;
			float: right; //
			background-color: #BDBDFD;
		}
		#cutline {
			height: 20px;
			width: 100%;
			margin-top: 20px;
			border-bottom: 2px solid #3A8328;
		}
		#workshare {
			border-left: 5px solid #3A8328;
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
			background-color: #D5D5D5;
		}
		#divline {
			height: 5px;
			width: 100%;
			margin-top: 10px;
			margin-bottom: 25px;
			/*border-bottom: 3px dashed #666;*/
			border-bottom: 3px dotted #666;
			
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
			background-color: #BBBBFF;
		}
		#works_title {
			height: 20%;
			width: 100%;
			text-align: center;
			line-height: 40px;
			font-size: 30px;
			/*background-color: green;*/
			/*background-color: #919191;*/
		}
		#works_summary {
			height: 55%;
			width: 90%;
			color: #666;
			margin-top: 5%;
			margin-left: 5%;
			margin-right: 5%;
			/*padding-left: 10%;*/
			/*padding-right: 10%;*/
			overflow: hidden;
			/*background-color: red;*/
		}
		#works_tips {
			height: 10%;
			width: 100%;
			color: #666;
			/*background-color: yellow;*/
		}
		#works_author {
			height: 100%;
			width: 35%;
			margin-left: 5%;
			margin-right: 5%;
			text-align: right;
			font-style: oblique;
			font-size: 15px;
			float: left;
			/*background-color: gray;*/
		}
		#works_time {
			height: 100%;
			width: 50%;
			margin-right: 5%;
			text-align: right;
			float: left;
			font-size: 15px;
			font-style: oblique;
			/*background-color: teal;*/
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
<body id="body">
	<jsp:include page="header.jsp" flush="true" />
	<div id="mainbox">
		<div id="leftbox">
			<jsp:include page="leftbox.jsp" flush="true" />
		</div>
		<div id="centerbox">
			<jsp:include page="boxbanner.jsp" flush="true" />
			<jsp:include page="picscroll.jsp" flush="true" />
			<!-- 作品展示 分割线-->
			<div id="cutline">
				<div id="workshare">
					<h4>作品展示</h4>
				</div>
				<div id="search">
					<form action="worksList">
						<input type="hidden" name="user.id" value="${user.id}"/>
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
			<c:forEach items="${worksList }" var="works">
				<div id="works">
					<!-- 这个图片自适应这个问题真的是很烦，之前在scroll.jsp页面处理好了，但是突然又忘记了，事实证明该长点脑子 -->
					<!-- 发现在img标签里指定height ，他就会自动缩放  适应父div， 以后长个脑子吧-->

					<!-- <div id="works_pic"><img height="100%" src="${works.pic[0]}"/></div> -->
					<div id="works_pic"><img src="./images-clock/bg.png" height="100%" width="100%" /></div>
					<div id="works_inf">
						<div id="works_title"><a class="two" href="worksDetail.action?works.title=${works.title}&user.id=${user.id}">【${works.title}】</a></div>
						<div id="works_summary">${works.summary}梗概</div>
						<div id="works_tips">
							<div id="works_author"><a class="two" href="#">作者：${works.authorName}</a></div>
							<div id="works_time">时间：${works.time}</div>
						</div>
					</div>
				</div>
				<div id="divline"></div>
			</c:forEach>
			<div id="pageCount">
				<div id="pageBtn"><a class="one" href="worksList.action?pageNum=1&key=${key}&user.id=${user.id}">首页</a></div>
				<div id="pageBtn"><a class="one" href="worksList.action?pageNum=${pageNo>1 ? pageNo-1 : 1}&key=${key}&user.id=${user.id}">上一页</a></div>
				<div id="pageBtn">${pageNo}/ ${pageCount}</div>
				<div id="pageBtn"><a class="one" href="worksList.action?pageNum=${pageNo<pageCount ? pageNo+1 : pageCount }&key=${key}&user.id=${user.id}">下一页</a></div>
				<div id="pageBtn"><a class="one" href="worksList.action?pageNum=${pageCount }&key=${key}&user.id=${user.id}">末页</a></div>
			</div>
		</div>
		<div id="rightbox">
			<jsp:include page="rightbox.jsp" flush="true" />
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>