﻿<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="check.jsp"%>
<%@page import="com.survey.service.*"%>
<%@page import="com.survey.bean.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="java.io.PrintWriter"%>
<%
	//从请求当中获取到ID，根据ID查询出题目和内容
	String id = request.getParameter("oid");
	System.out.println("oid=" + id);
	int oid = Integer.parseInt(id);
	SelecterService ss = new SelecterService();
	ObjectBean ob = ObjectBeanService.findPublishedObjectBeanByID(oid);//查找发布后的问卷
	QuestionService qs = new QuestionService();
	List quesList = qs.litQuesByOid(oid);
	//回复总数
	int rcount = ReplayService.getAnswerCount(oid);
	Map<Integer, List<Map<Integer, Integer>>> allCount = ReplayService
	.getAllAnswer(oid);
	//System.out.println(allCount);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>问卷管理系统</title>
<link type="text/css" rel="stylesheet" href="/lll/view/css/main.css" />
<script type="text/javascript">
	//返回
	function back() {
		window.location.href = "./wjList.jsp";
	}
</script>
</head>
<body topmargin="2">
	<br>
	<table cellspacing="0" cellpadding="1" width="750" align="center"
		class="tab1">
		<tr>
			<td align="center"><strong><%=ob.getTitle()%> </strong></td>
		</tr>
		<tr>
			<td align="center"><br></td>
		</tr>
		<tr>
			<td><%=ob.getDiscribe().replaceAll("\\n", "<br/>")%></td>
		</tr>
		<tr>
			<td align="right"><span class=""> <br>
			</span></td>
		</tr>
		<tr>
			<td align="left"><span class="m_right">本主题共有<font
					color="red"> <%=rcount%>
				</font>人作答。
			</span></td>
		</tr>
		<tr>
			<td align="left"><a href="showResult.jsp?oid=<%=oid%>">切换柱状图显示</a>
			</td>
		</tr>
	</table>
	<table width="750" align="center" cellpadding="2" cellspacing="1"
		class="tab1">
		<%
			if (quesList != null && quesList.size() > 0) {
				for (int i = 0; i < quesList.size(); i++) {
					Question ques = (Question) quesList.get(i);
					int seq = ques.getSeq();
					int qtype = ques.getQtype();
					List<Map<Integer, Integer>> clist = allCount.get(i + 1);
					double rcount_d = (double) clist.get(0).get(0);
					String p = "";
					String p1 = "";
					if (qtype != 3) {

						DefaultPieDataset dataset = new DefaultPieDataset();
						List selList = ss.listSelecterBySeq(seq, oid);
						int count = 0;
						for (int j = 0; j < selList.size(); j++) {
							Selecter sel = (Selecter) selList.get(j);
							int selseq = sel.getSelseq();
							count = clist.get(j + 1).get(j + 1);
							double count_d = (double) count;
							double result = MyTool.division(count_d, rcount_d);
							dataset.setValue(sel.getContent(), new Double(
									count_d));
						}

						p = ChartUtil.generatePieChart(dataset, "图" + (i + 1),
								400, 200, null, new PrintWriter(out));
						p1 = request.getContextPath()
								+ "/servlet/DisplayChart?filename=" + p;
					}
		%>
		<tr>
			<td bgcolor="#CDE2FD"><span id="title<%=i%>"><%=seq%>.<%=ques.getContent()%></span>&nbsp;&nbsp;&nbsp;&nbsp;
				<br /></td>
		</tr>
		<%
			if (qtype != 3) {
		%>
		<tr>
			<td><img src="<%=p1%>" border=0></td>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td colspan=3>&nbsp;&nbsp;<a
				href="listYijian.jsp?oid=<%=oid%>&seq=<%=seq%>">查看列表</a>
			</td>
		</tr>
		<%
			}
		%>
		<%
			}
			}
		%>
	</table>
	<table width="750" align="center" cellpadding="2" cellspacing="1"
		class="tab1">
		<tr>
			<td colspan=4 align="left"><br> <input type="button"
				name="back" value=" 返  回   " onclick="back();" class="btn" /></td>
		</tr>
	</table>
</body>
</html>
