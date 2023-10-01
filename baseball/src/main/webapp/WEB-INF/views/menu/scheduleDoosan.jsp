<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>9월 캘린더</title>
    <style>
        /* 스타일을 추가하여 캘린더를 꾸미세요 */
        table {
            border-collapse: collapse;
            width: 300px;
        }
        th, td {
            text-align: center;
            padding: 5px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>9월 캘린더</h1>

    <div id="calendar-container">
        <!-- 캘린더가 여기에 동적으로 생성됩니다 -->
    </div>

    <script>
        // 현재 날짜를 가져오는 함수
        function getCurrentDate() {
            const today = new Date();
            const year = today.getFullYear();
            const month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
            const day = today.getDate();
            return { year, month, day };
        }

        // 현재 월의 달력을 생성하는 함수
        function createCalendar(year, month) {
            const calendarContainer = document.getElementById("calendar-container");

            // 테이블 엘리먼트 생성
            const table = document.createElement("table");
            const thead = document.createElement("thead");
            const tbody = document.createElement("tbody");

            // 테이블 헤더 생성
            const headerRow = document.createElement("tr");
            const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
            daysOfWeek.forEach(day => {
                const th = document.createElement("th");
                th.textContent = day;
                headerRow.appendChild(th);
            });
            thead.appendChild(headerRow);

            // 1일의 날짜를 가져오기
            const firstDayOfMonth = new Date(year, month - 1, 1).getDay();

            // 이전 달의 마지막 날짜 구하기
            const lastDayOfPrevMonth = new Date(year, month - 1, 0).getDate();

            // 현재 월의 마지막 날짜 구하기
            const lastDayOfMonth = new Date(year, month, 0).getDate();

            let date = 1;
            for (let i = 0; i < 6; i++) { // 최대 6주 표시
                const row = document.createElement("tr");
                
                for (let j = 0; j < 7; j++) {
                    const cell = document.createElement("td");
                    
                    if (i === 0 && j < firstDayOfMonth) {
                        // 이전 달의 날짜 표시
                        cell.textContent = lastDayOfPrevMonth - firstDayOfMonth + j + 1;
                        cell.classList.add("prev-month");
                    } else if (date > lastDayOfMonth) {
                        // 다음 달의 날짜 표시
                        cell.textContent = date - lastDayOfMonth;
                        cell.classList.add("next-month");
                        date++;
                    } else {
                        // 현재 달의 날짜 표시
                        cell.textContent = date;
                        if (date === getCurrentDate().day && year === getCurrentDate().year && month === getCurrentDate().month) {
                            cell.classList.add("current-day");
                        }
                        date++;
                    }

                    row.appendChild(cell);
                }
                tbody.appendChild(row);
                
            }

            // 테이블을 캘린더 컨테이너에 추가
            table.appendChild(thead);
            table.appendChild(tbody);
            calendarContainer.appendChild(table);
        }

        // 현재 날짜를 가져온 후 캘린더 생성
        const currentDate = getCurrentDate();
        createCalendar(currentDate.year, currentDate.month);
    </script>




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
                 <c:if test="${matchDto.homeTeam == '두산 베어스'}">
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
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
    
    
    
    
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
