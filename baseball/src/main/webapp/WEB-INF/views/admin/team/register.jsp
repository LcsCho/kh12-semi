<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/teamSidebar.jsp"></jsp:include>
<form action="register" method="post" enctype="multipart/form-data">
팀 이름 : <input type="text" name="teamName" value="${teamDto.teamName}">
연고지 : <input type="text" name="teamRegion" value="${teamDto.teamRegion}">
<br><br>

로고 이미지 : <input type="file" name="attach" accept="image/*"><br><br>
<button type="submit">등록</button>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
    