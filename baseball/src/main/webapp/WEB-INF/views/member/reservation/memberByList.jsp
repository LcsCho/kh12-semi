<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container w-600">
	<table class="table table-slit">
		<thead>
			<tr>
				<th>예매번호</th>
				<th>경기시간</th>
				<th>경기장</th>
				<th>홈팀</th>
				<th>어웨팀</th>
				<th></th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="reservationDto" items="${list}">
				<tr>
					<td>${reservationDto.reservationNo}</td>
					<td><fmt:formatDate value="${reservationDto.matchDate}" pattern="yyyy-MM-dd-HH-mm"/>
					</td>
					<td>${reservationDto.stadiumName}</td>
					<td>${reservationDto.homeTeam}</td>
					<td>${reservationDto.awayTeam}</td>
					<td><a href="memberByDetail?reservationNo=${reservationDto.reservationNo}">상세</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>