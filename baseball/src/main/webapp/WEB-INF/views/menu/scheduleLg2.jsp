<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="row">
    <table class="table table-hover table-border">
        <thead>
            <tr>
                <th>경기일자</th>
                <th>어웨이팀</th>
                <th>경기장</th>
                <th>예매</th>
            </tr>
        </thead>
        <tbody align="center">
           <c:forEach var="matchDto" items="${list}" varStatus="status">
                <tr>
                <c:if test="${matchDto.go == 'lg 트윈스'}">
                    <td>
                        <fmt:formatDate value="${matchDto.matchDate}" pattern="yyyy-MM-dd HH:mm" />
                    </td>
                    <td>${matchDto.awayTeam}</td>
                    <td>${matchDto.stadiumName}</td>
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
                  </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>