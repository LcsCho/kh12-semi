<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

.teamlogo {
	width: 30%;
	margin-right: -2em;
	margin-left: 2em;
}

.notice {
	margin-left: -1.5em;
	width: 70%;
	height: 180px;
	box-shadow: 0px 0px 0px 2px #D1CFCF;
}

.team-notice {
	width: 20%;
	color: #1AA8BB;
	font-weight: bold;
	font-size: 20px;
	padding-left: 2em;
	padding-top: 4em;
}

.pre-notice {
	padding-left: 1em;
	padding-top: 2em;
	width: 80%;
	color: #62676C;
}

.btn {
	font-size: 18px;
	margin: 0.5em;
	border-radius: 5px;
	background-color: #bf0838;
	color: white;
	border: none;
}

.team-choice {
	margin-left: -1.5em;
	height: 60px;
}

.doosan, .lg {
	margin-left: 2em;
	font-size: 20px;
	border-radius: 5px;
	background-color: #110f29;
	color: white;
	margin-bottom: 2em;
	width: 80px;
	'
}

.doosan {
	margin-left: 2em;
	background-color: #110f29;
}

.lg {
	background-color: #bf0838;
	margin-left: 0em;
	text-align: center;
}

table {
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

td {
	border-bottom: 1px solid #D1CFCF;
	padding: 3px;
	width: 900px;
	height: 130px;
}

.flex-container {
	padding-top: 0.3em;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.day {
	font-size: 30px;
	font-weight: bold;
}

.vs {
	font-size: 30px;
	color: #878787;
}

.col-2.left {
	font-size: 18px;
	font-weight: bold;
	color: #878787;
}

.font {
	font-size: 20px;
	font-weight: bold;
	color: #404040;
}

.font-2 {
	font-size: 15px;
	font-weight: bold;
	color: #404040;
}

.col-7-1, .col-7-5 {
	width: 25%;
}

.col-7-2 {
	width: 18%;
}

.col-7-4 {
	width: 30%;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function () {
    // 초기 로딩 시 오늘 날짜로 경기 필터링
    var currentDate = new Date();
    filterMatchesByDate(currentDate);

    // 이전 경기 보기 버튼 클릭 시
    document.getElementById('previousButton').addEventListener('click', function () {
        currentDate.setDate(currentDate.getDate() - 1); // 어제로 날짜 변경
        filterMatchesByDate(currentDate);
    });

    // 다음 경기 보기 버튼 클릭 시
    document.getElementById('nextButton').addEventListener('click', function () {
        currentDate.setDate(currentDate.getDate() + 1); // 내일로 날짜 변경
        filterMatchesByDate(currentDate);
    });

    function filterMatchesByDate(selectedDate) {
        // 현재 날짜 표시 업데이트
        document.getElementById('currentDate').textContent = formatDate(selectedDate);

        // 선택한 날짜를 기준으로 경기를 필터링하여 표시
        var matches = document.querySelectorAll('.row.flex-container');
        matches.forEach(function (match) {
            var matchDate = new Date(match.getAttribute('data-match-date'));
            var matchDisplay = match.style;

            // 날짜를 비교하여 해당하지 않는 경기 숨김
            var isMatchingDate = matchDate.getDate() === selectedDate.getDate() &&
                matchDate.getMonth() === selectedDate.getMonth() &&
                matchDate.getFullYear() === selectedDate.getFullYear();
            
            matchDisplay.display = isMatchingDate ? 'block' : 'none';
        });
    }

    function formatDate(date) {
        // 날짜를 'YYYY년 MM월 DD일' 형식으로
        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var day = date.getDate().toString().padStart(2, '0');

        return year + '년 ' + month + '월 ' + day + '일';
    }
});
</script>

<div class="container w-1000">
    <div class="float-container">
        <div class="col-2 notice">
            <div class="float-container">
                <div class="col-2 team-notice">구단공지</div>
                <div class="col-2 pre-notice">
                    <pre>
* 온라인 구매는 경기 시작 1시간 후 까지 예매 가능
(단, 경기 시작 2시간 30분 전부터는 취소는 불가하오니 예매 시 참고)
* 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
* 36개월 이상 어린이는 티켓 구매 후 입장 가능.
* 권종선택 실수로 인한 예매권은 현장에서 교환/환불 불가합니다.
(현장에서 재구매 해야합니다.)
                    </pre>
                </div>
            </div>
        </div>
    </div>

    <!-- 이전 경기 보기 버튼 -->
    <button id="previousButton">&lt;</button>

    <!-- 현재 날짜 표시 -->
    <div id="currentDate"></div>

    <!-- 다음 경기 보기 버튼 -->
    <button id="nextButton">&gt;</button>

     <table>
       <tbody>
            <c:forEach var="matchDto" items="${voList}" varStatus="status">
                <tr>
                    <td>
                        <div class="row flex-container" data-match-date="<fmt:formatDate value='${matchDto.matchDate}' pattern='yyyy-MM-dd' />">
                            <div class="row col-7-2">
                                <div class="col-2 left">(<fmt:formatDate value="${matchDto.matchDate}" pattern="EEE" />)</div>
                                <div class="col-2 left"><fmt:formatDate value="${matchDto.matchDate}" pattern="HH:mm" /></div>
                            </div>
                            <div class="row col-7-4">
                                <!-- 경기 정보 표시 -->
                                <div class="font">${matchDto.homeTeam} (${matchDto.matchHomeScore}) vs ${matchDto.awayTeam} (${matchDto.matchAwayScore})</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                                <div class="font-2">${matchDto.stadiumName}</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7-5">
                                <c:choose>
                                    <c:when test="${now.time >= matchDto.matchDate.time}">
                                        <div class="btn reservation">예매 불가</div>
                                    </c:when>
                                    <c:when test="${now.time >= matchDto.matchDate.time - (4 * 24 * 60 * 60 * 1000)}">
                                        <div class="btn reservation"><a href="/reservation/insert?matchNo=${matchDto.matchNo}">예매하기</a></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="btn reservation">예매전</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>