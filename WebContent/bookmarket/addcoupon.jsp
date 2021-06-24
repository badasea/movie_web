<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.coupon"%>
<%@ page import="dao.couponRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}

	couponRepository dao = couponRepository.getInstance();

	coupon product = dao.getBookById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<coupon> goodsList = dao.getAllcoupons();
	coupon goods = new coupon();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getBookId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<coupon> list = (ArrayList<coupon>) session.getAttribute("cartlist1");
	if (list == null) { 
		list = new ArrayList<coupon>();
		session.setAttribute("cartlist1", list);
	}

	int cnt = 0;
	coupon goodsQnt = new coupon();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getBookId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("cart.jsp");
%>