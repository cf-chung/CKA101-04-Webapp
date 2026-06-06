<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>文章分類管理首頁</title>
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

  .btn-primary {
    background-color: #4A2E80; 
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    transition: background-color 0.2s, transform 0.1s;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }
  .btn-primary:hover {
    background-color: #372063;
  }
  .btn-primary:active {
    transform: scale(0.98);
  }

  .card {
    background-color: #ffffff;
    border-radius: 8px;
    padding: 24px;
    margin-top: 20px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    border: 1px solid #eef0f5;
  }

  .card-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 16px;
    color: #555555;
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

  <div class="header-title">文章分類管理 <span style="font-size: 18px; color: #888; font-weight: normal;"></span></div>

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

  <div class="card">
    <div class="card-title">功能選單</div>
    <a href="${pageContext.request.contextPath}/articleCat/articleCat.do?action=getAll" class="btn-primary">
      查看文章分類列表
    </a>
  </div>

</body>
</html>