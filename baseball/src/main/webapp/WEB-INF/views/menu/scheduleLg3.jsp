<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

    table {border-collapse: collapse;
    width: 1000px; 
    height: 1000px; 
    td{border: 1px solid #D1CFCF; padding: 3px; width: 150px; height: 205px;}
    th{border: 1px solid #D1CFCF; font-weight: bold; height: 40px; padding-top: 0.5em;}
    th:nth-child(6) {color:#DD6045;} 
    th:nth-last-child(1) {color:#3D85B9;}

	.custom{
      font-size: 20px;
        }
        
        .btn{
         width: 100px; 
    	height: 40px; 
    	 font-size: 16px;
        }

</style>

<script>
    <!-- javascript 작성 공간 -->
    document.addEventListener("DOMContentLoaded", function () {
    // 현재 날짜를 가져오기
    var today = new Date();
    var currentYear = today.getFullYear();
    var currentMonth = today.getMonth();


    // 가상의 데이터 배열 (실제 데이터는 백엔드에서 불러와야 함)

    var eventData = [];

    // 날짜 채우기
    function fillCalendar(year, month, eventData) {
        var calendar = document.getElementById("calendar");
        calendar.innerHTML = ""; // 달력 초기화

        var daysInMonth = new Date(year, month + 1, 0).getDate(); // 해당 월의 일 수 계산
        var firstDay = new Date(year, month, 1).getDay(); // 첫째 날의 요일 계산 (0은 일요일, 1은 월요일, ...)

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
        var row = tbody.insertRow(); // 새로운 행 추가
        for (var j = 0; j < totalCols; j++) {
            if (i === 0 && j < firstDay - 1) {
                // 첫째 주에서 첫째 날 이전의 빈 칸 (인덱스가 0부터 시작하므로 1을 빼줌)
                var cell = row.insertCell();
                cell.innerHTML = "";
            } else {
                if (date <= daysInMonth) {
                    // 날짜를 표시
                    var cell = row.insertCell();
                    cell.innerHTML = date;
                    
                	 // cell에 클래스 추가
                   cell.classList.add("custom");

                    var event = eventData.find(function(item) {
                        return item.matchDate.getDate() === date;
                    });

                    // 데이터가 있다면 해당 데이터를 추가
                   if (event) {
               	
         		 cell.innerHTML += "<br> vs <img src='/images/" + event.awayTeamNo + ".jpg' width='70%'>";               	   
			    /* cell.innerHTML += "<br>" + " vs " + event.awayTeam; */
			    cell.innerHTML += "<br>" + event.stadiumName;
			    			    
			    // 현재 시간과 비교하여 예매 버튼 추가
			    var nowTime = new Date().getTime();
			    if (nowTime >= event.matchDate.getTime()) {
			        cell.innerHTML += "<br>예매 불가";
			    } else if (nowTime >= event.matchDate.getTime() - (4 * 24 * 60 * 60 * 1000)) {
			    	cell.innerHTML += "<br><a href=\"/reservation/insert?matchNo=" + event.matchNo + "\" class=\"btn\">예매하기</a>";
			    } else {
			        cell.innerHTML += "<br>예매 전";
			    }
			}

                    date++; 
                }
                    else {
                    // 이번 달의 날짜가 모두 표시되었지만, 빈 칸으로 채워줍니다.
                    var cell = row.insertCell();
                    cell.innerHTML = "";
                }
            }
        }
    }
}

    // 월별 달력 생성
    fillCalendar(currentYear, currentMonth, eventData);


// AJAX 요청을 수행하여 서버에서 match 테이블 데이터를 가져옵니다.

    $.ajax({
        url: "http://localhost:8080/match", // 백엔드 API 엔드포인트를 지정합니다.
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            // 서버에서 데이터를 가져온 후, eventData 배열에 추가합니다.
            data.forEach(function (match) {
                var matchNo = match.matchNo; 
                var homeTeam = match.homeTeam;
                var awayTeam = match.awayTeam;

                var homeTeamNo = match.homeTeamNo;
                var awayTeamNo = match.awayTeamNo;

                var stadiumName = match.stadiumName;
                var matchDate = new Date(match.matchDate);

                eventData.push({ 
                    matchNo: matchNo, 
                    homeTeam: homeTeam,
                    awayTeam: awayTeam,
                    homeTeamNo: homeTeamNo,
                    awayTeamNo: awayTeamNo,
                    stadiumName: stadiumName,
                    matchDate: matchDate
                });
            });

                    stadiumName: stadiumName,
                    matchDate: matchDate
                });
            }); 


            // 캘린더를 채우는 함수를 호출합니다.
            fillCalendar(currentYear, currentMonth, eventData);
        },
        error: function (error) {
            console.error('Error fetching data:', error);
        }
    });
});


</script>

  

</head>
<body>
    
        <!-- 경기 일정 표시 -->
        <table id="calendar" class="row left">
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

                    <div class="match-info">
                    </div>
            
    </tbody>
    </table>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>