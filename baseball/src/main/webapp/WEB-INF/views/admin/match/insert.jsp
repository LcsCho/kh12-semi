<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>
<h2>등록</h2>
<form action="insert" method="post" autocomplete="off">
	<div class="container w-600">
		<div class="row">
			<br>
			홈팀 선택
			<select name="homeTeam" class="w-100" id="homeTeam">
				<c:forEach var="teamDto" items="${teamList}">
					<option value="${teamDto.teamName}">${teamDto.teamName}</option>
				</c:forEach>
			</select>

			어웨이팀 선택
			<select name="awayTeam" class="w-100" id="awayTeam">
				<c:forEach var="teamDto" items="${teamList}">
					<option value="${teamDto.teamName}">${teamDto.teamName}</option>
				</c:forEach>
			</select>
			<br>
			
			경기장이름 
			<select name="stadiumName" class="w-100" id="stadiumName">
				<c:forEach var="stadiumDto" items="${stadiumList}">
					<option value="${stadiumDto.stadiumName}">${stadiumDto.stadiumName}</option>
				</c:forEach>
			</select> 
			
            <div class="row">
                <label for="matchDate">경기일</label>
                <input class="w-600" type="datetime-local" name="matchDate" value="${matchDto.matchDate}">
            </div>
			<button class="btn btn-positive">경기등록</button>
		</div>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>