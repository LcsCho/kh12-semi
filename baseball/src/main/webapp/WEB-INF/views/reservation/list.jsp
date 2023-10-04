<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<c:set var="formattedMatchDate" value='<fmt:formatDate value="${reservationVo.matchDate}" pattern="yyyy-MM-dd HH:mm" />' />
<script>
    // 포맷팅된 날짜를 JavaScript 변수에 할당
    var formattedMatchDate = "${formattedMatchDate}";

    // JavaScript에서 변수를 사용
    console.log("포맷팅된 날짜: " + formattedMatchDate);
</script>




<div class="row">
    <form action="delete" method="post">
        <table class="table table-hover table-border">

            <thead>
                <tr>
                	<th></th>
                    <th>예매번호</th>
                    <th>좌석번호</th>
                    <th>홈팀</th>
                    <th>어웨이팀</th>
                    <th>예매날짜</th>
                    <th>상세</th>
                </tr>
            </thead>
            <tbody align="center">

     <c:forEach var="reservationVo" items="${list}">
    <c:set var="currentDate" value="<%= new java.util.Date() %>" />
    <c:set var="twoHoursThirtyMinutes" value="9000000" /> <!-- 2시간 30분을 밀리초로 계산 -->

    <c:choose>
        <c:when test="${reservationVo.matchDate.time - currentDate.time <= twoHoursThirtyMinutes}">
            <tr>
                <td><input type="checkbox" class="check-item" name="seatNo" data-match-date="${reservationVo.matchDate}" value="${reservationVo.seatNo}" disabled="disabled"></td>
                <td>${reservationVo.reservationNo}</td>
                <td>${reservationVo.seatAreaZone}-${reservationVo.seatCol}-${reservationVo.seatRow}</td>
                <td>${reservationVo.homeTeam}</td>	
                <td>${reservationVo.awayTeam}</td>
                <td><fmt:formatDate value="${reservationVo.reservationDate}" 
                    pattern="y년 M월 d일 E HH시 mm분 ss초"/></td>
                <td><a href="/reservation/detail?reservationNo=${reservationVo.reservationNo}">상세</a></td>
                <td><fmt:formatDate value="${reservationVo.matchDate}" 
                    pattern="y년 M월 d일 E HH시 mm분 ss초"/></td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <td><input type="checkbox" class="check-item" name="seatNo" data-match-date="${reservationVo.matchDate}" value="${reservationVo.seatNo}"></td>
                <td>${reservationVo.reservationNo}</td>
                <td>${reservationVo.seatAreaZone}-${reservationVo.seatCol}-${reservationVo.seatRow}</td>
                <td>${reservationVo.homeTeam}</td>	
                <td>${reservationVo.awayTeam}</td>
                <td><fmt:formatDate value="${reservationVo.reservationDate}" 
                    pattern="y년 M월 d일 E HH시 mm분 ss초"/></td>
                <td><a href="/reservation/detail?reservationNo=${reservationVo.reservationNo}">상세</a></td>
                <td><fmt:formatDate value="${reservationVo.matchDate}" 
                    pattern="y년 M월 d일 E HH시 mm분 ss초"/></td>
            </tr>
        </c:otherwise>
    </c:choose>
</c:forEach>
            </tbody>
        </table>
       	<div class="row right">
        <button id="confirm" class="btn btn-origin">예매 취소하기</button>
        </div>
    </form>
</div>



					
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>