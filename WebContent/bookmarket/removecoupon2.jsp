<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.coupon2"%>
<%@ page import="dao.coupon2Repository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}

	coupon2Repository dao = coupon2Repository.getInstance();
	
	coupon2 product = dao.getBookById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<coupon2> cartList1 = (ArrayList<coupon2>) session.getAttribute("cartlist3");
	coupon2 goodsQnt = new coupon2();
	for (int i = 0; i < cartList1.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList1.get(i);
		if (goodsQnt.getBookId().equals(id)) {
			cartList1.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>