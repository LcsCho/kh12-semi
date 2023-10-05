<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>
<form action="insertResult" method="post" autocomplete="off">
	<div class="container w-500">
		<div class="row">
			<h1>경기결과 입력</h1>
		</div>

		<div class="row">
			<table class="table table-border table-stripe">
				<tr>
					<th>매치번호</th>
					<td>${matchDto.matchNo}
					<input type="hidden" name="matchNo"
						value="${matchDto.matchNo}">
					</td>
				</tr>
				<tr>
					<th>경기일</th>
					<td>${matchDto.matchDate}</td>
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
					<td><input type="number" name="matchHomeScore"
						value="${matchDto.matchHomeScore}"><br> <br></td>
				</tr>
				<tr>
					<th>어웨이스코어</th>
					<td><input type="number" name="matchAwayScore"
						value="${matchDto.matchAwayScore}"><br> <br></td>
				</tr>
			</table>
			<button class="btn btn-positive">경기결과등록</button>
		</div>
		<div class="row">
			<a href="list">목록으로</a>  
			<br> 
			<a href="/admin/home">관리자 홈으로</a>
		</div>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>