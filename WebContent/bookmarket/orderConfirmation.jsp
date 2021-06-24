<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="dto.coupon"%>
<%@ page import="dao.couponRepository"%>
<%@ page import="dto.coupon2"%>
<%@ page import="dao.coupon2Repository"%>
<%@ page import="dto.Snack"%>
<%@ page import="dao.SnackRepository"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

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
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>예매 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">예매 정보</h1>
		</div>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>영수증</strong> <br> 성명 : <% out.println(shipping_name); %>	<br> 
				전화번호 : <% 	out.println(shipping_zipCode);%><br> 
				영화관 : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>) <br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>예매일: <% out.println(shipping_shippingDate);%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<%				
						int sum1 = 0;
						ArrayList<coupon> cartList1 = (ArrayList<coupon>) session.getAttribute("cartlist1");
						if (cartList1 == null)
							cartList1 = new ArrayList<coupon>();

						for (int i = 0; i < cartList1.size(); i++) { // 상품리스트 하나씩 출력하기
							coupon product1 = cartList1.get(i);
							int total1 = product1.getUnitPrice() * product1.getQuantity();
							sum1 = sum1 + total1;
				%>
			<tr>
				<td class="text-center"><em><%=product1.getName()%> </em></td>
				<td class="text-center"><%=product1.getQuantity()%></td>
				<td class="text-center"><%=product1.getUnitPrice()%>원</td>
				<td class="text-center"><%=total1%>원</td>
			</tr>
				<%
					}
				%>

				<!-- 20퍼센트 할인 쿠폰 -->				
				<%				
						long sum2 = 1;
						ArrayList<coupon2> cartList3 = (ArrayList<coupon2>) session.getAttribute("cartlist3");
						if (cartList3 == null)
							cartList3 = new ArrayList<coupon2>();

						for (int i = 0; i < cartList3.size(); i++) { // 상품리스트 하나씩 출력하기
							coupon2 product2 = cartList3.get(i);
							int total2 = product2.getUnitPrice() * product2.getQuantity();
							sum2 = sum2 + (long)((100 - total2)*0.1) - 1;
				%>
			<tr>
				<td class="text-center"><em><%=product2.getName()%> </em></td>
				<td class="text-center"><%=product2.getQuantity()%></td>
				<td class="text-center"><%=product2.getUnitPrice()%>%</td>
			</tr>
				<%
					}
				%>
							<!-- 팝콘 콜라 -->
				<%				
						int sum7 = 0;
						ArrayList<Snack> cartList7 = (ArrayList<Snack>) session.getAttribute("cartlist7");
						if (cartList7 == null)
							cartList7 = new ArrayList<Snack>();

						for (int i = 0; i < cartList7.size(); i++) { // 상품리스트 하나씩 출력하기
							Snack product7 = cartList7.get(i);
							int total7 = product7.getUnitPrice() * product7.getQuantity();
							sum7 = sum7 + total7;
				%>
			<tr>
				<td class="text-center"><em><%=product7.getName()%> </em></td>
				<td class="text-center"><%=product7.getQuantity()%></td>
				<td class="text-center"><%=product7.getUnitPrice()%>원</td>
				<td class="text-center"><%=total7%>원</td>
			</tr>
				<%
					}
				%>
			<tr>
				<th class="text-center">영화</th>
				<th class="text-center">인원</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Book>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Book book = cartList.get(i);
					int total = book.getUnitPrice() * book.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=book.getName()%> </em></td>
				<td class="text-center"><%=book.getQuantity()%></td>
				<td class="text-center"><%=book.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
				<%
					long res = 0;
					if (sum2 == 1)
					{
						res = sum+sum1+sum7;
					}
					else
					{
						res = ((sum+sum1+sum7)*sum2)/10; 
					}
				%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=res%> </strong></td>
			</tr>
			</table>
			
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			
		</div>
	</div>	
</body>
</html>
