<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container w-100">
	<div class="row">
		${teamDto.teamName}
		${teamDto.teamRegion}
		${teamDto.teamLogo}
	</div>
	<div class="row">
		<a href="list">
			목록으로
		</a>
		<a href="update?teamNo=${teamDto.teamNo}">
			수정
		</a>
		<br>
		<a href="/">
			홈으로
		</a>
		<a href="delete?teamNo=${teamDto.teamNo}">
			<i class="fa-solid fa-trash"></i>
			삭제
		</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    