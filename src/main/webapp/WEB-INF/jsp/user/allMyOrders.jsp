<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<title>All Orders</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/common/library.jsp" %>
</head>

<body>
<%@ include file="/common/header.jsp" %>

<div class="container-fluid bg-light py-4">
	<div class="col-6 m-auto text-center">
		<h1 class="fw-bold">All Orders</h1>
		<p>Tất Cả Đơn Hàng</p>
	</div>
</div>

<div class="m-auto container col-8 mt-5 mb-5">
	<table class="table table-hover border shadow mt-3">
		<thead>
		<tr>
			<th>NO.</th>
			<th>Order Date</th>
			<th>Order ID</th>
			<th>Phone Number</th>
			<th>Address</th>
			<th>Order Details</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="stt" value="0" />
		<c:forEach var="order" items="${orders}">
			<tr class="align-middle">
				<td class="text-center">${stt = stt + 1}</td>
				<td>${order.orderDate}</td>
				<td>${order.id}</td>
				<td>${order.phonenumber}</td>
				<td>${order.address}</td>
				<td class="text-center">
					<a href="/home/myOrderDetail?orderID=${order.id}" class="btn btn-primary btn-sm">Chi Tiết Đơn Hàng</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="/common/footer.jsp" %>
<%@ include file="/common/script.jsp" %>
</body>

</html>
