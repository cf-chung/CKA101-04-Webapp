<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>文章分類列表</title>
<style>
  body {
    font-family: "Helvetica Neue", Arial, "Noto Sans TC", sans-serif;
    background-color: #f8f9fa;
    color: #333333;
    margin: 40px auto;
    max-width: 900px;
    padding: 0 20px;
  }

  .header-title {
    font-size: 28px;
    font-weight: bold;
    color: #4A2E80; 
    margin-bottom: 20px;
  }

  .action-bar {
    display: flex;
    gap: 12px;
    margin-bottom: 20px;
  }

  .btn {
    padding: 8px 16px;
    font-size: 14px;
    border-radius: 6px;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    transition: all 0.2s;
    font-weight: 500;
  }
  .btn-primary {
    background-color: #4A2E80;
    color: white;
    border: none;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
  }
  .btn-primary:hover { background-color: #372063; }
  
  .btn-secondary {
    background-color: transparent;
    color: #4A2E80;
    border: 1px solid #4A2E80;
  }
  .btn-secondary:hover { background-color: #f0ebfa; }

  .table-container {
    background-color: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    border: 1px solid #eef0f5;
  }

  .status-bar {
    background-color: #ffffff;
    padding: 14px 20px;
    font-size: 15px;
    font-weight: bold;
    color: #333333;
    border-bottom: 1px solid #eef0f5;
  }

  .data-table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
  }
  .data-table th {
    background-color: #f0ebfa; 
    color: #4A2E80;
    padding: 14px;
    font-size: 15px;
    font-weight: bold;
    border-bottom: 1px solid #e2daf2;
  }
  .data-table td {
    padding: 14px;
    font-size: 15px;
    color: #444444;
    border-bottom: 1px solid #f1f3f7;
    vertical-align: middle;
  }
  /* 滑鼠 */
  .data-table tr:hover td {
    background-color: #faf9fe;
  }

  .btn-sm {
    padding: 6px 12px;
    font-size: 13px;
    border-radius: 4px;
    margin: 0 2px;
  }
  .btn-action {
    background-color: #4A2E80;
    color: white;
  }
  .btn-action:hover { background-color: #372063; }
  
  .btn-delete {
    background-color: #e53e3e;
    color: white;
  }
  .btn-delete:hover { background-color: #c53030; }

  .pagination {
    display: flex;
    justify-content: center;
    gap: 6px;
    margin-top: 24px;
  }
  .page-link {
    display: inline-block;
    padding: 6px 12px;
    font-size: 14px;
    color: #4A2E80;
    text-decoration: none;
    border: 1px solid #e2daf2;
    border-radius: 4px;
    background-color: white;
    transition: all 0.2s;
  }
  .page-link:hover {
    background-color: #4A2E80;
    color: white;
    border-color: #4A2E80;
  }

  .error-block {
    background-color: #fff5f5;
    border-left: 4px solid #e53e3e;
    padding: 12px 20px;
    border-radius: 4px;
    margin-bottom: 20px;
  }
  .error-title { color: #c53030; font-weight: bold; margin-bottom: 6px; }
  .error-list { margin: 0 0 10px 0; padding-left: 20px; color: #e53e3e; }
</style>
</head>
<body>

  <div class="header-title">文章分類列表</div>

  <div class="action-bar">
    <a href="${pageContext.request.contextPath}/articleCat/index.jsp" class="btn btn-secondary">回首頁</a>
    <a href="${pageContext.request.contextPath}/articleCat/addArticleCat.jsp" class="btn btn-primary">新增分類</a>
  </div>

  <c:if test="${not empty errorMsgs}">
    <div class="error-block">
      <div class="error-title">請修正以下錯誤:</div>
      <ul class="error-list">
        <c:forEach var="message" items="${errorMsgs}">
          <li>${message}</li>
        </c:forEach>
      </ul>
      <a href="javascript:history.back()" class="btn btn-secondary btn-sm">返回上一頁</a>
    </div>
  </c:if>

  <div class="table-container">
    <div class="status-bar">
      ● 符合查詢條件結果如下所示
    </div>
    
    <table class="data-table">
      <thead>
        <tr>
          <th style="width: 25%;">分類ID</th>
          <th style="width: 45%;">分類名稱</th>
          <th style="width: 30%;">操作選項</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="cat" items="${allArticleCats}">
          <tr>
            <td>${cat.categoryId}</td>
            <td>${cat.categoryName}</td>
            <td>
              <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getOne&categoryId=${cat.categoryId}" class="btn btn-sm btn-action">查看</a>
              <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=toUpdate&categoryId=${cat.categoryId}" class="btn btn-sm btn-action">修改</a>
              <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=delete&categoryId=${cat.categoryId}" onclick="return confirm('確定刪除？')" class="btn btn-sm btn-delete">刪除</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <div class="pagination">
    <c:forEach begin="1" end="${articleCatPageQty}" var="i">
      <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll&page=${i}" class="page-link">${i}</a>
    </c:forEach>
  </div>

</body>
</html>