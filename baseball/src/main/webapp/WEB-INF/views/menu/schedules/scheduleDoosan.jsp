<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/team.css">


<script>
    <!-- javascript 작성 공간 -->
    document.addEventListener("DOMContentLoaded", function () {
        // 현재 날짜를 가져오기
        var today = new Date();
        var currentYear = today.getFullYear();
        var currentMonth = today.getMonth();

        // 가상의 데이터 배열 
        var eventData = [];

        // 이전 달과 다음 달 버튼
        var prevMonthButton = document.getElementById("prevMonthButton");
        var nextMonthButton = document.getElementById("nextMonthButton");

     // 이전 달 버튼 클릭 이벤트 처리
        prevMonthButton.addEventListener("click", function () {
            currentMonth--;
            if (currentMonth < 0) {
                currentMonth = 11;
                currentYear--;
            }
            if (currentYear < today.getFullYear() - 1 || (currentYear == today.getFullYear() - 1 && currentMonth < today.getMonth())) {
                // 작년 현재 달 이전으로는 이동할 수 없음
                currentYear = today.getFullYear() - 1;
                currentMonth = today.getMonth();
                alert("최근 1년까지만 조회 가능합니다");
            }
            refreshCalendar();
            displayCurrentMonth();
        });

        // 다음 달 버튼 클릭 이벤트 처리
        nextMonthButton.addEventListener("click", function () {
            currentMonth++;
            if (currentMonth > 11) {
                currentMonth = 0;
                currentYear++;
            }
            if (currentYear > today.getFullYear() + 1 || (currentYear == today.getFullYear() + 1 && currentMonth > today.getMonth())) {
                // 내년 현재 달 이후로는 이동할 수 없음
                currentYear = today.getFullYear() + 1;
                currentMonth = today.getMonth();
                alert("최근 1년까지만 조회 가능합니다");
            }
            refreshCalendar();
            displayCurrentMonth();
        });

        // 현재 달을 표시할 엘리먼트 가져오기
        var currentMonthDisplay = document.getElementById("currentMonthDisplay");

        // 현재 달을 표시하는 함수
        function displayCurrentMonth() {
            var months = [
                "1월", "2월", "3월", "4월", "5월", "6월",
                "7월", "8월", "9월", "10월", "11월", "12월"
            ];
            var currentMonthName = months[currentMonth];
            var displayText = currentYear + "년 " + currentMonthName;
            currentMonthDisplay.textContent = displayText;
        }

        // 날짜 채우기 함수
        function fillCalendar(year, month, calendarId) {
            var calendar = document.getElementById(calendarId);
            calendar.innerHTML = "";

            var daysInMonth = new Date(year, month + 1, 0).getDate();
            var firstDay = new Date(year, month, 1).getDay();

            // 요일 순서를 월요일부터 시작하도록 조정
            if (firstDay === 0) {
                firstDay = 7; // 일요일인 경우 7로 변경
            }

            // 월별 달력 생성
            var table = document.createElement("table");
            calendar.appendChild(table); // table 엘리먼트를 추가

            var tbody = document.createElement("tbody"); // tbody 엘리먼트 생성
            table.appendChild(tbody); // tbody를 table에 추가

            var weekdays = ["월", "화", "수", "목", "금", "토", "일"];

            // 요일 헤더 생성
            var headerRow = tbody.insertRow(); // 요일 헤더를 추가할 행 생성
            for (var i = 0; i < 7; i++) {
                var cell = document.createElement("th"); // th 엘리먼트 생성
                cell.innerHTML = weekdays[i];
                headerRow.appendChild(cell); // th를 요일 헤더 행에 추가
            }

            // 열의 수 계산
            var totalCols = 7; // 요일 열의 수는 고정
            var remainingCols = daysInMonth + firstDay - 1; // 남은 열의 수 계산

            // 필요한 열의 수 계산
            var neededCols = totalCols - (remainingCols % totalCols);

            // 날짜 채우기
            var date = 1;
            for (var i = 0; i < Math.ceil((daysInMonth + firstDay - 1) / totalCols); i++) {
                var row = tbody.insertRow();
                for (var j = 0; j < totalCols; j++) {
                    if (i === 0 && j < firstDay - 1) {
                        var cell = row.insertCell();
                        cell.innerHTML = "";
                    } else {
                        if (date <= daysInMonth) {
                            var cell = row.insertCell();

                            // 날짜를 표시하는 부분 (기존 코드에서 이 부분 유지)
                            var dateDiv = document.createElement("div");
                            dateDiv.innerHTML = date;
                            dateDiv.classList.add("div-custom");
                            cell.appendChild(dateDiv);

                            var event = eventData.find(function (item) {
                                return item.matchDate.getDate() === date && item.matchDate.getMonth() === month;
                            });

                            // 데이터가 있다면 해당 데이터를 추가
                            if (event) {
                                // 하나의 <div>로 감싸는 부분
                                var containerDiv = document.createElement("div");
                                containerDiv.classList.add("float-container");

                                // "vs" 텍스트 추가
                                var vsText = document.createElement("div");
                                vsText.innerHTML = " vs ";
                                vsText.classList.add("col-2");
                                vsText.classList.add("div-text");
                                vsText.style.width = "30%";
                                containerDiv.appendChild(vsText);

                                // 이미지 추가
                                var imgDiv = document.createElement("div");
                                imgDiv.classList.add("col-2");
                                imgDiv.classList.add("div-image");
                                imgDiv.style.width = "70%";

                                // 이미지를 imgDiv 안에 추가하는 코드 (기존 코드에서 이 부분 유지)
                                var img = document.createElement("img");
                                img.src = "/images/" + event.awayTeamNo + ".jpg";
                                img.style.maxWidth = "100%";
                                imgDiv.appendChild(img);

                                // imgDiv를 containerDiv 안에 추가
                                containerDiv.appendChild(imgDiv);

                                // 이제 containerDiv를 td에 추가
                                cell.appendChild(containerDiv);

                                // 경기장 정보 추가
                                var stadiumDiv = document.createElement("div");
                                stadiumDiv.innerHTML = event.stadiumName;
                                stadiumDiv.classList.add("div-stadium");
                                cell.appendChild(stadiumDiv);

                                // 현재 시간과 비교하여 예매 버튼 또는 "예매 불가" 텍스트 추가
                                var nowTime = new Date().getTime();

                                if (nowTime >= event.matchDate.getTime()) {
                                    var notAvailableDiv = document.createElement("div");
                                    notAvailableDiv.innerHTML = "예매마감";
                                    notAvailableDiv.className = "btn";
                                    notAvailableDiv.classList.add("div-end");
                                    cell.appendChild(notAvailableDiv);
                                } else if (nowTime >= event.matchDate.getTime() - (4 * 24 * 60 * 60 * 1000)) {
                                    var reservationLink = document.createElement("a");
                                    reservationLink.href = "/reservation/insert?matchNo=" + event.matchNo;
                                    reservationLink.className = "btn";
                                    reservationLink.innerHTML = "예매하기";
                                    reservationLink.classList.add("div-ing");
                                    cell.appendChild(reservationLink);
                                } else {
                                    var beforeReservationDiv = document.createElement("div");
                                    beforeReservationDiv.innerHTML = "오픈예정";
                                    beforeReservationDiv.className = "btn";
                                    beforeReservationDiv.classList.add("div-before");
                                    cell.appendChild(beforeReservationDiv);
                                }
                            }

                            date++;
                        } else {
                            var cell = row.insertCell();
                            cell.innerHTML = "";
                        }
                    }
                }
            }
        }

     // 달력 새로고침 함수
        function refreshCalendar() {
            eventData = []; // 이벤트 데이터 초기화
            var currentMonthStartDate = new Date(currentYear, currentMonth, 1);
            var nextYearStartDate = new Date(currentYear + 1, currentMonth, 1);
            
            // AJAX 요청을 수행하여 서버에서 match 테이블 데이터를 가져옵니다.
            $.ajax({
                url: "http://localhost:8080/match", // 백엔드 API 엔드포인트를 지정
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                    // 서버에서 데이터를 가져온 후, eventData 배열에 추가
                    data.forEach(function (match) {
                        var matchDate = new Date(match.matchDate);

                        // 현재 월과 내년 월 데이터만 추가
                        if (matchDate >= currentMonthStartDate && matchDate < nextYearStartDate) {
                            var homeTeam = match.homeTeam;
                            if (homeTeam === "두산") { 
                                var matchNo = match.matchNo;
                                var awayTeam = match.awayTeam;
                                var homeTeamNo = match.homeTeamNo;
                                var awayTeamNo = match.awayTeamNo;
                                var stadiumName = match.stadiumName;

                                eventData.push({
                                    matchNo: matchNo,
                                    homeTeam: homeTeam,
                                    awayTeam: awayTeam,
                                    homeTeamNo: homeTeamNo,
                                    awayTeamNo: awayTeamNo,
                                    stadiumName: stadiumName,
                                    matchDate: matchDate
                                });
                            }
                        }
                    });

                    // 캘린더를 채우는 함수를 호출
                    fillCalendar(currentYear, currentMonth, "currentMonthCalendar");
                },
                error: function (error) {
                    console.error('Error fetching data:', error);
                }
            });
        }

        // 초기 캘린더 표시
        refreshCalendar();

        // 현재 달을 표시
        displayCurrentMonth();

    });

      
