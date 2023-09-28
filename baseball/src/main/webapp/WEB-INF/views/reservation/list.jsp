<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/teamSidebar.jsp"></jsp:include>
<div class="row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>예매번호</th>
					<th>열</th>
					<th>행</th>
					<th>좌석번호</th>
					<th>홈팀</th>
					<th>어웨이팀</th>
					<th>예매날짜</th>
					<th>상세</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="reservationVo" items="${list}">
				<tr>
					<td>${reservationVo.reservationNo}</td>
					<td>${reservationVo.seatCol}</td>
					<td>${reservationVo.seatRow}</td>
					<td>${reservationVo.seatNo}</td>
					<td>${reservationVo.homeTeam}</td>	
					<td>${reservationVo.awayTeam}</td>
					<td>${reservationVo.reservationDate}</td>
					<td></td>
					<td></td>
					</tr>
					</c:forEach>
					</table>
					</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>