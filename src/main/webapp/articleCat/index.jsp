<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>文章分類管理首頁</title>
<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>文章分類管理</h3><h4>( MVC )</h4></td></tr>
</table>

<h3>功能選單:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
    <li>
        <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll">查看文章分類列表</a>
    </li>
</ul>

</body>
</html>