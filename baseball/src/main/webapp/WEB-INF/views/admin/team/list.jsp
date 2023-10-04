<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/teamSidebar.jsp"></jsp:include>

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

<table width="800">
	<thead>
		<tr>
			<th>순위</th>
			<th>팀명</th>
			<th>경기</th>
			<th>승</th>
			<th>무</th>
			<th>패</th>
			<th>승률</th>
			<th>게임차</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="teamDto" items="${list}" varStatus="loop">
		<tr>
			<td>${loop.index + 1}</td>
			<td><a href="detail?teamNo=${teamDto.teamNo}" class="link">${teamDto.teamName}</a></td>
			<td>${teamDto.teamMatch}</td>
			<td>${teamDto.teamWin}</td>
			<td>${teamDto.teamDraw}</td>
			<td>${teamDto.teamLose}</td>
			<td><fmt:formatNumber value="${teamDto.teamWinRate}" type="number" minFractionDigits="3" maxFractionDigits="3" /></td>
			<td>${teamDto.teamGameGap}</td>
			<td>
						<a href="update?teamNo=${teamDto.teamNo}" class="link">수정</a>
						<a href="delete?teamNo=${teamDto.teamNo}" class="link">삭제</a>  
					</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
    