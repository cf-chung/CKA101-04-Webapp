<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.freemind.article.model.*"%>
<%
ArticleCat articleCat = (ArticleCat) request.getAttribute("articleCat"); 
%>

<html>
<head>
<title>文章分類單筆資料</title>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
    width: 500px;
  }
  table {
	width: 500px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>文章分類單筆資料</h3>
		 <h4><a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll">返回列表</a></h4>
	</td></tr>
</table>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<%-- 只有在沒有任何錯誤訊息時, 才顯示資料表格 --%>
<c:if test="${empty errorMsgs}">
	<% if (articleCat != null) { %>
	<table>
		<tr>
			<th>文章分類ID</th>
			<th>文章分類名稱</th>
		</tr>
		<tr>
			<td><%=articleCat.getCategoryId()%></td>
			<td><%=articleCat.getCategoryName()%></td>
		</tr>
	</table>
	<% } %>
</c:if>

</body>
</html>