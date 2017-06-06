<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Header</title>
	<style type="text/css">
		.a-upload {  
    padding: 4px 10px;  
    height: 20px;  
    line-height: 20px;  
    position: relative;  
    cursor: pointer;  
    color: #888;  
    background: #fafafa;  
    border: 1px solid #ddd;  
    border-radius: 4px;  
    overflow: hidden;  
    display: inline-block;  
    *display: inline;  
    *zoom: 1  
}  
  
.a-upload  input {  
    position: absolute;  
    font-size: 100px;  
    right: 0;  
    top: 0;  
    opacity: 0;  
    filter: alpha(opacity=0);  
    cursor: pointer  
}  
  
.a-upload:hover {  
    color: #444;  
    background: #eee;  
    border-color: #ccc;  
    text-decoration: none  
}  
.file {  
    position: relative;  
    display: inline-block;  
    background: #D0EEFF;  
    border: 1px solid #99D3F5;  
    border-radius: 4px;  
    padding: 4px 12px;  
    overflow: hidden;  
    color: #1E88C7;  
    text-decoration: none;  
    text-indent: 0;  
    line-height: 20px;  
}  
.file input {  
    position: absolute;  
    font-size: 100px;  
    right: 0;  
    top: 0;  
    opacity: 0;  
}  
.file:hover {  
    background: #AADFFD;  
    border-color: #78C3F3;  
    color: #004974;  
    text-decoration: none;  
}  
	</style>
</head>
<body>
	<a href="javascript:;" class="a-upload">  
    <input type="file" name="" id="">点击这里上传文件  
</a>  
  
<a href="javascript:;" class="file">选择文件  
    <input type="file" name="" id="">  
</a>  
</body>
</html>