<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.freemind.article.model.*"%>
<%
ArticleCat articleCat = (ArticleCat) request.getAttribute("articleCat"); 
%>
<!DOCTYPE html>
<html>
<head>
<title>文章分類單筆資料</title>
<style>
  body {
    font-family: "Helvetica Neue", Arial, "Noto Sans TC", sans-serif;
    background-color: #f8f9fa;
    color: #333333;
    margin: 40px auto;
    max-width: 800px;
    padding: 0 20px;
  }

  .header-title {
    font-size: 28px;
    font-weight: bold;
    color: #4A2E80; 
    margin-bottom: 24px;
  }

  .btn-secondary {
    background-color: transparent;
    color: #4A2E80;
    border: 1px solid #4A2E80;
    padding: 8px 16px;
    font-size: 14px;
    border-radius: 6px;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    transition: all 0.2s;
    margin-bottom: 20px;
  }
  .btn-secondary:hover {
    background-color: #f0ebfa;
  }

  .table-container {
    background-color: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    border: 1px solid #eef0f5;
  }

  .info-bar {
    background-color: #f0ebfa;
    color: #4A2E80;
    padding: 12px 20px;
    font-size: 15px;
    font-weight: 500;
    border-bottom: 1px solid #e2daf2;
  }

  .detail-table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
  }
  .detail-table th {
    background-color: #ffffff;
    color: #555555;
    padding: 16px;
    font-size: 15px;
    font-weight: bold;
    border-bottom: 1px solid #eef0f5;
    width: 40%;
  }
  .detail-table td {
    padding: 16px;
    font-size: 15px;
    color: #111111;
    border-bottom: 1px solid #eef0f5;
    text-align: left; /* 詳細頁內容靠左 */
    padding-left: 30px;
  }

  .error-block {
    background-color: #fff5f5;
    border-left: 4px solid #e53e3e;
    padding: 12px 20px;
    border-radius: 4px;
    margin-bottom: 20px;
  }
  .error-title {
    color: #c53030;
    font-weight: bold;
    margin-bottom: 6px;
  }
  .error-list {
    margin: 0;
    padding-left: 20px;
    color: #e53e3e;
  }
</style>
</head>
<body>

  <div class="header-title">文章分類單筆資料</div>
  <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll" class="btn-secondary">返回列表</a>

  <c:if test="${not empty errorMsgs}">
    <div class="error-block">
      <div class="error-title">請修正以下錯誤:</div>
      <ul class="error-list">
        <c:forEach var="message" items="${errorMsgs}">
          <li>${message}</li>
        </c:forEach>
      </ul>
    </div>
  </c:if>

  <c:if test="${empty errorMsgs}">
    <% if (articleCat != null) { %>
      <div class="table-container">
        <div class="info-bar">
          查詢結果 - 詳細內容
        </div>
        
        <table class="detail-table">
          <tr>
            <th>文章分類ID：</th>
            <td><%=articleCat.getCategoryId()%></td>
          </tr>
          <tr>
            <th>文章分類名稱：</th>
            <td><%=articleCat.getCategoryName()%></td>
          </tr>
        </table>
      </div>
    <% } %>
  </c:if>

</body>
</html>