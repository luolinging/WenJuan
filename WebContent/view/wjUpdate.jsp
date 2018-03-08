﻿<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="check.jsp"%>
<%@page import="com.survey.service.*"%>
<%@page import="com.survey.bean.*"%>
<%
			String oid = request.getParameter("oid");
			int id = Integer.parseInt(oid);
			ObjectBean ob = ObjectBeanService.findObjectBeanByID(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>问卷管理系统</title>
		<link type="text/css" rel="stylesheet" href="/lll/view/css/main.css" />
		<script type="text/javascript">
		//提交
		function sbmOK(){
			if (chkForm()) {
				document.fm.submit();
				return;
			}
		 }

		//校验
		function chkForm() {
			var title = document.all("title").value;
			var discribe = document.all("discribe").value;

			if (title == "" || title.length == 0) {
				alert("输入域 主题 不能为空。");
				document.all("title").focus();
				return false;
			} else if (discribe == "" || discribe.length == 0) {
				alert("输入域 描述 不能为空。");
				document.all("discribe").focus();
				return false;
			}
			return true;
		}

		//取消
		function cancel(){
		 	history.go(-1);
		 }
</script>
	</head>
	<body leftmargin="8" topmargin="8">
		<form action="./wjUpdateAction.jsp" name="fm" method="post">
		<input type="hidden" name="createUser" value="<%=session.getAttribute("userName")%>" />
		<input type="hidden" name="oid" value="<%=oid%>" />
		<table width="100%" align="center" class="table">
				<tbody>
					<tr>
						<td height="30"></td>
					</tr>
					<tr>
						<td align="center">
							编辑问卷<br/>
						</td>
					</tr>
				</tbody>
			</table>
			<table width="100%" align="center" class="table">
				<tr>
					<td height="30" width="80px" align="right">
						主题：
					</td>
					<td>
						&nbsp;
						<input type="text" name="title" style="width:350px" value="<%=ob.getTitle()%>" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">
						描述：
					</td>
					<td>
						&nbsp;
						<textarea name="discribe" cols="100" rows="15" ><%=ob.getDiscribe()%></textarea>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">
						是否匿名：
					</td>
					<td>
						是<input name="anonymousFlag" type="radio" value="1" <%if("1".equals(ob.getAnonymousFlag())){%>checked<%}%>/>&nbsp;&nbsp;
                                                                否<input name="anonymousFlag" type="radio" value="0" <%if("0".equals(ob.getAnonymousFlag())){%>checked<%}%>/>
					</td>
				</tr>
				<tr>
				<td height="30" ></td>
				</tr>
				<tr>
					<td height="30">
					</td>
					<td>
						&nbsp;
						<input type='button'   onClick="sbmOK();" value=' 确     定 ' />
						&nbsp;&nbsp;
						<input type="button"   onclick="cancel()" value=" 取    消 " />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>