<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>

<div class="row container w-800">
    <table class="table table-hover table-border">
        <thead>
            <tr>
                <th>매치번호</th>
                <th>경기일</th>
                <th>경기장</th>
                <th>홈팀</th>
                <th>어웨이팀</th>
                <th>홈팀스코어</th>
                <th>어웨이스코어</th>
                <th>예매</th>
            </tr>
        </thead>
        <tbody align="center">
            <c:forEach var="matchDto" items="${list}" varStatus="status">
                <tr>
                    <td><a href="detailMatch?matchNo=${matchDto.matchNo}">${matchDto.matchNo}</a></td>
                    <td>
                        <fmt:formatDate value="${matchDto.matchDate}" pattern="yyyy-MM-dd HH:mm" />
                    </td>
                    <td>${matchDto.stadiumName}</td>
                    <td>${matchDto.homeTeam}</td>
                    <td>${matchDto.awayTeam}</td>
                    <c:choose>
                        <c:when test="${matchDto.matchDate.before(now)}">
                            <td>${matchDto.matchHomeScore}</td>
                            <td>${matchDto.matchAwayScore}</td>
                            <td>예매 불가</td>
                        </c:when>
                        <c:otherwise>
                            <td>경기 전</td>
                            <td>경기 전</td>
                             <td>
                        <a href="updateDate?matchNo=${matchDto.matchNo}">예매하기</a>
                    </td>
                        </c:otherwise>
                    </c:choose>
                   
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