</script>

  

</head>
<body>
<div class="calendarContainer">
<div class="box">
			 <div class="team">
                        <a href="/schedule/doosan" class="btn doosan">두산</a> 
                        <a href="/schedule/lg" class="btn lg">LG</a>
                        <a href="/schedule/ssg" class="btn ssg">SSG</a>
                        <a href="/schedule/kiwoom" class="btn kiwoom">키움</a>
                        <a href="/schedule/kt" class="btn kt">KT</a>
                        <a href="/schedule/kia" class="btn kia">KIA</a>
                        <a href="/schedule/nc" class="btn nc">NC</a>
                        <a href="/schedule/samsung" class="btn samsung">삼성</a>
                        <a href="/schedule/lotte" class="btn lotte">롯데</a>
                        <a href="/schedule/hanwha" class="btn hanwha">한화</a>
            </div>

                    <div class="float-container">
                        <div class="col-2 teamlogo">
                            <img src="/images/11.jpg" width="200px"> 
                        </div>
                        <div class="col-2 notice">
                            <div class="float-container">
                                <div class="col-2 team-notice">구단공지</div>
                                <div class="col-2 pre-notice">
                                    <pre>
* 온라인 구매는 경기 시작 1시간 후 까지 예매 가능
(단, 경기 시작 2시간 30분 전부터는 취소는 불가하오니 예매 시 참고)
* 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
* 36개월 이상 어린이는 티켓 구매 후 입장 가능.
* 권종선택 실수로 인한 예매권은 현장에서 교환/환불 불가합니다.
(현장에서 재구매 해야합니다.)
                                    </pre>
                                </div>
                            </div>
                        </div>
                    </div>
 </div>                  

<div class="calendarButton">
 <button  type="button" id="prevMonthButton" ><i class="fa-solid fa-chevron-left"></i></button>
 <div id="currentMonthDisplay"></div>
    <button  type="button"  id="nextMonthButton"><i class="fa-solid fa-chevron-right"></i></button>
</div>
 
        <table id="currentMonthCalendar" class="row">
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

                    <div class="match-info"></div>
            
    </tbody>
    </table>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>