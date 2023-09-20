<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h2>상세페이지</h2>
<div class="container w-500">
	<div class="row">
		<h1>${matchDto.matchNo} 상세 정보</h1>
	</div>
	
	<div class="row">
		<table class="table table-border table-stripe">
			<tr>
				<th>매치번호</th>
				<td>${matchDto.matchNo}</td>
			</tr>
			<tr>
				<th>경기장번호</th>
				<td>${matchDto.stadiumNo}</td>
			</tr>
			<tr>
				<th>홈팀</th>
				<td>${matchDto.teamHome}</td>
			</tr>
			<tr>
				<th>어웨이팀</th>
				<td>${matchDto.teamAway}</td>
			</tr>
			<tr>
				<th>경기일</th>
				<td>${matchDto.matchDate}</td>
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
		</table>	
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>