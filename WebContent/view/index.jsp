<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>问卷调查系统</title>
<style>
body {
	scrollbar-base-color: #C0D586;
	scrollbar-arrow-color: #FFFFFF;
	scrollbar-shadow-color: DEEFC6;
}
</style>
</head>
<frameset rows="60,*" cols="*" frameborder="no" border="0"
	framespacing="0">
	<frame src="top.jsp" name="topFrame" scrolling="no">
	<frameset cols="180,*" name="btFrame" frameborder="NO" border="0"
		framespacing="0">
		<frame src="menu.jsp" noresize name="menu" scrolling="yes">
		<frame src="main.jsp" noresize name="main" scrolling="yes">
	</frameset>
</frameset>
<noframes>
	<body>您的浏览器不支持框架！
	</body>
</noframes>
</html>
