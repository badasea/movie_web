<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.coupon2"%>
<%@ page import="dao.coupon2Repository"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<%
String cartId = session.getId();
%>
<title>쿠폰 사용 페이지</title>
<script type="text/javascript">
	function addToCart2() {
		if (confirm("쿠폰을 사용하시겠습니까?")) {
			document.addForm2.submit();
		} else {
			document.addForm2.reset();
		}
	}
</script>
</head>
<body>
	<%
		coupon2Repository dao2 = coupon2Repository.getInstance();
		ArrayList<coupon2> listOfcoupons2 = dao2.getAllcoupons();
	%>

	<div class="container">
		<div class="col" align="left">
			<%
			for (int j = 0; j < listOfcoupons2.size(); j++) {
				coupon2 book2 = listOfcoupons2.get(j);
			%>

			<hr>
			<div class="col-log">
				<h3><%=book2.getName()%></h3>
			</div>
			<div class="row">
				<div class="col-md-5">
					<img
						src="<%=request.getContextPath()%>/resources/images/<%=book2.getFilename()%>"
						style="width: 100%">
				</div>
				<p><%=book2.getDescription()%>
					| 사용기간 :
				<p>
					<%=book2.getReleaseDate()%>
					까지
			</div>
			<div align="right">
				<p>
				<form name="addForm2"
					action="./addcoupon2.jsp?id=<%=book2.getBookId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart2()"> 쿠폰 사용하기 &raquo;</a>
				</form>
			</div>
			<%
			}
			%>
		</div>
		<hr>
	</div>
</body>
</html>