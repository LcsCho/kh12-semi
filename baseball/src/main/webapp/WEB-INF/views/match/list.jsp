<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="row">
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
                    <td>
                        <c:choose>
                            <c:when test="${now.time >= matchDto.matchDate.time && now.time <= matchDto.matchDate.time + (3 * 60 * 60 * 1000)}">
                                경기 중(${matchDto.matchHomeScore})
                            </c:when>
                            <c:when test="${matchDto.matchDate.time < now.time}">
                                ${matchDto.matchHomeScore}
                            </c:when>
                            <c:otherwise>
                                경기 전
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${now.time >= matchDto.matchDate.time && now.time <= matchDto.matchDate.time + (3 * 60 * 60 * 1000)}">
                                경기 중(${matchDto.matchAwayScore})
                            </c:when>
                            <c:when test="${matchDto.matchDate.time < now.time}">
                                ${matchDto.matchAwayScore}
                            </c:when>
                            <c:otherwise>
                                경기 전
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${now.time >= matchDto.matchDate.time}">
                                예매 불가
                            </c:when>
                            <c:when test="${now.time >= matchDto.matchDate.time - (4 * 24 * 60 * 60 * 1000)}">
                                <a href="/reservation/insert?matchNo=${matchDto.matchNo}">예매하기</a>
                            </c:when>
                            <c:otherwise>
                                예매 전
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
