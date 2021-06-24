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

	ArrayList<coupon2> goodsList = dao.getAllcoupons();
	coupon2 goods = new coupon2();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getBookId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<coupon2> list = (ArrayList<coupon2>) session.getAttribute("cartlist3");
	if (list == null) { 
		list = new ArrayList<coupon2>();
		session.setAttribute("cartlist3", list);
	}

	int cnt = 0;
	coupon2 goodsQnt = new coupon2();
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