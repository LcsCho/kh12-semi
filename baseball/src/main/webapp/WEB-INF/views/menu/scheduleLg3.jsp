<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
    table {border-collapse: collapse;}
    td{border: 1px solid #D1CFCF; padding: 3px; width: 150px; height: 205px;}
    th{border: 1px solid #D1CFCF; font-weight: bold; height: 40px; padding-top: 0.5em;}
    th:nth-child(6) {color:#DD6045;} 
    th:nth-last-child(1) {color:#3D85B9;}
    
      .calendar {
        width: 500px; 
        height: 500px; 
    }
    table{
        width: 800px; 
        height: 800px; 
  
    }
        </style>
<script>

document.addEventListener("DOMContentLoaded", function () {
    // 현재 날짜를 가져오기
    var today = new Date();
    var currentYear = today.getFullYear();
    var currentMonth = today.getMonth();
    
    var list = [];

    // 월별 달력 생성 함수
    function generateCalendar(year, month, list) {
        var calendar = document.getElementById("calendar");
        calendar.innerHTML = ""; // 달력 초기화

        var daysInMonth = new Date(year, month + 1, 0).getDate(); // 해당 월의 일 수 계산
        var firstDay = new Date(year, month, 1).getDay(); // 첫째 날의 요일 계산 (0은 일요일, 1은 월요일, ...)

        // 월별 달력 생성
        var table = document.createElement("table");
        calendar.appendChild(table); // table 엘리먼트를 추가

        var tbody = document.createElement("tbody"); // tbody 엘리먼트 생성
        table.appendChild(tbody); // tbody를 table에 추가

        var row = tbody.insertRow(); // tbody에 첫 번째 row 추가
        var weekdays = ["일", "월", "화", "수", "목", "금", "토"];

        // 요일 헤더 생성
        for (var i = 0; i < 7; i++) {
            var cell = document.createElement("th"); // th 엘리먼트 생성
            cell.innerHTML = weekdays[i];
            row.appendChild(cell); // th를 row에 추가
        }

     // 날짜 채우기
        var date = 1;
        for (var i = 0; i < 6; i++) {
            if (date > daysInMonth) {
                break;
            }
            row = tbody.insertRow(); // tbody에 새로운 row 추가
            for (var j = 0; j < 7; j++) {
                if (i === 0 && j < firstDay) {
                    // 첫째 주에서 첫째 날 이전의 빈 칸
                    var cell = row.insertCell();
                    cell.innerHTML = "";
                } else {
                    if (date <= daysInMonth) {
                        // 데이터를 가져와서 표시하도록 수정
                        var cell = row.insertCell();
                        cell.innerHTML = date; // 날짜 표시

                        // 이 부분에 데이터를 표시하는 로직을 추가
                        // 데이터를 가져와서 HTML에 동적으로 삽입

                        // 예시: matchDto에서 데이터를 가져와서 삽입
                        var matchDto = list.find(function(item) {
                            var matchDate = new Date(item.matchDate);
                            return (
                                matchDate.getFullYear() === year &&
                                matchDate.getMonth() === month &&
                                matchDate.getDate() === date &&
                                item.homeTeam === 'lg 트윈스'
                            );
                        });

                        if (matchDto) {
                            // 데이터를 삽입하는 코드 추가
                            var matchInfo = document.createElement("div");
                            matchInfo.className = "match-info";
                            matchInfo.innerHTML = ` `;

                            // 셀에 데이터 삽입
                            cell.appendChild(matchInfo);
                        }

                        date++;
                    }
                }
            }
        }
        }

    // 월별 달력 생성
    generateCalendar(currentYear, currentMonth, list);
});



</script>
<div id="calendar-container" class="container w-1000">
    <!-- 기타 내용 생략 -->

    <!-- 경기 일정 표시 -->
    <table id="calendar">
        <thead>
            <tr>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
                <th>일</th>
            </tr>
        </thead>
        <tbody>
            <!-- 이 부분은 잘 유지되어야 합니다. -->
            <c:forEach var="matchDto" items="${list}" varStatus="status">
                          <div class="match-info">
                    <c:if test="${matchDto.homeTeam == 'lg 트윈스'}">
                            <div class="row left">
                                <label class="day left"><fmt:formatDate value="${matchDto.matchDate}" pattern="yyyy-MM-dd HH:mm" /></label>
                            </div>
                            <div class="row">
                            <img src="/images/vs두산.png" width="50%">
						${matchDto.awayTeam}
						</div>
						<div class="row">
						    <label class="font">${matchDto.stadiumName}</label>
						</div>
						<div class="row">
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
						</div>
						</td>
						</c:if>
						</div>
						</c:forEach>
</tbody>
</table>

    <table>
        <thead>
            <tr>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
                <th>일</th>
            </tr>
        </thead>
        <tbody>
            <!-- 이 부분은 잘 유지되어야 합니다. -->
            <tr>
            <c:forEach var="matchDto" items="${list}" varStatus="status">
                          <div class="match-info">
                    <c:if test="${matchDto.homeTeam == 'lg 트윈스'}">
                    <td>
                            <div class="row left">
                                <label class="day left"><fmt:formatDate value="${matchDto.matchDate}" pattern="yyyy-MM-dd HH:mm" /></label>
                            </div>
                            <div class="row">
                            <img src="/images/vs두산.png" width="50%">
						${matchDto.awayTeam}
						</div>
						<div class="row">
						    <label class="font">${matchDto.stadiumName}</label>
						</div>
						<div class="row">
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
						</div>
						</td>
						</c:if>
						<tr>
						</div>
						</c:forEach>
</tbody>
</table>


<!-- 기타 내용 생략 -->
</div>
                            
                             

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>