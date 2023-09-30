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
        var stadiumSelect = document.getElementById("stadiumName");
        var matchDateInput = document.querySelector('input[type="datetime-local"]');

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

        // 폼 제출 이벤트 리스너 추가
        var form = document.querySelector("form");
        form.addEventListener("submit", function (event) {
            var selectedHomeTeam = homeTeamSelect.value;
            var selectedAwayTeam = awayTeamSelect.value;
            var selectedStadium = stadiumSelect.value;
            var selectedMatchDate = matchDateInput.value;

            if (selectedHomeTeam === "" || selectedAwayTeam === "" || selectedStadium === "" || selectedMatchDate === "") {
                event.preventDefault(); // 폼 제출 방지
                alert("홈팀, 어웨이팀, 경기장 및 경기일을 모두 입력하세요.");
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
                <option value="">-- 홈팀 선택 --</option> <!-- 선택 안 함 옵션 -->
                <c:forEach var="teamDto" items="${teamList}">
                    <option value="${teamDto.teamName}">${teamDto.teamName}</option>
                </c:forEach>
            </select>

            어웨이팀 선택
            <select name="awayTeam" class="w-100" id="awayTeam">
                <option value="">-- 어웨이팀 선택 --</option> <!-- 선택 안 함 옵션 -->
                <c:forEach var="teamDto" items="${teamList}">
                    <option value="${teamDto.teamName}">${teamDto.teamName}</option>
                </c:forEach>
            </select>
            <br>

            경기장이름 
            <select name="stadiumName" class="w-100" id="stadiumName">
                <option value="">-- 경기장 선택 --</option>
                <c:forEach var="stadiumDto" items="${stadiumList}">
                    <option value="${stadiumDto.stadiumName}">${stadiumDto.stadiumName}</option>
                </c:forEach>
            </select> 
            
            <div class="row">
                <label for="matchDate">경기일</label>
                <input class="w-600" type="datetime-local" name="matchDto.matchDateStr" value="${matchDto.matchDate}" required>
            </div>
            <button class="btn btn-positive">경기등록</button>
        </div>
    </div>
</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
