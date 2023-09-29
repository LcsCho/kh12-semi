<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			<th>연속</th>
			<th>최근 10경기</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="teamVo" items="${voList}" varStatus="loop">
			<tr>
				<td><c:choose>
						<c:when test="${loop.index == 0}">
							<i class="fa-solid fa-medal"
								style="color: #ffd700; font-size: 20px;"></i>
						</c:when>
						<c:when test="${loop.index == 1}">
							<i class="fa-solid fa-medal"
								style="color: #c0c0c0; font-size: 20px;"></i>
						</c:when>
						<c:when test="${loop.index == 2}">
							<i class="fa-solid fa-medal"
								style="color: #800000; font-size: 20px;"></i>
						</c:when>
						<c:otherwise>
						${loop.index + 1}
					</c:otherwise>
					</c:choose></td>
				<td><a href="?teamNo=${teamVo.teamNo}">${teamVo.teamName}</a></td>
				<td>${teamVo.teamMatch}</td>
				<td>${teamVo.teamWin}</td>
				<td>${teamVo.teamDraw}</td>
				<td>${teamVo.teamLose}</td>
				<td><fmt:formatNumber value="${teamVo.teamWinRate}"
						type="number" minFractionDigits="3" maxFractionDigits="3" /></td>
				<td>${teamVo.teamGameGap}</td>
<!-- 				<td>?</td> -->
				<c:choose>
					<c:when test="${teamVo.consequenceWin > 0}">
						<td>${teamVo.consequenceWin}승</td>
					</c:when>
					<c:when test="${teamVo.consequenceDraw > 0}">
						<td>${teamVo.consequenceDraw}무</td>
					</c:when>
					<c:when test="${teamVo.consequenceLose > 0}">
						<td>${teamVo.consequenceLose}패</td>
					</c:when>
					<c:otherwise>
						<td>0</td>
					</c:otherwise>
				</c:choose>
				<td>${teamVo.recentWin}승-${teamVo.recentLose}패-${teamVo.recentDraw}무</td>
				<td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
