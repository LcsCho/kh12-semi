<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<table class="table table-slit" border="1" width="800">
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
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="teamDto" items="${list}" varStatus="loop">
		<tr>
			<td>${loop.index + 1}</td>
			<td><a href="?teamNo=${teamDto.teamNo}">${teamDto.teamName}</a></td>
			<td>${teamDto.teamMatch}</td>
			<td>${teamDto.teamWin}</td>
			<td>${teamDto.teamDraw}</td>
			<td>${teamDto.teamLose}</td>
			<td><fmt:formatNumber value="${teamDto.teamWinRate}" type="number" minFractionDigits="3" maxFractionDigits="3" /></td>
			<td>${teamDto.teamGameGap}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    