<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/stadiumSidebar.jsp"></jsp:include>
<div class="container w-100">
	<div class="row">
		${stadiumDto.stadiumNo}
		${stadiumDto.stadiumName}

	</div>
	<div class="row">
		<a href="list">
			목록으로
		</a>
		<br>
		<a href="update?stadiumNo=${stadiumDto.stadiumNo}">
			수정
		</a>
		<br>
		<a href="/">
			홈으로
		</a>
		<br>
		<a href="delete?stadiumNo=${stadiumDto.stadiumNo}">
			삭제
		</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>