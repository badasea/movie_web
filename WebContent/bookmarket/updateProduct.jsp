<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">영화 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String productId = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from book where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src ="<%=request.getContextPath()%>/resources/images/<%=rs.getString("b_fileName")%>" style ="width: 100%">
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">영화 코드</label>
						<div class="col-sm-3">
							<input type="text" id="bookId" name="bookId" class="form-control" value='<%=rs.getString("b_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">영화명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("b_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("b_unitPrice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">감독</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("b_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">개봉일</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("b_publisher")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New "> 신규 영화
							<input type="radio" name="condition" value="Old"> 재개봉 영화
							<input type="radio" name="condition" value="Refurbished"> E-Movive
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>
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
</body>
</html>
