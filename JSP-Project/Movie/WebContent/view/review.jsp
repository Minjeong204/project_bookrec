<%@page import="vo.ReviewVO"%>
<%@page import="vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="../header.jsp"%>

<%

ArrayList<MovieVO> list = new ArrayList<MovieVO>();

if (request.getAttribute("movieList") == null) {
	response.sendRedirect("movieList.do");
} else {
	list = (ArrayList) request.getAttribute("movieList");
}
%>

<div class="ui container">
	<div class="main">
		<h2 class="review_tilte">영화 후기 보기 (해당 영화를 선택해 주세요.)</h2>

		<div class="MovieList">
			<div class="ui link cards unit">
				<%
				for (MovieVO vo : list) {
					String cat = "";

					switch (vo.getCategory()) {
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

	<div class="movie-card">
		<div class="movie-header avengers">
			<div class="header-icon-container">
				<a href="#">
				
				</a>
				
			</div>
			
		</div><!--movie-header-->
		
		<div class="movie-content" onclick="location.href = '/reviewList.do?movieNo=<%=vo.getMovieNo()%>'">
		
			<div class="movie-content-header">
			<img id="main_movie_images" alt="main_images" src="<%=vo.getImg()%>" width="280" height="390">
				<a href="#">
					<h3 class="movie-title"><%=vo.getMovieName() %></h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>장르</label>
					<span><%=cat %>	</span>
				</div><!--date,time-->
				<div class="info-section">
					<label>상영시간</label>
					<span><%=vo.getRuntime() %></span>
				</div><!--screen-->
				<div class="info-section">
					<label>영화번호</label>
					<span><%=vo.getMovieNo() %></span>
				</div><!--row-->
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->
				
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>