<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="change" method="post" enctype="multipart/form-data" autocomplete="off">
	<div class="container w-400">
	<div class="row">
	<h2>경기 수정</h2>
	</div>
	매치번호 : <input type="text" name="matchNo" class="form-input w-100" value="${matchDto.matchNo}"><br><br>
	경기장번호 : <input type="text" name="stadiumNo" class="form-input w-100" value="${matchDto.stadiumNo}"><br><br>
	홈팀 : <input type="text" name="teamHome" class="form-input w-100" value="${matchDto.teamHome}"><br><br>
	어웨이팀 : <input type="text" name="teamAway" class="form-input w-100" value="${matchDto.teamAway}"><br><br>
	경기일 : <input type="date" name="matchDate" class="form-input w-100" value="${matchDto.matchDate}"><br><br>
	홈팀스코어 : <input type="text" name="matchHomeScore" class="form-input w-100" value="${matchDto.matchHomeScore}"><br><br>
	어웨이스코어 : <input type="text" name="matchAwayScore" class="form-input w-100" value="${matchDto.matchAwayScore}"><br><br>

	<button type="submit" class="btn btn-positive w-100">등록</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>