<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>콘서트 예약 | Music Community</title>
  <link rel="stylesheet" href="css/style.css"> <!-- 공통 CSS -->
  <link rel="stylesheet" href="css/concert.css"> <!-- 콘서트 예약 전용 CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

  <!-- Header Include -->
  <%@ include file="include/header.jsp" %>

  <!-- 콘서트 예약 컨테이너 -->
  <div class="concert-container">
    <h1 class="title">🎸 콘서트 예약</h1>
    <p class="subtitle">특별한 경험을 위한 콘서트를 지금 바로 예약하세요!</p>

    <!-- 예약 가능 콘서트 목록 -->
    <div class="concert-list">
        <!-- 콘서트 정보 -->
        <div class="concert-item">
            <img src="https://placehold.co/400x250/FFB6C1/FFF?text=Summer+Festival" alt="콘서트 포스터" class="concert-poster">
            <h2 class="concert-title">Summer Music Festival</h2>
            
            <p class="concert-location">서울 올림픽공원</p>
            <span class="concert-price">45,000원</span>
        </div>
        <div class="concert-item">
            <img src="https://placehold.co/400x250/4db8ff/FFF?text=Urban+Groove" alt="콘서트 포스터" class="concert-poster">
            <h2 class="concert-title">Urban Groove Night</h2>
           
            <p class="concert-location">홍대 롤링홀</p>
            <span class="concert-price">30,000원</span>
        </div>
    </div>
    
    <div class="reservation-section">
      <h3 class="section-title">예약하기</h3>
      
      <c:choose>
        <c:when test="${not empty sessionScope.sessionId}">
          <!-- 로그인 상태: 예약 폼 표시 -->
          <form action="reserveOk.do" method="post" class="reservation-form">
            <div class="form-group">
                <label for="concertSelect">콘서트 선택</label>
                <select id="concertSelect" name="concertId" required>
                    <option value="" disabled selected>콘서트를 선택해주세요</option>
                    <option value="1">Summer Music Festival</option>
                    <option value="2">Urban Groove Night</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="reserveDate">날짜 선택</label>
                <input type="date" id="reserveDate" name="reserveDate" required>
            </div>

            <div class="form-group">
                <label for="ticketCount">티켓 수량</label>
                <input type="number" id="ticketCount" name="ticketCount" min="1" max="10" value="1" required>
            </div>
            
            <button type="submit" class="btn btn-primary">예약하기</button>
          </form>
        </c:when>
        <c:otherwise>
          <!-- 로그아웃 상태: 로그인 유도 메시지 표시 -->
          <div class="login-message">
            <p>콘서트 예약은 로그인 후 가능합니다. <a href="login.do">로그인하기</a></p>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
<c:if test="${param.msg == 'error'}">
    <script>
        alert('값이 정상적으로 입력되지않았습니다.');
    </script>
</c:if>


  <!-- Footer Include -->
  <%@ include file="include/footer.jsp" %>

</body>
</html>