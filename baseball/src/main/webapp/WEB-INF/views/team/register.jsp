<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<form action="register" method="post">
팀이름 <input type="text" name="teamName" value="${teamDto.teamName}">
연고지 <input type="text" name="teamRegion" value="${teamDto.teamRegion}">

<button type="submit">등록</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    