<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<c:set var="formattedMatchDate"
	value='<fmt:formatDate value="${reservationVo.matchDate}" pattern="yyyy-MM-dd HH:mm" />' />
<style>
table {
	border-collapse: collapse;
}

table th {
	border-top: #62676C 3px solid;
	border-bottom: #62676C 2px solid;
	background-color: #f1f1f1;
	font-weight: bold;
	height: 40px;
	padding-top: 0.5em;
	font-size: 16px;
	font-weight: bold;
}

table td {
	border-top: #D1CFCF 2px solid;
	border-bottom: #D1CFCF 2px solid;
	height: 40px;
	padding-top: 0.6em;
	font-size: 16px;
	color: #62676C;
	font-weight: bold;
}

td:nth-last-child(1), th:nth-last-child(1) {
	border-right: none;
}

td:nth-child(2) {
	font-weight: bold;
	color: #454545;
}

.custom-checkbox {
	display: inline-block;
	font-size: 18px;
	position: relative;
}

.custom-checkbox>[type=checkbox] {
	display: none;
}

.custom-checkbox>span {
	display: block;
	width: 1em;
	height: 1em;
	background-image: url("/images/checkbox-empty.png");
	background-size: 100%;
	background-position: center;
	background-repeat: no-repeat;
}

.custom-checkbox>[type=checkbox]:checked+span {
	background-image: url("/images/checkbox-check.png");
}

.search-box {
	background-color: #f1f1f1;
	border: #D1CFCF 2px solid;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 80px;
}

.form-input {
	height: 40px;
	font-size: 15px;
	margin: 0 10px;
}

.form-input.tite {
	width: 120px;
}

.btn, .btn.btn-positive {
	width: 100px;
	height: 40px;
	font-size: 14px;
	border-radius: 0px;
}

.btn.row {
	padding-top: 0.8em;
}
</style>
<script>
	// 포맷팅된 날짜를 JavaScript 변수에 할당
	var formattedMatchDate = "${formattedMatchDate}";

	// JavaScript에서 변수를 사용
	console.log("포맷팅된 날짜: " + formattedMatchDate);
</script>




<div class="row">
	<form action="delete" method="post">
			<div class="row right ">
			<button type="submit" class="btn btn-negative delete-btn ">예매 취소</button>
		</div>
		<table class="table table-hover table-border">

			<thead>
				<tr>
					<th></th>
					<th>예매번호</th>
					<th>좌석번호</th>
					<th>경기장</th>
					<th>홈팀</th>
					<th>어웨이팀</th>
					<th>예매날짜</th>
					<th>상세</th>
				</tr>
			</thead>
			<tbody align="center">

				<c:forEach var="reservationVo" items="${list}">
					<c:set var="currentDate" value="<%=new java.util.Date()%>" />
					<c:set var="twoHoursThirtyMinutes" value="9000000" />
					<!-- 2시간 30분을 밀리초로 계산 -->

					<c:choose>
						<c:when
							test="${reservationVo.matchDate.time - currentDate.time <= twoHoursThirtyMinutes}">
							<tr>
								<td><input type="checkbox" class="check-item" name="reservationNo"
									data-match-date="${reservationVo.matchDate}"
									value="${reservationVo.reservationNo}" disabled="disabled"></td>
								<td>${reservationVo.reservationNo}</td>
								<td>${reservationVo.seatAreaZone}-${reservationVo.seatRow}-${reservationVo.seatCol}</td>
								<td>${reservationVo.stadiumName}</td>
								<td>${reservationVo.homeTeam}</td>
								<td>${reservationVo.awayTeam}</td> 
								<td><fmt:formatDate
										value="${reservationVo.reservationDate}"
										pattern="y년 M월 d일 E HH시 mm분 ss초" /></td>
								
								<td><a
									href="/reservation/detail?reservationNo=${reservationVo.reservationNo}">상세</a></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td><input type="checkbox" class="check-item" name="reservationNo"
									data-match-date="${reservationVo.matchDate}"
									value="${reservationVo.reservationNo}"></td>
								<td>${reservationVo.reservationNo}</td>
								<td>${reservationVo.seatAreaZone}-${reservationVo.seatRow}-${reservationVo.seatCol}</td>
								<td>${reservationVo.stadiumName}</td>
								<td>${reservationVo.homeTeam}</td>
								<td>${reservationVo.awayTeam}</td>
								<td><fmt:formatDate
										value="${reservationVo.reservationDate}"
										pattern="y년 M월 d일 E HH시 mm분 ss초" /></td>
								
								<td><a
									href="/reservation/detail?reservationNo=${reservationVo.reservationNo}">상세</a></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>

	</form>
</div>
<div class="row page-navigator mv-30">
	<!-- 이전 버튼 -->
	<c:if test="${!vo.first}">
		<a href="list?${vo.prevQueryString}"> <i
			class="fa-solid fa-angle-left"></i>
		</a>
	</c:if>

	<!-- 숫자 버튼 -->
	<c:forEach var="i" begin="${vo.begin}" end="${vo.end}" step="1">
		<c:choose>
			<c:when test="${vo.page == i}">
				<a class="on">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="list?${vo.getQueryString(i)}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!-- 다음 버튼 -->
	<c:if test="${!vo.last}">
		<a href="list?${vo.nextQueryString}"> <i
			class="fa-solid fa-angle-right"></i>
		</a>
	</c:if>
</div>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>