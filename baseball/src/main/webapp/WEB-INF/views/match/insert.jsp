<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h2>등록</h2>

<form class="join-form" action="" method="post" autocomplete="off">
<div class="container w-600">
    <div class="row">
매치번호<input type="text" name="matchNo" value="${matchDto.matchNo}"><br><br>
경기장번호 <input type="number" name="stadiumNo" value="${matchDto.stadiumNo}"><br><br>
홈팀    <input type="text" name="homeTeam" value="${matchDto.homeTeam}"> <br><br>
어웨이팀 <input type="text" name="awayTeam" value="${matchDto.awayTeam}"><br><br>
경기일 <input type="date" name="matchDate" value="${matchDto.matchDate}"><br><br>
홈팀스코어 <input type="number" name="matchHomeScore" value="${matchDto.matchHomeScore}"><br><br>
어웨이스코어 <input type="number" name="matchAwayScore" value="${matchDto.matchAwayScore}"><br><br>
<br>
<button type="submit" class="btn btn-positive">등록하기</button>   
    </div>

</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>