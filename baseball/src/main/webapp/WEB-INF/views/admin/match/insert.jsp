<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 홈팀과 어웨이팀 선택 엘리먼트 가져오기
        var homeTeamSelect = document.getElementById("homeTeam");
        var awayTeamSelect = document.getElementById("awayTeam");

        // 홈팀과 어웨이팀이 같을 경우 중복 선택 방지
        homeTeamSelect.addEventListener("change", function () {
            var selectedHomeTeam = homeTeamSelect.value;
            var selectedAwayTeam = awayTeamSelect.value;

            if (selectedHomeTeam === selectedAwayTeam) {
                alert("홈팀과 어웨이팀은 동일하게 선택할 수 없습니다.");
                homeTeamSelect.value = ""; // 선택 초기화
            }
        });

        awayTeamSelect.addEventListener("change", function () {
            var selectedHomeTeam = homeTeamSelect.value;
            var selectedAwayTeam = awayTeamSelect.value;

            if (selectedHomeTeam === selectedAwayTeam) {
                alert("홈팀과 어웨이팀은 동일하게 선택할 수 없습니다.");
                awayTeamSelect.value = ""; // 선택 초기화
            }
        });
    });
</script>

<h2>등록</h2>
<form action="insert" method="post" autocomplete="off">
	<div class="container w-600">
		<div class="row">
			<br>
			홈팀 선택
			<select name="homeTeam" class="w-100" id="homeTeam">
				<c:forEach var="teamDto" items="${teamList}">
					<option value="${teamDto.teamName}">${teamDto.teamName}</option>
				</c:forEach>
			</select>

			어웨이팀 선택
			<select name="awayTeam" class="w-100" id="awayTeam">
				<c:forEach var="teamDto" items="${teamList}">
					<option value="${teamDto.teamName}">${teamDto.teamName}</option>
				</c:forEach>
			</select>
			<br>
			
			경기장이름 
			<select name="stadiumName" class="w-100" id="stadiumName">
				<c:forEach var="stadiumDto" items="${stadiumList}">
					<option value="${stadiumDto.stadiumName}">${stadiumDto.stadiumName}</option>
				</c:forEach>
			</select> 
			
            <div class="row">
                <label for="matchDate">경기일</label>
                <input class="w-600" type="datetime-local" name="matchDto.matchDateStr" value="${matchDto.matchDate}">
            </div>
			<button class="btn btn-positive">경기등록</button>
		</div>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>