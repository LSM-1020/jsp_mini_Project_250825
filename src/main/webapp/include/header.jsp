<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
   <link rel="stylesheet" href="css/style.css">
</head>
<body>

 <header>
    <div class="logo">🎶 Music Community</div>
    <nav class="nav">
      <ul>
        <li><a href="index.do" class="nav-link">홈</a></li>
        <li><a href="#" class="nav-link">인기차트</a></li>
        <li><a href="#" class="nav-link">콘서트 예약</a></li>
        <li><a href="list.do" class="nav-link">게시판</a></li>
        
        <!-- 로그인 상태에 따라 다르게 표시 -->
        <c:choose>
            <c:when test="${not empty sessionScope.sessionId}">
                <!-- 로그인 상태: 아이디와 환영 메시지, 로그아웃 링크 분리 -->
                <li class="auth-item">
                    <span class="welcome-text">${sessionScope.sessionId}님 환영합니다!</span>
                    <a href="edit_profile.do" class="nav-link">회원정보 수정</a>
                    
                </li>
                <li class="auth-item">
                    <a href="logout.do" class="nav-link">로그아웃</a>
                </li>
            </c:when>
            <c:otherwise>
                <!-- 로그아웃 상태: 로그인 링크 표시 -->
                <li class="login">
                    <a href="login.do" class="nav-link">로그인</a>
                </li>
            </c:otherwise>
        </c:choose>
        
      </ul>
    </nav>
</header>
  
</body>
</html>
