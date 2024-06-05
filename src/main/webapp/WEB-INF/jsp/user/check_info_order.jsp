<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>Check Information</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
</head>

<body>
    <%@ include file="/common/header.jsp" %> <!-- Nhúng header -->

	<!-- Start Title -->
    <div class="container-fluid bg-light py-4">
        <div class="col-6 m-auto text-center">
            <h1 class="fw-bold">Check Payment Information</h1>
            <p>Kiểm Tra Thông Tin Thanh Toán Của Bạn !</p>
        </div>
    </div>
	<!-- Close Title -->
	
	<!-- Start CheckInfo Page -->
	<form action="/home/orderDetail" method="POST" class="m-auto col-6 shadow p-4 my-4">
		<div class="alert alert-info py-3" role="alert">
			Enter And Check Payment Information - Nhập Và Kiểm Tra Thông Tin Thanh Toán
		</div>
		<hr>
		<div class="YourDeliveryAddress">
			<h3 class="fw-bold">Your Delivery Address</h3>
		</div>
		<div class="FormDeliveryAddress">
			<div class="form-group mb-3">
				<label>Phone Number *:</label>
				<input type="tel" name="phonenumber" class="form-control" placeholder="Phone Number ? (Required)" required>
			</div>
			<div class="form-group mb-3">
				<label>Address *:</label> 
				<input type="text" name="address" class="form-control" placeholder="Address ? (Required)" required>
			</div>
		</div>
		<hr>
		<div class="YourOrder">
			<h3 class="fw-bold">Your Order</h3>
		</div>
		<div class="FormOrder border p-4">
			<div class="row"> <!-- DIV ROW START -->
				<div class="col-8 pe-0">
					<label class="fw-bold" style="display:block">Product Name x Quantity</label>
					<hr>
					<c:forEach var="item" items="${cart.items}">
						<small style="display:block">${item.name} <b> x ${item.qty}</b></small> <!-- Tên SP x Số Lượng -->
						<hr>
					</c:forEach>
					<label class="text-primary fw-bold" style="display:block">Total Price All Products</label>
				</div>
				<div class="col-4 ps-0">
					<label class="fw-bold" style="display:block">Total Price/Product</label>
					<hr>
					<c:forEach var="item" items="${cart.items}">
						<small style="display:block"><fmt:formatNumber value="${item.price * item.qty}" type="number"></fmt:formatNumber><sup>VNĐ</sup></small>
						<hr>
					</c:forEach>
					<label class="text-primary fw-bold" style="display:block"><fmt:formatNumber value="${cart.getAmount()}" type="number"></fmt:formatNumber><sup>VNĐ</sup></label>
				</div>
			</div> <!-- DIV ROW END -->
		</div>
		<button class="btn btn-warning py-2 mt-2 fw-bold shadow" style="width:100%; text-shadow: 0 0 3px white;">ORDER - ĐẶT HÀNG</button>
	</form>
	<!-- Close CheckInfo Page -->


    <%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>

</html>