<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>예매 완료</title>
</head>
<body>
	<%
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";		

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">예매 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">저희 영화관을 이용해 주셔서 감사합니다.</h2>
		<p>	영화는	<%	out.println(shipping_shippingDate);	%>에 입장하시면 됩니다!!	
		<p>	주문번호 :	<%	out.println(shipping_cartId);	%>		
	</div>
	<div class="container">
		<p>	<a href="./books.jsp" class="btn btn-secondary"> &laquo; 영화 목록</a>		
	</div>
</body>
</html>
<%
	session.invalidate();

	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>