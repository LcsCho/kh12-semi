<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
		padding-top: 0.6em;
		font-size: 16px;
		color: #62676C;
		font-weight: bold;
	}
	
	table td {
		border-top: #D1CFCF 2px solid;
		border-bottom: #D1CFCF 2px solid;
		border-right: #D1CFCF 3px solid;
		height: 35px;
		text-align: center;
		padding-top: 0.3em;
	}
	
	td:nth-last-child(1), th:nth-last-child(1) {
		border-right: none;
	}
</style>

	<h3>팀 순위</h3>
	<br>

<table width="1000px">
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
			<!-- 			<th>연속</th> -->
<!-- 			<th>최근 10경기</th> -->
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="teamVo" items="${voList}" varStatus="loop">
			<tr>
				<td>
				<c:choose>
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
					</c:choose>
					</td>
				<%-- 				<td style="text-align: center;"><img src="./images/${teamVo.teamName}.jpg" style="max-width: 25px; max-height: 25px; float: center;"><a href="rankingDetail?teamNo=${teamVo.teamNo}" class="link">${teamVo.teamName}</a></td> --%>

				<td>
					<div style="text-align: center;">
						<img src="./images/${teamVo.teamName}.jpg"
							style="max-width: 25px; max-height: 25px;">${teamVo.teamName}
					</div>
				</td>
				<td>${teamVo.teamMatch}</td>
				<td>${teamVo.teamWin}</td>
				<td>${teamVo.teamDraw}</td>
				<td>${teamVo.teamLose}</td>
				<td><fmt:formatNumber value="${teamVo.teamWinRate}"
						type="number" minFractionDigits="3" maxFractionDigits="3" /></td>
				<td>${teamVo.teamGameGap}</td>
				<!-- 				<td>?</td> -->
				<%-- 				<c:choose> --%>
				<%-- 					<c:when test="${teamVo.sequenceWin > 0}"> --%>
				<%-- 						<td>${teamVo.sequenceWin}승</td> --%>
				<%-- 					</c:when> --%>
				<%-- 					<c:when test="${teamVo.sequenceDraw > 0}"> --%>
				<%-- 						<td>${teamVo.sequenceDraw}무</td> --%>
				<%-- 					</c:when> --%>
				<%-- 					<c:when test="${teamVo.sequenceLose > 0}"> --%>
				<%-- 						<td>${teamVo.sequenceLose}패</td> --%>
				<%-- 					</c:when> --%>
				<%-- 					<c:otherwise> --%>
				<!-- 						<td>0</td> -->
				<%-- 					</c:otherwise> --%>
				<%-- 				</c:choose> --%>
<%-- 				<td>${teamVo.recentWin}승-${teamVo.recentLose}패-${teamVo.recentDraw}무</td> --%>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
