<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<table border="1" width="800">
	<thead>
		<tr>
			<th>팀이름</th>
			<th>승</th>
			<th>무</th>
			<th>패</th>
			<th>승률</th>
			<th>게임차</th>
			<th>순위</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="teamDto" items="${list}">
		<tr>
			<td><a href="detail?teamName=${teamDto.teamName}">${teamDto.teamName}</a></td>
			<td>${teamDto.teamWin}</td>
			<td>${teamDto.teamDraw}</td>
			<td>${teamDto.teamLose}</td>
			<td>승률</td>
			<td>게임차</td>
			<td>순위</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    