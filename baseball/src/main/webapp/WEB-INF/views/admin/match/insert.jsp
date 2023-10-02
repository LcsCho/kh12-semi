<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var homeTeamSelect = document.getElementById("homeTeam");
        var awayTeamSelect = document.getElementById("awayTeam");
        var stadiumSelect = document.getElementById("stadiumName");
        var matchDateInput = document.querySelector('input[type="datetime-local"]');
        var submitButton = document.querySelector('button.btn-positive');

        
        // 홈팀과 어웨이팀 선택 시 중복 검사
        homeTeamSelect.addEventListener("change", checkDuplicate);
        awayTeamSelect.addEventListener("change", checkDuplicate);

        // 폼 제출 시 중복 검사
        submitButton.addEventListener("click", function (event) {
            // 중복 검사를 실행하고 중복이 없을 때만 폼 제출 실행
            if (checkDuplicate()) {
                document.querySelector("form").submit();
            } else {
                event.preventDefault(); // 중복이 발견되면 폼 제출 막기
            }
        });

        function checkDuplicate() {
            var matchDateValue = matchDateInput.value;
            var currentDate = new Date();
            var selectedDate = new Date(matchDateValue);

            if (selectedDate < currentDate) {
                alert("경기일을 현재 시간 이전으로 선택할 수 없습니다.");
                return false;
            }

            // AJAX 요청을 통해 중복 여부 확인
            $.ajax({
                url: "/rest/match/matchCheck",
                type: "POST",
                data: {
                    matchDate: $("[name=homeTeam]").val(),
                    homeTeam: $("[name=awayTeam]").val(),
                    awayTeam: $("[name=matchDate]").val(),
                    stadiumName: $("[name=stadiumName]").val()
                },
                success: function (response) {
                    if (response === "N") {
                        alert("이미 예정된 경기가 있습니다. 다른 날짜 또는 팀을 선택하세요.");
                    }
                    // 중복이 없는 경우와 요청 실패 시 버튼 활성화
                    submitButton.disabled = response === "N";
                },
                error: function () {
                    // 요청 실패 시 버튼 활성화
                    submitButton.disabled = false;
                }
            });

            return true; // 중복 여부 확인 중
        }
    });
</script>

<h2>등록</h2>
<form action="insert" method="post" autocomplete="off">
    <div class="container w-600">
        <div class="row">
            <br> 홈팀 선택 <select name="homeTeam" class="w-100" id="homeTeam">
                <option value="">-- 홈팀 선택 --</option>
                <!-- 선택 안 함 옵션 -->
                <c:forEach var="teamDto" items="${teamList}">
                    <option value="${teamDto.teamName}">${teamDto.teamName}</option>
                </c:forEach>
            </select> 어웨이팀 선택 <select name="awayTeam" class="w-100" id="awayTeam">
                <option value="">-- 어웨이팀 선택 --</option>
                <!-- 선택 안 함 옵션 -->
                <c:forEach var="teamDto" items="${teamList}">
                    <option value="${teamDto.teamName}">${teamDto.teamName}</option>
                </c:forEach>
            </select> <br> 경기장이름 <select name="stadiumName" class="w-100"
                id="stadiumName">
                <option value="">-- 경기장 선택 --</option>
                <c:forEach var="stadiumDto" items="${stadiumList}">
                    <option value="${stadiumDto.stadiumName}">${stadiumDto.stadiumName}</option>
                </c:forEach>
            </select>

            <div class="row">
                <label for="matchDate">경기일</label> <input class="w-600"
                    type="datetime-local" name="matchDto.matchDateStr"
                    value="${matchDto.matchDate}" required>
            </div>
            <button class="btn btn-positive">경기등록</button>
        </div>
    </div>
</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
