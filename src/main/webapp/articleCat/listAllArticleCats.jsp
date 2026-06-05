<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>文章分類列表</title>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
    width: 600px;
  }
  table {
	width: 600px;
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
		 <h3>文章分類列表</h3>
		 <h4><a href="${pageContext.request.contextPath}/articleCat/index.jsp">回首頁</a></h4>
	</td></tr>
</table>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
	<a href="javascript:history.back()">返回上一頁</a>
</c:if>

<p>
	<a href="${pageContext.request.contextPath}/articleCat/addArticleCat.jsp">新增分類</a>
</p>

<table>
	<tr>
		<th>分類ID</th>
		<th>分類名稱</th>
		<th>操作選項</th>
	</tr>
	<c:forEach var="cat" items="${allArticleCats}">
		<tr>
			<td>${cat.categoryId}</td>
			<td>${cat.categoryName}</td>
			<td>
				<a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getOne&categoryId=${cat.categoryId}">查看</a>
				<a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=toUpdate&categoryId=${cat.categoryId}">修改</a>
				<a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=delete&categoryId=${cat.categoryId}" onclick="return confirm('確定刪除？')">刪除</a>
			</td>
		</tr>
	</c:forEach>
</table>

<%-- 分頁邏輯 Pagination --%>
<div style="width: 600px; text-align: center; margin-top: 10px;">
	<c:forEach begin="1" end="${articleCatPageQty}" var="i">
	    <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll&page=${i}">[${i}]</a>
	</c:forEach>
</div>

</body>
</html>