<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>

<div class="container w-500">
	<div class="row">
		<h1>경기결과</h1>
	</div>

	<div class="row">
		<table class="table table-border table-stripe">
			<tr>
				<th>매치번호</th>
				<td>${matchDto.matchNo}</td>
			</tr>
			<tr>
				<th>경기일</th>
				<td><fmt:formatDate value="${matchDto.matchDate}"
						pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
			<tr>
				<th>경기장</th>
				<td>${matchDto.stadiumName}</td>
			</tr>
			<tr>
				<th>홈팀</th>
				<td>${matchDto.homeTeam}</td>
			</tr>
			<tr>
				<th>어웨이팀</th>
				<td>${matchDto.awayTeam}</td>
			</tr>
			<tr>
				<th>홈팀스코어</th>
				<td>${matchDto.matchHomeScore}</td>
			</tr>
			<tr>
				<th>어웨이스코어</th>
				<td>${matchDto.matchAwayScore}</td>
			</tr>

		</table>
	</div>
	<div class="row">
		<a href="list"> 목록으로 </a> <a href="change?matchNo=${matchDto.matchNo}">
			수정 </a> <br> <a href="/"> 홈으로 </a>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>