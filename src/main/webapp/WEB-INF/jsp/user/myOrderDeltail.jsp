<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<title>My OrderDetail</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/common/library.jsp" %>
	<style>
		.disabled_a {
			pointer-events: none;
		}
	</style>
</head>

<body>
<%@ include file="/common/header.jsp" %>

<div class="container-fluid bg-light py-4">
	<div class="col-6 m-auto text-center">
		<h1 class="fw-bold">My OrderDetails</h1>
		<p>Chi Tiết Hóa Đơn Của Bạn !</p>
	</div>
</div>

<div class="m-auto container col-8 mt-5 mb-5">
	<table class="table table-hover border shadow mt-3">
		<thead>
		<tr>
			<th>NO.</th>
			<th style="width:150px">Product Image</th>
			<th>Product Name</th>
			<th>Product Price</th>
			<th>Quantity</th>
			<th>TOTAL PRICE</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="stt" value="0" />
		<c:forEach var="item" items="${page.content}">
			<tr class="align-middle">
				<td class="text-center">${stt = stt + 1}</td>
				<td><img src="/images/Products/${item.product.image}" class="img-fluid w-75 mx-auto d-block" style="height:90px"></td>
				<td>${item.product.name}</td>
				<td>${item.product.price}</td>
				<td>${item.quantity}</td>
				<td>${item.product.price * item.quantity}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="row">
	<ul class="pagination pagination-lg justify-content-center">
		<li class="page-item">
			<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="/home/myOrderDetail?orderID=${order.id}&p=0" tabindex="-1"><i class="fas fa-angle-double-left"></i></a>
		</li>
		<li class="page-item">
			<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark ${page.number == 0 ? 'disabled_a text-muted' : ''}" href="/home/myOrderDetail?orderID=${order.id}&p=${page.number-1}"><i class="fas fa-angle-left"></i></a>
		</li>
		<c:forEach var="sotrang" begin="1" end="${page.totalPages}">
			<li class="page-item">
				<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 fw-bold text-dark ${page.number == sotrang-1 ? 'active text-white' : ''}" href="/home/myOrderDetail?orderID=${order.id}&p=${sotrang-1}">${sotrang}</a>
			</li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark ${page.number == page.totalPages-1 ? 'disabled_a text-muted' : ''}" href="/home/myOrderDetail?orderID=${order.id}&p=${page.number+1}"><i class="fas fa-angle-right"></i></a>
		</li>
		<li class="page-item">
			<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="/home/myOrderDetail?orderID=${order.id}&p=${page.totalPages-1}"><i class="fas fa-angle-double-right"></i></a>
		</li>
	</ul>
</div>

<%@ include file="/common/footer.jsp" %>
<%@ include file="/common/script.jsp" %>
</body>

</html>
