<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>

<style>
table {
	border-collapse: collapse;
}

table th {
	border-top: #62676C 3px solid;
	border-bottom: #62676C 2px solid;
	border-right: #D1CFCF 2px solid;
	background-color: #f1f1f1;
	font-weight: bold;
	height: 40px;
	padding-top: 0.5em;
	font-size: 16px;
	color: #62676C;
	font-weight: bold;
}

table td {
	border-top: #D1CFCF 2px solid;
	border-bottom: #D1CFCF 2px solid;
	border-right: #D1CFCF 3px solid;
	height: 35px;
	padding-top: 0.4em;
}

td:nth-last-child(1), th:nth-last-child(1) {
	border-right: none;
}
</style>

<div class="container w-400">
	<table class="table table-slit" border="1" width="800">
		<thead>
			<tr>
				<th>경기장</th>
				<th>구역</th>
				<th>좌석수</th>
				<th>상세</th>

			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="SeatGroupDto" items="${list}">
				<tr>
					<td>${SeatGroupDto.stadiumName}</td>
					<td>${SeatGroupDto.seatAreaZone}</td>
					<td>${SeatGroupDto.seatCount}</td>
					<td><a href="/admin/seat/listByZone?seatAreaZone=${SeatGroupDto.seatAreaZone}&stadiumName=${SeatGroupDto.stadiumName}">상세</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>