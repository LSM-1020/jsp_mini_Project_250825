<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>음악 커뮤니티</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <!-- Header -->
 <%@ include file="include/header.jsp" %>
  <!-- Hero Section -->
  <section class="hero summer">
    <div class="hero-text">
      <h1>여름처럼 시원한 음악 공간</h1>
      <p>바닷가 콘서트의 청량한 분위기 속에서  
         음악을 사랑하는 사람들과 함께하세요.</p>
   
    </div>
  </section>

  <!-- Features Section -->
  <section class="features">
    <div class="feature">
      <img src="https://cdn-icons-png.flaticon.com/512/727/727245.png" alt="차트" />
      <h3>인기차트</h3>
      <p>오늘 가장 사랑받는 음악을 만나보세요.</p>
    </div>
    <div class="feature">
      <img src="https://cdn-icons-png.flaticon.com/512/727/727269.png" alt="최신음악" />
      <h3>최신음악</h3>
      <p>따끈따끈한 신곡을 한눈에 확인하세요.</p>
    </div>
    <div class="feature">
      <img src="https://cdn-icons-png.flaticon.com/512/684/684908.png" alt="게시판" />
      <h3>커뮤니티 게시판</h3>
      <p>회원들과 자유롭게 음악 이야기를 나눠보세요.</p>
    </div>
  </section>
  
<c:if test="${param.msg == 'success'}">
    <script>
        alert('회원정보가 성공적으로 수정되었습니다!');
    </script>
</c:if>
<c:if test="${param.msg == 'fail'}">
    <script>
        alert('회원정보 수정에 실패했습니다. 다시 시도해주세요.');
    </script>
</c:if>
<c:if test="${param.msg == 'logout_success'}">
    <script>
        alert('성공적으로 로그아웃 되었습니다.');
    </script>
</c:if>
  <!-- Footer -->
  <%@ include file="include/footer.jsp" %>
</body>
</html>

