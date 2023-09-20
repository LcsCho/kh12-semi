<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<div class="row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>예매번호</th>
					<th>매치아이디</th>
					<th>홈팀</th>
					<th>어웨이팀</th>
					<th>좌석번호</th>
					<th>예매날짜</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="reservationDto" items="${list}">
				<tr>
					<td>${reservationDto.reservationNo}</td>
					<td>${reservationDto.matchNo}</td>
					<td>${reservationDto.homeTeam}</td>	
					<td>${reservationDto.awayTeam}</td>
					<td>${reservationDto.seatNo}</td>
					<td>${reservationDto.reservationDate}</td>
					</tr>
					</c:forEach>
					</table>
					</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>