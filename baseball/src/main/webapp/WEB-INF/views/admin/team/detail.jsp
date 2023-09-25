<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/teamSidebar.jsp"></jsp:include>
<div class="container w-100">
	<div class="row">
		<img src="image?teamNo=${teamDto.teamNo}" width="200" height="200">
	</div>
	<div class="row mb-50">
		${teamDto.teamName}
		${teamDto.teamRegion}
	</div>
	
	<div class="float-container right">
		<a href="list">
			<i class="fa-solid fa-list fa-2x"></i>
		</a>
		
		<a href="update?teamNo=${teamDto.teamNo}">
			<i class="fa-solid fa-edit fa-2x"></i>
		</a>
		
		<a href="/">
			<i class="fa-solid fa-home fa-2x"></i>
		</a>
		
		<a href="delete?teamNo=${teamDto.teamNo}">
			<i class="fa-solid fa-trash fa-2x"></i>
		</a>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
    