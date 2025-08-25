<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%	
    if(request.getParameter("msg") != null) {
		out.println("<script>alert('해당 글은 존재하지 않는 글입니다!');window.location.href='list.do';</script>");	
     }
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${boardDto.btitle} | Music Community</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/board.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

  <!-- Header Include -->
  <%@ include file="include/header.jsp" %>

  <!-- 게시글 내용 컨테이너 -->
  <div class="board-container">
    <div class="post-header">
        <h1 class="post-title">${boardDto.btitle}</h1>
       <div class="post-meta">
          <span>작성자: ${boardDto.memberid }</span> |
          <span>이메일: ${boardDto.memberDto.memberemail}</span> |
          <span>작성일: ${boardDto.bdate}</span> |
          <span>조회수: ${boardDto.bhit }</span>
        </div>
    </div>
    
    <!-- 게시글 내용 -->
    <div class="post-content">
      <p>${boardDto.bcontent}</p>
    </div>

    <!-- 버튼 그룹 -->
    <div class="post-buttons">
      <!-- 로그인한 사용자가 글 작성자와 동일한 경우에만 수정/삭제 버튼을 표시 -->
      <c:if test="${sessionScope.sessionId == boardDto.memberid}">
        <a href="edit.do?bnum=${boardDto.bnum}" class="btn btn-edit">수정</a>
        <a href="delete.do?bnum=${boardDto.bnum}" class="btn btn-delete">삭제</a>
      </c:if>
      
      <a href="list.do" class="btn btn-back">목록으로</a>
    </div>
  </div>
  
  <div class="comment-section">
  <div class="comment-write">
  <h2>댓글 달기</h2>
  
  <c:choose>
    <%-- 로그인 상태일 때 --%>
    <c:when test="${not empty sessionScope.sessionId}">
      <form action="commentOk.do" method="post">
        <input type="hidden" name="bnum" value="${boardDto.bnum}">
        <textarea name="comment" class="comment-input" rows="3" placeholder="댓글을 입력하세요."></textarea>
        <button type="submit" class="btn btn-comment-submit">등록</button>
      </form>
    </c:when>

    <%-- 로그인하지 않은 상태일 때 --%>
    <c:otherwise>
      <div class="comment-login-prompt">
        <p>로그인 후 댓글을 작성할 수 있습니다.</p><br>
        <a href="login.do" class="btn btn-login-prompt">로그인</a>
      </div>
    </c:otherwise>
  </c:choose>
</div>
  <hr class="comment-divider">

   <div class="comment-list">
    <h2>기존 댓글 목록</h2>
    <c:forEach items="${commentDtos}" var="commentDto">
      <div class="comment-item">
        <div class="comment-meta">
          <span class="comment-author">${commentDto.memberid}</span>
          <span class="comment-date">${commentDto.cdate}</span>
        </div>
        <p class="comment-content">${commentDto.comment}</p>
        
        <%-- 로그인한 사용자와 댓글 작성자가 동일할 경우에만 수정/삭제 버튼 표시 --%>
        <c:if test="${sessionScope.sessionId == commentDto.memberid}">
          <div class="comment-actions">
     
            <a href="deleteComment.do?cnum=${commentDto.cnum}&bnum=${boardDto.bnum}" class="btn btn-comment-delete">삭제</a>
          </div>
        </c:if>
      </div>
    </c:forEach>
    <c:if test="${empty commentDtos}">
      <p class="no-comments">아직 댓글이 없습니다. 첫 번째 댓글을 작성해 보세요!</p>
    </c:if>
  </div>
  </div>

  <!-- Footer Include -->
  <%@ include file="include/footer.jsp" %>

</body>
</html>
