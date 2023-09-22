<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/teamSidebar.jsp"></jsp:include>
<form action="update" method="post">
<input type="hidden" name="teamNo" value="${teamDto.teamNo}">
팀이름 <input type="text" name="teamName" value="${teamDto.teamName}">
연고지 <input type="text" name="teamRegion" value="${teamDto.teamRegion}">

<button type="submit">수정</button>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>