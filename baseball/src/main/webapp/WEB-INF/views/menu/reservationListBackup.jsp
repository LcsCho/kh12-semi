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

.row {
	display: flex; /* 요소들을 가로로 나열하기 위해 flex를 사용합니다. */
	justify-content: space-between; /* 요소들을 양쪽 끝으로 정렬합니다. */
	align-items: center; /* 요소들을 수직 가운데 정렬합니다. */
}
</style>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const currentDateElement = document.getElementById('currentDate');
    const matches = document.querySelectorAll('.row.flex-container');

    function updateMatchDisplay(selectedDate) {
        currentDateElement.textContent = formatDate(selectedDate);

        matches.forEach(match => {
            const matchDate = new Date(match.getAttribute('data-match-date'));
            match.style.display = matchDate.toDateString() === selectedDate.toDateString() ? 'block' : 'none';
        });
    }

    function formatDate(date) {
        return date.toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric' });
    }

    const currentDate = new Date();
    updateMatchDisplay(currentDate);

    document.getElementById('previousButton').addEventListener('click', () => {
        currentDate.setDate(currentDate.getDate() - 1);
        updateMatchDisplay(currentDate);
    });

    document.getElementById('nextButton').addEventListener('click', () => {
        currentDate.setDate(currentDate.getDate() + 1);
        updateMatchDisplay(currentDate);
    });
});
</script>

<div class="container w-400 center">
	<div class="row">
		<button class="btn" id="previousButton">&lt;</button>
		<div id="currentDate" class="day"></div>
		<button class="btn" id="nextButton">&gt;</button>
	</div>
</div>
<div class="container w-800 center">
	<table>
		<tbody>
			<c:forEach var="matchVo" items="${voList}">
				<tr>
					<td>
						<div class="row flex-container"
							data-match-date="<fmt:formatDate value='${matchVo.matchDate}' pattern='yyyy-MM-dd' />">
							<div class="row col-7-2">
								<div class="col-2 left">
									(
									<fmt:formatDate value="${matchVo.matchDate}" pattern="EEE" />
									)
								</div>
								<div class="col-2 left">
									<fmt:formatDate value="${matchVo.matchDate}" pattern="HH:mm" />
								</div>
							</div>
							<div class="row col-7-4">
								<div class="font">${matchVo.homeTeam}
									(${matchVo.matchDate.time >= now.time ? matchVo.matchHomeScore : ''})</div>
							</div>
							<div class="row col-7">
								<img src="./images/${matchVo.homeTeamNo}.jpg" width="90%">
							</div>
							<div class="row col-7">
								<div class="vs">VS</div>
								<div class="font-2">${matchVo.stadiumName}</div>
							</div>
							<div class="row col-7">
								<img src="./images/${matchVo.awayTeamNo}.jpg" width="90%">
							</div>
							<div class="row col-7-4">
								<div class="font">(${matchVo.matchDate.time >= now.time ? matchVo.matchAwayScore : ''})
									${matchVo.awayTeam}</div>
							</div>
							<div class="row col-7-5">
								<div class="btn reservation">
									<c:choose>
										<c:when test="${now.time >= matchVo.matchDate.time}">
                                            예매 불가
                                        </c:when>
										<c:when
											test="${now.time >= matchVo.matchDate.time - (4 * 24 * 60 * 60 * 1000)}">
											<a href="/reservation/insert?matchNo=${matchVo.matchNo}">예매하기</a>
										</c:when>
										<c:otherwise>
                                            예매전
                                        </c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>