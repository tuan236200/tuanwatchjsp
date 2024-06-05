<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>Orderdetail</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
	
	<style>
		.list-group-item{
			border: 0px;
			padding-left: 0px;
			padding-bottom: 1px;
		}
	</style>
</head>

<body>
    <%@ include file="/common/header.jsp" %> <!-- Nhúng header -->

	<!-- Start Title -->
    <div class="container-fluid bg-light py-4">
        <div class="col-6 m-auto text-center">
            <h1 class="fw-bold">OrderDetail</h1>
            <p>Chi Tiết Hóa Đơn !</p>
        </div>
    </div>
	<!-- Close Title -->
	
	<!-- Start OrderDetail Page -->
	<div class="m-auto container col-8 mt-5 mb-5">
	<div class="py-3 border rounded" style="background-image: linear-gradient(to bottom, #d1e7dd,   #E0FFFF);">
		<span class="my-auto ms-3" style="color: #0f5132">Order Successfully ! - Đặt Hàng Thành Công !</span>
	</div>
	<ul class="list-group">
		<li class="list-group-item"><b class="fw-bold">Order ID:</b> ${order.id}</li>
		<li class="list-group-item"><b class="fw-bold">Fullname:</b> ${order.account.fullname}</li>
		<li class="list-group-item"><b class="fw-bold">Phone Number:</b> ${order.phonenumber}</li>
		<li class="list-group-item"><b class="fw-bold">Address:</b> ${order.address}</li>
		<li class="list-group-item"><b class="fw-bold">Email:</b> ${order.account.email}</li>
		<li class="list-group-item"><b class="fw-bold">CreateDate:</b> ${order.createDate}</li>
	</ul>
	<table class="table table-hover border mt-3">
		<thead>
			<tr>
				<th>PRODUCT ID</th>
				<th>PRODUCT NAME</th>
				<th>PRICE</th>
				<th>QUANTITY</th>
				<th>TOTAL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${items}">
			<input type="hidden" name="id" value="${item.id}">
			<tr>
				<td>${item.product.id}</td>
				<td>${item.product.name}</td>
				<td>${item.price}</td>
				<td>${item.quantity}</td>
				<td>${item.price*item.quantity}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<!-- Close OrderDetail Page -->


    <%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>

</html>