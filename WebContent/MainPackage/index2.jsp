<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- 访问一个action 但是因为我的struts里设置的此action跳转此页面，此时不适用， 会死循环 ， 因此我采用更改struts.xml默认访问url的方法-->
	<!-- /* <meta http-equiv="refresh" content="0;url=worksList.action">*/  -->
	<title>LvU驴友分享网</title>
	<style type="text/css">
		#body {
			margin-left: 3%;
			margin-right: 3%;
		}
	</style>
</head>
<body id="body">
	<jsp:include page="header.jsp" flush="true"/>
	<jsp:include page="content.jsp" flush="true"/>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>