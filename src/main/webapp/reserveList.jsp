<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 예약 목록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link href="css/reserveList.css" rel="stylesheet" type="text/css">
</head>
<body>
   <!-- Header -->
 <%@ include file="include/header.jsp" %>
 
    <div class="container">
        <h2>🎟️ 내 콘서트 예약 목록</h2>
        <c:choose>
            <c:when test="${empty reservationList}">
                <div class="empty-message">
                    아직 예약한 콘서트가 없습니다. <a href="concert.do">예약 바로가기</a>
                </div>
            </c:when>
            <c:otherwise>
               <table class="reservation-table">
    <thead>
        <tr>
            <th>예약 번호</th>
            <th>콘서트 이름</th>
            <th>예약 날짜</th>
            <th>티켓 수량</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="rev" items="${reservationList}">
            <tr>
                <td><c:out value="${rev.reservationid}" /></td>
                
                <!-- 콘서트 ID 대신 이름 표시 -->
                <td>
                    <c:choose>
                        <c:when test="${rev.concertid == '1'}">Summer Music Festival</c:when>
                        <c:when test="${rev.concertid == '2'}">Urban Groove Night</c:when>
                        <c:otherwise>알 수 없음</c:otherwise>
                    </c:choose>
                </td>
                
                <td><c:out value="${rev.reservedate}" /></td>
                <td><c:out value="${rev.ticketcount}" /></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="form-buttons">
    <a href="concert.do" class="btn btn-secondary">취소</a>
</div>
    <!-- Footer -->
  <%@ include file="include/footer.jsp" %>
  
</body>
</html>
