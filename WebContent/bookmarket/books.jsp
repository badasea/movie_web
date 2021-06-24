<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Snack"%>
<%@ page import="dao.SnackRepository"%>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>영화 목록</title>
<script type="text/javascript">
	function addToCart7() {
		if (confirm("해당 상품을 구매하시겠습니까?")) {
			document.addForm7.submit();
		} else {
			document.addForm7.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">영화 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from book";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-3">
				<img src ="<%=request.getContextPath()%>/resources/images/<%=rs.getString("b_fileName")%>" style ="width: 100%">
				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%>
				<p><%=rs.getString("b_author")%>
				<p><%=rs.getString("b_publisher")%>
				<p><%=rs.getString("b_UnitPrice")%>원
				<p><a href="./book.jsp?id=<%=rs.getString("b_id")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
			</div>
			<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
		<%
		SnackRepository dao = SnackRepository.getInstance();
		ArrayList<Snack> listOfProducts = dao.getAllSnacks();
	%>

	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Snack product = listOfProducts.get(i);
			%>
			<div class="col-md-3">
				<img
					src="<%=request.getContextPath()%>/resources/images/<%=product.getFilename()%>"
					style="width: 100%">
				<h3><%=product.getName()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
				<form name="addForm7"
					action="./addsnack.jsp?id=<%=product.getBookId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart7()"> 상품 구매
						하기 &raquo;</a>
				</form>	
			<%
				}
			%>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>