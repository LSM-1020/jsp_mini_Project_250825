<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기 | Music Community</title>
  <link rel="stylesheet" href="css/style.css"> <!-- 공통 CSS -->
  <link rel="stylesheet" href="css/board.css"> <!-- 게시판 전용 CSS -->
</head>
<body>

  <!-- Header Include -->
  <%@ include file="include/header.jsp" %>

  <!-- 글쓰기 내용 -->
  <div class="write-container">
    <h1 class="title">🎵 새 글 작성</h1>
    <p class="subtitle">자유롭게 이야기를 작성해 주세요.</p>
    
    <form action="writeOk.do" method="post" class="write-form">
      <!-- 제목 입력란 -->
      <label for="title" class="input-label">제목</label>
      <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
      
      <!-- 작성자 입력란 (자동 입력) -->
      <label for="author" class="input-label">작성자</label>
      <%
          // 세션에서 로그인한 사용자 ID를 가져오는 예시 코드입니다.
          // 실제 환경에 맞게 수정해야 합니다.
          String sessionId = (String) session.getAttribute("sessionId");
          if (sessionId == null) {
              // 로그인하지 않았을 경우의 기본값 또는 리다이렉션 처리
              sessionId = "guest";
          }
      %>
      <input type="text" id="author" name="author" value="<%= sessionId %>" readonly>
      
      <!-- 내용 입력란 -->
      <label for="content" class="input-label">내용</label>
      <textarea id="content" name="content" rows="15" placeholder="내용을 입력하세요" required></textarea>
      
      <div class="form-buttons">
        <button type="submit" class="btn">작성완료</button>
        <a href="list.do" class="btn btn-secondary">취소</a>
      </div>
    </form>
  </div>

  <!-- Footer Include -->
  <%@ include file="include/footer.jsp" %>

</body>
</html>
