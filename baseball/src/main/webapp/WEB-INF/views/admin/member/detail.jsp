<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<style>
table {
	border-collapse: collapse;
	text-align: center; 
 	display: flex;
  	justify-content: center; 
  	align-items: center; 
  	margin-top: 2em;
  	margin-bottom: 2em;
}

table th {
	border-top: #62676C 3px solid;
	border-bottom: #62676C 2px solid;
	border-right: #D1CFCF 2px solid;
	background-color: #f1f1f1;
	font-weight: bold;
    width: 150px;
	height: 40px;
	padding-top: 0.5em;
	font-size: 16px;
	color: #62676C;
	font-weight: bold;
}

table td {
	border-top: #D1CFCF 2px solid;
	border-bottom: #D1CFCF 2px solid;
	border-right: #D1CFCF 3px solid;
    width: 500px;
	height: 35px;
	padding-top: 0.4em;
    padding-left: 1em;
}

td:nth-last-child(1), th:nth-last-child(1) {
	border-right: none;
}
</style>

<div class="container w-700">
	<div class="row">
		<h1>${memberDto.memberId} 님의 회원 정보</h1>
	</div>
	
	<table>
            <tr>
                <th>
                    닉네임
                </th>
                <td>${memberDto.memberNick}</td>
            </tr>
            <tr>
                <th>
                    이메일
                </th>
                <td>${memberDto.memberEmail}</td>
            </tr>
            <tr>
                <th>
                    연락처
                </th>
                <td>${memberDto.memberTel}</td>
            </tr>
            <tr>
                <th>
                    생년월일
                </th>
                <td>${memberDto.memberBirth}</td>
            </tr>
            <tr>
                <th>
                    주소
                </th>
                <td>
                    [${memberDto.memberPost}]
                    ${memberDto.memberAddr1}
                    ${memberDto.memberAddr2}
                </td>
            </tr>
            <tr>
                <th>
                    등급
                </th>
                <td>${memberDto.memberLevel}</td>
            </tr>
            <tr>
                <th>
                    가입일
                </th>
                <td><fmt:formatDate value="${memberDto.memberJoin}" 
                    pattern="y년 M월 d일 E a h시 m분 s초"/></td>
            </tr>
            <tr>
                <th>
                    마지막로그인
                </th>
                <td><fmt:formatDate value="${memberDto.memberLastLogin}" 
                    pattern="y년 M월 d일 E a h시 m분 s초"/></td>
            </tr>
            <tr>
                <th>
                    마지막변경일
                </th>
                <td> <fmt:formatDate value="${memberDto.memberLastUpdate}" 
                    pattern="y년 M월 d일 E a h시 m분 s초"/></td>
            </tr>
    </table>
		</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
