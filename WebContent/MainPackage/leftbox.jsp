<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Leftbox</title>
	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script> -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			function staticNav() { 
				var sidenavHeight = $("#sidenav").height();
				var winHeight = $(window).height();
				var browserIE6 = (navigator.userAgent.indexOf("MSIE 6")>=0) ? true : false;
				if (browserIE6) {
					$("#sidenav").css({'position' : 'absolute'});
				} else {
					$("#sidenav").css({'position' : 'fixed'});
				}
			}
			staticNav();
			$(window).resize(function () { 
				staticNav();
			});
		});
	</script>
	<style type="text/css">
		#body {
			
		}

		#sidenav {
			margin-top: 3%;
			height: 370px;
			width: 9%;
			/*background: url(images-index/banner0.jpg);*/
		}
	
		#bannerline {
			height: 25px;
			width: 110px;
			margin-top: 20px;
			margin-bottom: 5px;
			border-bottom: 3px solid #999;
		}
		#bannertitle {
			border-left: 5px solid #999;
			height: 100%;
			width: 100%;
			font-style: italic;
			font-color: #999;
		}
		#choice {
			width: 70px;
			
		}
		#siglechoice {
			margin-top: 10px;
			border-left: 1px dashed #999;
			/*order-style:dashed;*/
			border-bottom: 1px solid #999;
		}
	</style>
	
	<script type="text/javascript">
			function islogin() {
				if (${logined} == true) {
					return true;
				}
				alert("未登录！请登录之后再发表作品哦~");
				return false;
			}
	</script>
</head>
<body id="body">
	<div id="sidenav">
		<div id="bannerline">
		    <div id="bannertitle"> <h2 class="categories">驴友导航</h2> </div>
		</div>
    	
    	<div id="choice">
	        <ul>
	            <li id="siglechoice"><a class="one" href="worksList.action?type=all&user.id=${user.id}">->游首页</a></li>
	            <li id="siglechoice"><a class="one" href="worksList.action?type=local&user.id=${user.id}">->国内游</a></li>
	            <li id="siglechoice"><a class="one" href="worksList.action?type=aboard&user.id=${user.id}">->国外游</a></li>
	            <li id="siglechoice"><a class="one" href="worksList.action?type=scenery&user.id=${user.id}">->风景游</a></li>
	            <li id="siglechoice"><a class="one" href="worksList.action?type=food&user.id=${user.id}">->美食游</a></li>
	            <li id="siglechoice"><a class="one" href="worksList.action?type=notes&user.id=${user.id}">->日记游</a></li>
	        </ul>
        </div>
        
        <div id="bannerline">
        	<div id="bannertitle"> <h2 class="sites">个人中心</h2> </div>
        </div>
        <div id="choice">
	        <ul>
	            <li id="siglechoice"><a class="one" href="index.action" target="_blank">驴友主页</a></li>
	            <!-- onclick的格式也是一个坑，在<a>标签里用，双引号必须，想要做到不跳转，return必须，不然怎么都是会跳转的 -->
	            <li id="siglechoice"><a class="one" href="turnToadd?user.id=${user.id}" onclick="return islogin();">创建分享</a></li>
	            <li id="siglechoice"><a class="one" href="logout.action">用户注销</a></li>
	        </ul>
        </div>
	</div>
</body>
</html>