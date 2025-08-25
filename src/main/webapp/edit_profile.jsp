<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정 | Music Community</title>
  <link rel="stylesheet" href="css/style.css"> <link rel="stylesheet" href="css/edit_profile.css"> </head>
<body>

  <%@ include file="include/header.jsp" %>

  <div class="edit-container">
    <h1 class="title">🎵 회원정보 수정</h1>
    <p class="subtitle">개인정보를 안전하게 관리하세요.</p>

    <form action="edit_profileOk.do" method="post" class="edit-form">
      <input type="text" name="userid"  value="${memberDto.memberid}" readonly>
      <input type="text" name="name" value="${memberDto.membername}" readonly>
      
      <input type="email" name="email" placeholder="이메일" value="${memberDto.memberemail}" required>
      
      <input type="password" name="newPassword" placeholder="새 비밀번호 (변경 시 입력)"  >
      
      <button type="submit">정보 수정</button>
    </form>

    <div class="login-link">
      <p><a href="index.jsp">홈으로</a></p>
    </div>
  </div>

  <%@ include file="include/footer.jsp" %>
  
</body>
</html>