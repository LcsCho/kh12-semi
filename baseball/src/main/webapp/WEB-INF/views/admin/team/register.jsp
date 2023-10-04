<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/teamSidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/insert.css">

<form action="register" method="post" enctype="multipart/form-data">
<table>

<tr>
	<th>팀 이름</th>
		<td>
		<input type="text" name="teamName" value="${teamDto.teamName}" class="form-input w-100" >
		</td>
</tr>
<tr>
	<th>연고지</th>
	<td>
	<input type="text" name="teamRegion" value="${teamDto.teamRegion}" class="form-input w-100">
	</td>
</tr>
<tr>
	<th>로고 이미지</th>
	<td>
	<input type="file" name="attach" accept="image/*" placeholder="로고 이미지" >
	</td>
</tr>

</table>
<div class="row">
	<button type="submit" class="btn">팀 등록</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
    