<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Content</title>
		<style type="text/css">
	#mainbox {
		width: 100%;
		height: auto;
		overflow: scroll;
		background-color: white;
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
		float: left;
		//background-color: red; 
	}
	#rightbox {
		width: 25%;
		height: 500px;
		float: right;
		//background-color: blue;
	}
	</style>
</head>

<body>
	<div id="mainbox">
		<div id="leftbox">
			<jsp:include page="leftbox.jsp" flush="true"/>
		</div>
		<div id="centerbox">
			<jsp:include page="centerbox.jsp" flush="true"/>
		</div>
		<div id="rightbox">
			<jsp:include page="rightbox.jsp" flush="true"/>
		</div>
	</div>
</body>
</html>