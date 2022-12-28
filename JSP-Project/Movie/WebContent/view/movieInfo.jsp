<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>

<%
	MovieVO movieInfo = new MovieVO();
	ArrayList<ScheduleVO> schList = new ArrayList<ScheduleVO>();
	
	if(request.getAttribute("movieInfo") == null) {
		response.sendRedirect("/");
	}else {
		movieInfo = (MovieVO) request.getAttribute("movieInfo");
		schList = (ArrayList) request.getAttribute("scheduleAList");
	}
	
	String cat = "";
	String img = "";
%>

<div class="ui container">
    <div class="visual">
<<<<<<< HEAD
        <img src="/images/logo.jpg" alt="visualImg">
    </div>

    <div class="main">
        <h2>영화 정보</h2>

		<table class="ui inverted violet table movieInfoTable">
=======
      
    </div>

    <div class="main">
        <h2 class="movieinfo_title">영화 정보</h2>

		<table class="category ui inverted gray table movieInfoTable">
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
			<thead>
				<tr>
					<th>영화 번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>영화 정보</th>
				</tr>
			</thead>
			<tbody>
				<%
					img = movieInfo.getImg();	
					switch (movieInfo.getCategory()) {
					case 1:
						cat = "액션";
						break;
					case 2:
						cat = "로맨스";
						break;
					case 3:
						cat = "코미디";
						break;
					case 4:
						cat = "스릴러";
						break;
					case 5:
						cat = "애니메이션";
						break;
					}
				%>
				<tr>
					<td>No.<%=movieInfo.getMovieNo()%></td>
					<td><%=cat%></td>
					<td><%=movieInfo.getMovieName()%></td>
					<td><%=movieInfo.getInfo()%></td>
				</tr>
			</tbody>
		</table>

<<<<<<< HEAD
		<h2>관람 시간 선택</h2>
		<p style="text-align: right;">Tip: 원하는 관람 시간대에 클릭하면 좌석 선택 페이지로 이동됩니다.</p>
=======
		<h2 class="viewingtime_title" style="border-left: 2px solid #333; padding-left: 2px;">관람 시간 선택</h2>
		<p class="viewingtime_script">Tip: 원하는 관람 시간대에 클릭하면 좌석 선택 페이지로 이동됩니다.</p>
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a

		<div class="movieInfoBox">
			<div class="leftBox">
				<img src="/images/<%=img%>" alt="<%=img%>">
			</div>

			<div class="rightBox">
<<<<<<< HEAD
				<table class="ui inverted blue table">
=======
				<table class="ui inverted table">
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
					<thead>
						<tr>
							<th>스케줄 번호</th>
							<th>상영날짜</th>
							<th>상영 시간</th>
							<th>상영관</th>
							<th>잔여석</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (ScheduleVO item : schList) {
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (HH시 mm분)");
							String datetime = sdf.format(item.getRunDay());
						%>
						<tr onclick="location.href = '/chooseSeat.do?schNo=<%=item.getSchNo()%>&roomNo=<%=item.getRoomNo() %>';">
							<td>No.<%=item.getSchNo() %></td>
							<td><%=datetime %></td>
							<td><%=item.getRuntime() %>분</td>
							<td><%=item.getRoomNo() %>관</td>
							<td><%=25 - item.getSeatCnt() %>석</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
    </div>
</div>

<%@ include file="../footer.jsp" %>