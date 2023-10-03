<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
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

     <c:forEach var="adminReservationListVO" items="${list}">
            <tr>
                <td><input type="checkbox" class="check-item" name="seatNo" value="${adminReservationListVO.seatNo}"></td>
                <td>${adminReservationListVO.reservationNo}</td>
                <td>${adminReservationListVO.seatAreaZone}-${adminReservationListVO.seatCol}-${adminReservationListVO.seatRow}</td>
                <td>${adminReservationListVO.homeTeam}</td>	
                <td>${adminReservationListVO.awayTeam}</td>
                <td><fmt:formatDate value="${adminReservationListVO.reservationDate}" 
                    pattern="y년 M월 d일 E HH시 mm분 ss초"/></td>
                <td><a href="/admin/reservation/detail?reservationNo=${adminReservationListVO.reservationNo}">상세</a></td>
            </tr>
</c:forEach>
            </tbody>
        </table>
       	<div class="row right">
        <button id="confirm" class="btn btn-origin">예매 취소하기</button>
        </div>
    </form>
</div>
	<div class="row page-navigator mv-30">
		<!-- 이전 버튼 -->
		<c:if test="${!vo.first}">
			<a href="list?${vo.prevQueryString}"> <i
				class="fa-solid fa-angle-left"></i>
			</a>
		</c:if>

		<!-- 숫자 버튼 -->
		<c:forEach var="i" begin="${vo.begin}" end="${vo.end}" step="1">
			<c:choose>
				<c:when test="${vo.page == i}">
					<a class="on">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="list?${vo.getQueryString(i)}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${!vo.last}">
			<a href="list?${vo.nextQueryString}"> <i
				class="fa-solid fa-angle-right"></i>
			</a>
		</c:if>
	</div>





					
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>