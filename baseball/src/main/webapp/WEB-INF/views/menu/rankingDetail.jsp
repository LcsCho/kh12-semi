<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container w-800">
	<div class="row">
		<img src="image?teamNo=${teamDto.teamNo}" width="200" height="200">
	</div>
	<div class="row mb-50">
		${teamDto.teamName}
		${teamDto.teamRegion}
	</div>
	
	<div class="float-container right">
		<a href="ranking">
			<i class="fa-solid fa-list fa-2x"></i>
		</a>
		
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>