<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>


<div class="row">
	<table class="table table-hover table-border">
		<thead>
			<tr>
				<th>매치번호</th>
				<th>경기일</th>
				<th>경기장</th>
				<th>홈팀</th>
				<th>어웨이팀</th>
				<th>홈팀스코어</th>
				<th>어웨이스코어</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="matchDto" items="${list}">
				<tr>
					<td><a href="detail?matchNo=${matchDto.matchNo}">${matchDto.matchNo}</a></td>
					<td>${matchDto.matchDate}</td>
					<td>${matchDto.stadiumName}</td>
					<td>${matchDto.homeTeam}</td>
					<td>${matchDto.awayTeam}</td>
					<td>${matchDto.matchHomeScore}</td>
					<td>${matchDto.matchAwayScore}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>