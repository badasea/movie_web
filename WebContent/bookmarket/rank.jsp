<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>


<%
Date now = new Date();

Calendar day = Calendar.getInstance();
day.add(Calendar.DATE, -1);

SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
String Yesterday = sf.format(day.getTime());

String targetDt = request.getParameter("targetDt") == null ? "" + Yesterday + "" : request.getParameter("targetDt");
String itemPerPage = request.getParameter("itemPerPage") == null ? "10" : request.getParameter("itemPerPage"); 
String multiMovieYn = request.getParameter("multiMovieYn") == null ? "" : request.getParameter("multiMovieYn"); 
String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd"); 
String wideAreaCd = request.getParameter("wideAreaCd") == null ? "" : request.getParameter("wideAreaCd"); 

String key = "ac36eefcf50c6080ec780697733b8f1b";
KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);

ObjectMapper mapper = new ObjectMapper();
HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);

request.setAttribute("dailyResult", dailyResult);

String codeResponse = service.getComCodeList(true, "0105000000");
HashMap<String, Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
request.setAttribute("codeResult", codeResult);
%>
<html>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 순위</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">박스 오피스 순위</h1>
		</div>
	</div>
	<c:out value="${dailyResult.boxOfficeResult.boxofficeType}" />
	<c:out value="${dailyResult.boxOfficeResult.showRange}" />
	<br />
	<table border="1">
		<tr>
			<td>순위</td>
			<td>영화명</td>
			<td>개봉일</td>
			<td>누적매출액</td>
			<td>관객수</td>
			<td>누적관객수</td>
			<td>스크린수</td>
			<td>상영횟수</td>
		</tr>
		<c:if
			test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
			<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}"
				var="boxoffice">
				<tr>
					<td><c:out value="${boxoffice.rank }" /></td>
					<td><c:out value="${boxoffice.movieNm }" /></td>
					<td><c:out value="${boxoffice.openDt }" /></td>
					<td><c:out value="${boxoffice.salesAcc }" /></td>
					<td><c:out value="${boxoffice.audiCnt }" /></td>
					<td><c:out value="${boxoffice.audiAcc }" /></td>
					<td><c:out value="${boxoffice.scrnCnt }" /></td>
					<td><c:out value="${boxoffice.showCnt }" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<P> 데이터 출처 : 영화진흥위원회 API
	<jsp:include page="footer.jsp" />
</body>
</html>