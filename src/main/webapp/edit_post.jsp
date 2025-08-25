<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
    <%	
    if(request.getParameter("error") != null) {
		out.println("<script>alert('수정 또는 삭제 권한이 없는 글입니다');window.location.href='list.do';</script>");	
     }
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 수정 | Music Community</title>
  <link rel="stylesheet" href="css/style.css"> <!-- 공통 CSS -->
  <link rel="stylesheet" href="css/board.css"> <!-- 게시판 전용 CSS -->
</head>
<body>

  <!-- Header Include -->
  <%@ include file="include/header.jsp" %>

  <!-- 게시글 수정 내용 -->
  <div class="write-container">
    <h1 class="title">🎵 게시글 수정</h1>
    <p class="subtitle">작성한 내용을 수정하고 업데이트하세요.</p>
    
    <form action="editOk.do" method="post" class="write-form">
      <!-- 게시글 번호 (수정할 글을 식별하기 위해 필요) -->
      <input type="hidden" name="bnum" value="${boardDto.bnum}">

      <!-- 제목 입력란 -->
      <label for="title" class="input-label">제목</label>
      <input type="text" id="title" name="title" value="${boardDto.btitle}" required>
      
      <!-- 작성자 입력란 (자동 입력 및 수정 불가) -->
      <label for="author" class="input-label">작성자</label>
      <input type="text" id="author" name="author" value="${boardDto.memberid}" readonly>
      
      <!-- 내용 입력란 -->
      <label for="content" class="input-label">내용</label>
      <textarea id="content" name="content" rows="10" required>${boardDto.bcontent}</textarea>
      
      <div class="form-buttons">
        <button type="submit" class="btn">수정완료</button>
        <!-- 취소 버튼을 URL 파라미터를 사용하도록 수정 -->
        <a href="list.do" class="btn btn-secondary">취소</a>
      </div>
    </form>
  </div>

  <!-- Footer Include -->
  <%@ include file="include/footer.jsp" %>

</body>
</html>
