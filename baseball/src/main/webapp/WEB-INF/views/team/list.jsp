<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<table border="1" width="800">
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
		<c:forEach var="teamDto" items="${list}">
		<tr>
			<td>순위</td>
			<td><a href="detail?teamNo=${teamDto.teamNo}">${teamDto.teamName}</a></td>
			<td>경기</td>
			<td>${teamDto.teamWin}</td>
			<td>${teamDto.teamDraw}</td>
			<td>${teamDto.teamLose}</td>
			<td>승률</td>
			<td>게임차</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    