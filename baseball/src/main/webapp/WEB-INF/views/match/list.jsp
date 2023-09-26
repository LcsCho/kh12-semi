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
    <c:when test="${now.time >= matchDto.matchDate.time - 4 * 24 * 60 * 60 * 1000 && now.time < matchDto.matchDate.time - 11 * 60 * 60 * 1000}">
        <!-- 현재일로부터 4일 전 11시 이전 (예매 불가) -->
           <td>${matchDto.matchHomeScore}</td>
        <td>${matchDto.matchAwayScore}</td>
        <td><a href="/reservation/insert?matchNo=${matchDto.matchNo}">예매하기</a></td>
    </c:when>
    <c:when test="${now.time >= matchDto.matchDate.time - 4 * 24 * 60 * 60 * 1000 && now.time >= matchDto.matchDate.time - 11 * 60 * 60 * 1000 && now.time <= matchDto.matchDate.time + 3 * 60 * 60 * 1000}">
        <!-- 현재일로부터 4일 전 11시부터 경기일까지 (예매 가능) -->
            <td>경기 중(${matchDto.matchHomeScore})</td>
        <td>경기 중(${matchDto.matchAwayScore})</td>
        <td>예매 불가</td>
       
    </c:when>
    <c:when test="${now.time > matchDto.matchDate.time + 3 * 60 * 60 * 1000}">
        <!-- 경기 종료 후 (경기 종료 3시간 이후) -->
         <td>${matchDto.matchHomeScore}</td>
        <td>${matchDto.matchAwayScore}</td>
        <td>-</td>
    </c:when>
    <c:otherwise>
        <!-- 경기 중 (현재 경기 중) -->
      <td colspan="3">예매 전</td>
    </c:otherwise>
</c:choose>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
