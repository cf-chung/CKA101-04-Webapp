<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>修改文章分類</title>
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
  }
  .btn-secondary:hover {
    background-color: #f0ebfa;
  }

  .form-container {
    background-color: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    border: 1px solid #eef0f5;
    margin-top: 20px;
  }

  .info-bar {
    background-color: #f0ebfa; 
    color: #4A2E80;
    padding: 12px 20px;
    font-size: 15px;
    font-weight: 500;
    border-bottom: 1px solid #e2daf2;
  }

  .form-body {
    padding: 24px;
  }

  .input-group {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
  }
  .input-label {
    width: 160px;
    font-size: 16px;
    font-weight: 500;
    color: #555555;
  }

  .static-text {
    font-size: 16px;
    font-weight: bold;
    color: #333333;
    background-color: #f1f3f5;
    padding: 6px 12px;
    border-radius: 4px;
    display: inline-block;
  }
  
  .input-field {
    flex: 1;
    max-width: 350px;
    padding: 10px 14px;
    font-size: 15px;
    border: 1px solid #cccccc;
    border-radius: 6px;
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s;
  }
  .input-field:focus {
    border-color: #4A2E80;
    box-shadow: 0 0 0 3px rgba(74, 46, 128, 0.15);
  }

  .btn-submit {
    background-color: #4A2E80;
    color: white;
    border: none;
    padding: 10px 24px;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.2s, transform 0.1s;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }
  .btn-submit:hover {
    background-color: #372063;
  }
  .btn-submit:active {
    transform: scale(0.98);
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

  <div class="header-title">修改文章分類</div>
  <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll" class="btn-secondary">返回列表</a>

  <c:if test="${not empty errorMsgs}">
    <div class="error-block" style="margin-top: 20px;">
      <div class="error-title">請修正以下錯誤:</div>
      <ul class="error-list">
        <c:forEach var="message" items="${errorMsgs}">
          <li>${message}</li>
        </c:forEach>
      </ul>
    </div>
  </c:if>

  <c:if test="${not empty articleCat}">
    <div class="form-container">
      <div class="info-bar">
        資料修改
      </div>
      
      <div class="form-body">
        <form action="${pageContext.request.contextPath}/articleCat/articleCat.do" method="post">
          <input type="hidden" name="action" value="update">
          <input type="hidden" name="categoryId" value="${articleCat.categoryId}">
          
          <div class="input-group">
            <div class="input-label">目前文章分類名稱：</div>
            <div class="static-text">${articleCat.categoryName}</div>
          </div>
          
          <div class="input-group">
            <div class="input-label">修改文章分類名稱：</div>
            <input type="text" name="categoryName" class="input-field" value="${articleCat.categoryName}" required>
          </div>
          
          <button type="submit" class="btn-submit">儲存修改</button>
        </form>
      </div>
    </div>
  </c:if>

  <c:if test="${empty articleCat}">
    <div style="margin-top: 20px;">
      <a href="javascript:history.back()" class="btn-secondary">返回上一頁</a>
    </div>
  </c:if>

</body>
</html>