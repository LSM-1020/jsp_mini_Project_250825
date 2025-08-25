<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>로그인 | Music Community</title>
  <link rel="stylesheet" href="css/login.css">
  <link rel="stylesheet" href="css/style.css"> <!-- 메시지 박스 스타일을 여기에 추가 -->
</head>
<body>
<!-- Header Include -->
  <%@ include file="include/header.jsp" %>
  
  <div class="login-container">
  
    <h1 class="title">🎵 Music Community</h1>
    <p class="subtitle">여름처럼 밝고 활기찬 음악 공간</p>
    
    <form action="loginOk.do" method="post" class="login-form">
      <input type="text" name="userid" placeholder="아이디" required>
      <input type="password" name="password" placeholder="비밀번호" required>
      
      <button type="submit">로그인</button>
    </form>
    
    <!-- 메시지 박스를 login-container 안에 위치 -->
    <div class="form-actions">
      <c:if test="${param.msg == 1}">
        <div class="message-box">
          <p style ="color: red;">
            <i class="fas fa-exclamation-circle"></i> 아이디 또는 비밀번호가 잘못되었습니다.
          </p>
        </div>
      </c:if>
      <c:if test="${param.msg == 2}">
        <div class="message-box">
          <p style ="color: red;">
            <i class="fas fa-exclamation-circle"></i> 로그인한 유저만 글을 쓸수 있습니다.
          </p>
        </div>
      </c:if>
    </div>

    <div class="extra-links">
      <a href="register.jsp">회원가입</a>
      <a href="index.jsp">홈으로</a>
    </div>
  </div>
  <c:if test="${not empty msg}">
    <script>
        <c:if test="${msg == 'register_success'}">
            alert('회원가입이 완료되었습니다. 로그인 해주세요.');
        </c:if>
    </script>
</c:if>
  <!-- Footer Include -->
  <%@ include file="include/footer.jsp" %>
  
</body>
</html>