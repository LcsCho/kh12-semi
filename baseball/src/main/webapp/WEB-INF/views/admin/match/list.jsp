<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>

<style>
table {
	border-collapse: collapse;
}

table th {
	border-top: #62676C 3px solid;
	border-bottom: #62676C 2px solid;
	border-right: #D1CFCF 2px solid;
	background-color: #f1f1f1;
	font-weight: bold;
	height: 40px;
	padding-top: 0.5em;
	font-size: 16px;
	color: #62676C;
	font-weight: bold;
}

table td {
	border-top: #D1CFCF 2px solid;
	border-bottom: #D1CFCF 2px solid;
	border-right: #D1CFCF 3px solid;
	height: 35px;
	padding-top: 0.4em;
}

td:nth-last-child(1), th:nth-last-child(1) {
	border-right: none;
}
</style>

<div class="row">
	<table width="800">
		<thead>
			<tr>
				<th>매치번호</th>
				<th>경기일</th>
				<th>경기장</th>
				<th>홈팀</th>
				<th>어웨이팀</th>
				<th>홈팀스코어</th>
				<th>어웨이스코어</th>
				<th>경기 시각 수정</th>
				<th>경기 결과 입력</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="matchDto" items="${list}" varStatus="status">
				<tr>
					<td><a href="detailMatch?matchNo=${matchDto.matchNo}" class="link">${matchDto.matchNo}</a></td>
					<td><fmt:formatDate value="${matchDto.matchDate}"
							pattern="yyyy-MM-dd HH:mm" /></td>
					<td>${matchDto.stadiumName}</td>
					<td>${matchDto.homeTeam}</td>
					<td>${matchDto.awayTeam}</td>
					<td><c:choose>
							<c:when
								test="${now.time >= matchDto.matchDate.time && now.time <= matchDto.matchDate.time + (3 * 60 * 60 * 1000)}">
                                경기 중(${matchDto.matchHomeScore})
                            </c:when>
							<c:when test="${matchDto.matchDate.time < now.time}">
                                ${matchDto.matchHomeScore}
                            </c:when>
							<c:otherwise>
                                경기 전
                            </c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when
								test="${now.time >= matchDto.matchDate.time && now.time <= matchDto.matchDate.time + (3 * 60 * 60 * 1000)}">
                                경기 중(${matchDto.matchAwayScore})
                            </c:when>
							<c:when test="${matchDto.matchDate.time < now.time}">
                                ${matchDto.matchAwayScore}
                            </c:when>
							<c:otherwise>
                                경기 전
                            </c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when
								test="${now.time >= matchDto.matchDate.time - (3 * 60 * 60 * 1000) && now.time < matchDto.matchDate.time}">
								<a href="insertResult?matchNo=${matchDto.matchNo}" class="link">수정</a>
							</c:when>
							<c:otherwise>
        							수정 불가
   						 </c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when
								test="${now.time >= matchDto.matchDate.time && now.time <= matchDto.matchDate.time + (3 * 60 * 60 * 1000)}">
								<a href="insertResult?matchNo=${matchDto.matchNo}" class="link">점수 입력</a>
							</c:when>
							<c:when test="${matchDto.matchDate.time < now.time}">
                                경기종료
                            </c:when>
							<c:otherwise>
                                경기 전
                            </c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
