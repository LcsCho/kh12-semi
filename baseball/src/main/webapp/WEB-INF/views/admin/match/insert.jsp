<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/insert.css">

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var homeTeamSelect = document.getElementById("homeTeam");
		var awayTeamSelect = document.getElementById("awayTeam");
		var stadiumSelect = document.getElementById("stadiumName");
		var matchDateInput = document
				.querySelector('input[type="datetime-local"]');
		var submitButton = document.querySelector('button.btn-positive');

		// 홈팀과 어웨이팀이 같을 경우 중복 선택 방지
		homeTeamSelect.addEventListener("change", function() {
			var selectedHomeTeam = homeTeamSelect.value;
			var selectedAwayTeam = awayTeamSelect.value;

			if (selectedHomeTeam === selectedAwayTeam) {
				alert("홈팀과 어웨이팀은 동일하게 선택할 수 없습니다.");
				homeTeamSelect.value = ""; // 선택 초기화
			}
		});

		awayTeamSelect.addEventListener("change", function() {
			var selectedHomeTeam = homeTeamSelect.value;
			var selectedAwayTeam = awayTeamSelect.value;

			if (selectedHomeTeam === selectedAwayTeam) {
				alert("홈팀과 어웨이팀은 동일하게 선택할 수 없습니다.");
				awayTeamSelect.value = ""; // 선택 초기화
			}
		});

		// 폼 제출 시 중복 검사
		submitButton.addEventListener("click", function(event) {
			// 중복 검사를 실행하고 중복이 없을 때만 폼 제출 실행
			if (checkDuplicate()) {
				document.querySelector("form").submit();
			} else {
				event.preventDefault(); // 중복이 발견되면 폼 제출 막기
			}
		});
	});
</script>

<form action="insert" method="post" autocomplete="off">
	<table>
	<tr>
		<th>홈팀 선택</th>
			<td><select name="homeTeam" class="form-input w-100" id="homeTeam">
				<option value="">-- 홈팀 선택 --</option>
				<!-- 선택 안 함 옵션 -->
				<c:forEach var="teamDto" items="${teamList}">
					<option value="${teamDto.teamName}">${teamDto.teamName}</option>
				</c:forEach>
			</select> 
			</td>
		</tr>
		<tr>
			<th>어웨이팀 선택</th>
				<td>
					<select name="awayTeam" class="form-input w-100" id="awayTeam">
				<option value="">-- 어웨이팀 선택 --</option>
				<!-- 선택 안 함 옵션 -->
				<c:forEach var="teamDto" items="${teamList}">
					<option value="${teamDto.teamName}">${teamDto.teamName}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<th>경기장 선택</th>
			<td>
		<select name="stadiumName" class="form-input w-100"
				id="stadiumName">
				<option value="">-- 경기장 선택 --</option>
				<c:forEach var="stadiumDto" items="${stadiumList}">
					<option value="${stadiumDto.stadiumName}">${stadiumDto.stadiumName}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<th><label for="matchDate">경기일</label></th>
			<td> <input class="form-input w-100"
					type="datetime-local" name="matchDto.matchDateStr"
					value="${matchDto.matchDate}" required>
			</td>
		</tr>
	</table>
			<button type="submit" class="btn">경기등록</button>
</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
