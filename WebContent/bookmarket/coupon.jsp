<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="dto.coupon"%>
<%@ page import="dao.couponRepository"%>
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
	function addToCart() {
		if (confirm("쿠폰을 사용하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">할인 쿠폰</h1>
		</div>
	</div>

	<%
		couponRepository dao = couponRepository.getInstance();
		ArrayList<coupon> listOfcoupons = dao.getAllcoupons();
	%>

	<div class="container">
		<div class="col" align="left">
			<%
			for (int i = 0; i < listOfcoupons.size(); i++) {
				coupon book = listOfcoupons.get(i);
			%>

			<hr>
			<div class="col-log">
				<h3><%=book.getName()%></h3>
			</div>
			<div class="row">
				<div class="col-md-5">
					<img
						src="<%=request.getContextPath()%>/resources/images/<%=book.getFilename()%>"
						style="width: 100%">
				</div>
				<p><%=book.getDescription()%>
					| 사용기간 :
				<p>
					<%=book.getReleaseDate()%>
					까지
			</div>
			<div align="right">
				<p>
				<form name="addForm"
					action="./addcoupon.jsp?id=<%=book.getBookId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 쿠폰 사용
						하기 &raquo;</a>
				</form>
			</div>
			<%
			}
			%>
		<jsp:include page="coupon2.jsp" />
		</div>
		<hr>
	</div>
	<div class="container">
		<a href="./cart.jsp" class="btn btn-secondary"> &laquo; 장바구니로 돌아가기</a>
	</div>
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>