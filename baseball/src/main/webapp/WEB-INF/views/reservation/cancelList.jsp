<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	
</script>
<div class="row">
	<table class="table table-hover table-border">

		<thead>
			<tr>
				<th>예매번호</th>
				<th>좌석번호</th>
				<th>경기장</th>
				<th>홈팀</th>
				<th>어웨이팀</th>
				<th>예매날짜</th>
			
			</tr>
		</thead>
		<tbody align="center">

			<c:forEach var="reservationVO" items="${list}">
				<tr>
					<td>${reservationVO.reservationCancelNo}</td>
					<td>${reservationVO.seatAreaZone}-${reservationVO.seatRow}-${reservationVO.seatCol}</td>
					<td>${reservationVO.stadiumName}</td>
					<td>${reservationVO.homeTeam}</td>
					<td>${reservationVO.awayTeam}</td>
					<td>${reservationVO.reservationCancelDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 선택된 예매 번호 배열을 서버로 전송하는 버튼 -->
</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>