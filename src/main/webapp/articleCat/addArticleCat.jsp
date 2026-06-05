<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>新增文章分類</title>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
    width: 500px;
  }
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>新增文章分類 - addArticleCat.jsp</h3>
		 <h4><a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll">返回列表</a></h4>
	</td></tr>
</table>

<h3>資料輸入:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form action="${pageContext.request.contextPath}/articleCat/articleCat.do" method="post">
	<input type="hidden" name="action" value="add"> 
	<table>
		<tr>
			<td>文章分類名稱：</td>
			<td>
				<input type="text" name="categoryName" value="${articleCat.categoryName}" required>
			</td>
		</tr>
	</table>
	<br>
	<button type="submit">新增</button>
</form>

</body>
</html>