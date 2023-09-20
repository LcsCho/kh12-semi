<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<div class="container w-500">
	<div class="row">
		<h1>${memberDto.memberId} 님의 회원 정보</h1>
	</div>
	
	<div class="row">
		<table class="table table-border table-stripe">
			<tr>
				<th>닉네임</th>
				<td>${memberDto.memberNick}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${memberDto.memberEmail}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${memberDto.memberTel}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${memberDto.memberBirth}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					[${memberDto.memberPost}]
					${memberDto.memberAddr1}
					${memberDto.memberAddr2}
				</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${memberDto.memberLevel}</td>
			</tr>
			<tr>
				<th>가입일</th>

					<fmt:formatDate value="${memberDto.memberJoin}" 
									pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
			<tr>
				<th>마지막로그인</th>
				<td>
					<fmt:formatDate value="${memberDto.memberLastLogin}" 
									pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
			<tr>
				<th>마지막변경일</th>
				<td>
					<fmt:formatDate value="${memberDto.memberLastUpdate}" 
									pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
		</table>	
	</div>

		</table>	
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
