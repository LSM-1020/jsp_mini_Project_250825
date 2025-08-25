<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
<%@page import="com.LSM.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.LSM.dao.BoardDao"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판 | Music Community</title>
  <link rel="stylesheet" href="css/style.css"> <!-- 공통 CSS -->
  <link rel="stylesheet" href="css/board.css"> <!-- 게시판 전용 CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

  <!-- Header Include -->
  <%@ include file="include/header.jsp" %>

  <!-- 게시판 내용 -->
  <div class="board-container">
    <h1 class="title">🎵 자유 게시판</h1>
    <p class="subtitle">음악에 대한 다양한 이야기를 나눠보세요.</p>

    <!-- 글쓰기 버튼 및 검색창 -->
    <div class="board-controls">
      <!-- 로그인 여부에 따라 글쓰기 버튼을 표시하거나 숨길 수 있습니다. -->
      <!-- if (session.getAttribute("loggedInUser") != null) { -->
        <a href="write.do" class="btn">글쓰기</a>
      <!-- } -->
      <form action="list.do" method="get" class="search-form">
        <select name="searchType">
          <option value="btitle"${searchType == 'btitle' ? 'selected' : '' }>제목</option>
          <option value="bcontent"${searchType == 'bcontent' ? 'selected' : '' }>내용</option>
          <option value="b.memberid"${searchType == 'b.memberid' ? 'selected' : '' }>작성자</option>
        </select>
        <input type="text" name="searchKeyword" value="${searchKeyword != null ? searchKeyword : ''}" placeholder="검색어를 입력하세요">
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <!-- 게시글 테이블 -->
    <table class="board-table">
      <thead>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>이메일</th>
          <th>작성일</th>
          <th>조회수</th>
        </tr>
      </thead>
       <tbody>
        <c:forEach items="${bDtos}" var="bDt">
        <tr>
          <td>${bDt.bno}</td>
          <td>
          <c:choose>
          	<c:when test="${fn:length(bDt.btitle) > 35}">
          		<a href="content.do?bnum=${bDt.bnum }" class="board-link">${fn:substring(bDt.btitle, 0, 35)}...</a>
          	</c:when>
          	<c:otherwise>
            			<a href="content.do?bnum=${bDt.bnum }" class="board-link">${bDt.btitle}</a>
            		</c:otherwise>
            	</c:choose>
            </td>
            <td>${bDt.memberid}</td>
            <td>${bDt.memberDto.memberemail}</td>
            <td>${fn:substring(bDt.bdate,0,10)}</td>
            <td>${bDt.bhit}</td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
      <br>
    <!-- 페이지네이션 섹션 -->
    <div class="pagination">
        <!-- 1 페이지로 이동 화살표 -->
        <c:if test="${currentPage > 1}">
            <a href="list.do?page=1&searchType=${searchType}&searchKeyword=${searchKeyword}" class="page-link page-arrow"><i class="fas fa-angle-double-left"></i></a>
        </c:if>
        <!-- 이전 페이지 그룹으로 이동 화살표 -->
        <c:if test="${startPage > 1}">
            <a href="list.do?page=${startPage-1}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="page-link page-arrow"><i class="fas fa-angle-left"></i></a>
        </c:if>
        
        <!-- 페이지 번호 그룹 출력 -->
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="list.do?page=${i}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="page-link active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="list.do?page=${i}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="page-link">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <!-- 다음 페이지 그룹으로 이동 화살표 -->
        <c:if test="${endPage < totalPage}">
            <a href="list.do?page=${endPage + 1}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="page-link page-arrow"><i class="fas fa-angle-right"></i></a>
        </c:if>
        <!-- 마지막 페이지로 이동 화살표 -->
        <c:if test="${currentPage < totalPage}">
            <a href="list.do?page=${totalPage}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="page-link page-arrow"><i class="fas fa-angle-double-right"></i></a>
        </c:if>
    </div>
  </div>
  
  <!-- Footer Include -->
  <%@ include file="include/footer.jsp" %>

</body>
</html>
