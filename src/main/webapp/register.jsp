<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원가입 | Music Community</title>
  <link rel="stylesheet" href="css/style.css"> <!-- 공통 CSS -->
  <link rel="stylesheet" href="css/register.css"> <!-- 회원가입 전용 CSS -->
</head>
<body>

  <!-- Header Include -->
  <%@ include file="include/header.jsp" %>

  <!-- 회원가입 내용 -->
  <div class="register-container">
    <h1 class="title">🎵 회원가입</h1>
    <p class="subtitle">여름처럼 시원한 음악 커뮤니티에 오신 걸 환영합니다!</p>

    <form action="registerOk.do" method="post" class="register-form">
      <input type="text" name="memberid" placeholder="아이디" required>
      <input type="password" name="memberpw" placeholder="비밀번호" required>
      <input type="text" name="membername" placeholder="이름" required>
      <input type="email" name="memberemail" placeholder="이메일" required>
      

      <button type="submit">회원가입</button>
      
      
    </form>
 	<!-- 회원가입 결과 메시지 출력 -->
<c:if test="${not empty msg}">
    <script>
        <c:choose>
            <c:when test="${msg == 'id_exist'}">
                alert('이미 존재하는 아이디입니다.');
            </c:when>
            <c:when test="${msg == 'register_fail'}">
                alert('회원가입에 실패했습니다. 다시 시도해주세요.');
            </c:when>
        </c:choose>
    </script>
</c:if>
        
    <div class="login-link">
      <p>이미 회원이신가요? <a href="login.jsp">로그인</a></p>
    </div>
  </div>

  <!-- Footer Include -->
  <%@ include file="include/footer.jsp" %>

</body>
</html>