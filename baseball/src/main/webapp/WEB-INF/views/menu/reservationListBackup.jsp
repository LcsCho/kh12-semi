<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>


  .btn-end,
    .btn-ing,
    .btn-before {
        font-size: 16px;
        margin: 0.5em;
        border-radius: 5px;
        background-color: #CCCCCC;
        border: none;
    }

    .btn-end {
        color: #fa2828;
    }

    .btn.btn-end {
        /*마우스가 버튼에 올라가면 배경을 조금 더 어둡게*/
        filter: brightness(100%);
    }
    
    .btn-ing{
        background-color: #fa2828;
        color: #ffffff;
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
	border-bottom: 1px solid #000;
}

.day {
	font-size: 24px;
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

.container> .row {
	display: flex; /* 요소들을 가로로 나열하기 위해 flex를 사용합니다. */
	justify-content: space-between; /* 요소들을 양쪽 끝으로 정렬합니다. */
	align-items: center; /* 요소들을 수직 가운데 정렬합니다. */
	flex-wrap: wrap; /* 행이 넘칠 경우 다음 줄로 넘어갈 수 있도록 설정합니다. */
}
</style>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const currentDateElement = document.getElementById('currentDate');
    const matches = document.querySelectorAll('.flex-container');

    function updateMatchDisplay(selectedDate) {
        currentDateElement.textContent = formatDate(selectedDate);

        matches.forEach(match => {
            const matchDate = new Date(match.getAttribute('data-match-date'));
            match.style.display = matchDate.toDateString() === selectedDate.toDateString() ? 'flex' : 'none';
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
	<c:forEach var="matchVo" items="${voList}">
		<div class="flex-container" data-match-date="<fmt:formatDate value='${matchVo.matchDate}' pattern='yyyy-MM-dd' />">
			<div class="col-7-2">
				<div class="col-2 left">
					(
					<fmt:formatDate value="${matchVo.matchDate}" pattern="EEE" />
					)
				</div>
				<div class="col-2 left">
					<fmt:formatDate value="${matchVo.matchDate}" pattern="HH:mm" />
				</div>
			</div>
			<div class="col-7-4">
				<c:choose>
					<c:when test="${matchVo.matchDate.time <= now.time}">
						<div class="font">${matchVo.homeTeam}
							(${matchVo.matchHomeScore})</div>
					</c:when>
					<c:otherwise>
						<div class="font">${matchVo.homeTeam}</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-7">
				<img src="./images/${matchVo.homeTeam}.jpg" width="90%">
			</div>
			<div class="col-7">
				<div class="vs">VS</div>
				<div class="font-2">${matchVo.stadiumName}</div>
			</div>
			<div class="col-7">
				<img src="./images/${matchVo.awayTeam}.jpg" width="90%">
			</div>
			<div class="col-7-4">
				<c:choose>
					<c:when test="${matchVo.matchDate.time <= now.time}">
						<div class="font">(${matchVo.matchAwayScore})
							${matchVo.awayTeam}</div>
					</c:when>
					<c:otherwise>
						<div class="font">${matchVo.awayTeam}</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-7-5">
				<div class="row">
					<c:choose>
						<c:when test="${now.time >= matchVo.matchDate.time}">
                                <div class="btn btn-end">예매마감</div>
                            </c:when>
						<c:when
							test="${now.time >= matchVo.matchDate.time - (4 * 24 * 60 * 60 * 1000)}">
							<a href="/reservation/insert?matchNo=${matchVo.matchNo}" class="btn btn-ing">예매하기</a>
						</c:when>
						<c:otherwise>
                                <div class="btn btn-before">오픈예정</div>
                            </c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
