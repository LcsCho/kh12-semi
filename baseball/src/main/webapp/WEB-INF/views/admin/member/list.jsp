<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<style>
table {
	border-collapse: collapse;
}

table th {
	border-top: #62676C 3px solid;
	border-bottom: #62676C 2px solid;
	border-right: #D1CFCF 2px solid;
	background-color: #f1f1f1;
	font-weight: bold;
	height: 40px;
	padding-top: 1em;
	font-size: 16px;
	color: #62676C;
	font-weight: bold;
}

table td {
	border-top: #D1CFCF 2px solid;
	border-bottom: #D1CFCF 2px solid;
	border-right: #D1CFCF 3px solid;
	height: 35px;
	padding-top: 0.4em;
}

td:nth-last-child(1), th:nth-last-child(1) {
	border-right: none;
}

.search-box {
            background-color: #f1f1f1;
            border: #D1CFCF 2px solid;
            display: flex;
            align-items: center;
            justify-content: center;
             height: 80px;
          }
          
          .form-input {
            height: 40px;
            font-size: 15px;
            margin: 0 10px;
        }
	        .form-input.tite{
	            width: 120px;
	        }
	
	       .btn, .btn.btn-positive {
	            width: 100px;
	            height: 40px;
	            font-size: 15px;
	            border-radius: 0px;
	        }
			.btn.row{
			padding-top: 0.8em;
			}
		
</style>

<table width="700">
	<div class="row">
		<form action="list" method="get">
		<div class="row search-box w-1000">
		
			<c:choose>
				<c:when test="${vo.type == 'member_nick'}">
					<select name="type" class="form-input">
						<option value="member_id">아이디</option>
						<option value="member_nick" selected>닉네임</option>
						<option value="member_tel">전화번호</option>
						<option value="member_birth">생년월일</option>
					</select>
				</c:when>
				<c:when test="${vo.type == 'member_tel'}">
					<select name="type" class="form-input">
						<option value="member_id">아이디</option>
						<option value="member_nick">닉네임</option>
						<option value="member_tel" selected>전화번호</option>
						<option value="member_birth">생년월일</option>
					</select>
				</c:when>
				<c:when test="${vo.type == 'member_birth'}">
					<select name="type" class="form-input">
						<option value="member_id">아이디</option>
						<option value="member_nickname">닉네임</option>
						<option value="member_contact">전화번호</option>
						<option value="member_birth" selected>생년월일</option>
					</select>
				</c:when>
				<c:otherwise>
					<select name="type" class="form-input">
						<option value="member_id">아이디</option>
						<option value="member_nick">닉네임</option>
						<option value="member_tel">전화번호</option>
						<option value="member_birth">생년월일</option>
					</select>
				</c:otherwise>
			</c:choose>
			
			
			<input type="search" name="keyword" placeholder="검색어" 
				value="${vo.keyword}" required class="form-input w-65">
			<button type="submit" class="btn btn-positive">검색</button>
			</div>
			
		</form>
		
	</div>
	<div class="row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>전화번호</th>
 					<th>이메일</th> 
					<th>생년월일</th>
					<th>등급</th>
					<th>차단</th>
					<th>메뉴</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="memberListDto" items="${list}">
				<tr>
					<td>${memberListDto.memberId}</td>
					<td>${memberListDto.memberNick}</td>
					<td>${memberListDto.memberTel}</td>
					<td>${memberListDto.memberEmail}</td>
					<td>${memberListDto.memberBirth}</td>
					<td>${memberListDto.memberLevel}</td>
					<td>${memberListDto.block}</td>
					<td>
						<a class="link" href="detail?memberId=${memberListDto.memberId}">상세</a>
						<a class="link" href="edit?memberId=${memberListDto.memberId}">수정</a>
						
						<c:choose>
							<c:when test="${memberListDto.block == 'Y'}">
								<a class="link" href="cancel?memberId=${memberListDto.memberId}">해제</a>
							</c:when>
							<c:otherwise>
								<a class="link" href="block?memberId=${memberListDto.memberId}">차단</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row mt-20">
		<div class="page-navigator">
			<c:if test="${!vo.first}">
				<a href="list?${vo.prevQueryString}">&lt;</a>
			</c:if> 
			
			<c:forEach var="i" begin="${vo.begin}" end="${vo.end}" step="1">
				<c:choose>
					<c:when test="${i == vo.page}">
						<a class="on">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="list?${vo.getQueryString(i)}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${!vo.last}">
				<a href="list?${vo.nextQueryString}">&gt;</a>
			</c:if>
			
		</div>
	</div>
</div>
</table>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
