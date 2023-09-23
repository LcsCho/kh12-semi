<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>

<div class="container">
    <h1>좌석 상태 변경 페이지</h1>

  <form action="update" method="post" autocomplete="off">
        <div>
            <input type="number" id="seatCol" name="seatCol" class="form-control" value="${seatSeletDto.seatCol}" >
        </div>
        <div>
            <input type="number" id="seatRow" name="seatRow" class="form-control" value="${seatSeletDto.seatRow}" >
        </div>
        <div>
            <input type="text" id="seatAreaZone" name="seatAreaZone" class="form-control" value="${seatSeletDto.seatAreaZone}" >
        </div>
        <div>
            <input type="text" id="stadiumName" name="stadiumName" class="form-control" value="${seatSeletDto.stadiumName}" >
        </div>
        <div>
            <input type="text" id="seatStatus" name="seatStatus" class="form-control" value="${seatSeletDto.seatStatus}" required>
        </div>
        <button type="submit" class="btn">업데이트</button>
    </form>
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>