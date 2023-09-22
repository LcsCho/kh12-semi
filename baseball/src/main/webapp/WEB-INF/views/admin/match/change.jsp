<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<form action="change" method="post" enctype="multipart/form-data" autocomplete="off">
	<div class="container w-400">
	<div class="row">
	<h2>경기 수정</h2>
	</div>
	매치번호 : <input type="text" name="matchNo" class="form-input w-100" value="${matchDto.matchNo}" readonly><br><br>
	경기장일 : <input type="text" name="matchDate" class="form-input w-100" value="${matchDto.matchDate}" readonly><br><br>
	경기장 : <input type="date" name="stadiumName" class="form-input w-100" value="${matchDto.stadiumName}"><br><br>
	홈팀 : <input type="text" name="homeTeam" class="form-input w-100" value="${matchDto.homeTeam}" readonly><br><br>
	어웨이팀 : <input type="text" name="awayTeam" class="form-input w-100" value="${matchDto.awayTeam}" readonly><br><br>
	홈팀스코어 : <input type="number" name="matchHomeScore" class="form-input w-100" value="${matchDto.matchHomeScore}"><br><br>
	어웨이스코어 : <input type="number" name="matchAwayScore" class="form-input w-100" value="${matchDto.matchAwayScore}"><br><br>

	<button type="submit" class="btn btn-positive w-100">등록</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>