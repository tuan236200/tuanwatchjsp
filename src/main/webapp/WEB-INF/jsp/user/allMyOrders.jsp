<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>All My Orders</title>
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
            <h1 class="fw-bold">All My Orders</h1>
            <p>Tất Cả Hóa Đơn !</p>
        </div>
    </div>
	<!-- Close Title -->
	
	<!-- Start OrderDetail Page -->
	<div class="m-auto container col-8 mt-5 mb-5">
	<table class="table table-hover border shadow mt-3">
		<thead>
			<tr>
				<th>NO.</th>
				<th>ORDER ID</th>
				<th>CREATE DATE</th>
				<th>PHONE NUMBER</th>
				<th>ADDRESS</th>
				<th>ORDER DETAILS</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="stt" value="0" />
			<c:forEach var="item" items="${orders}">
			<tr class="align-middle">
				<td>${stt = stt + 1}</td>
				<td>${item.id}</td>
				<td>${item.createDate}</td>
				<td>${item.phonenumber}</td>
				<td>${item.address}</td>
				<td><a href="/home/myOrderdetail?orderID=${item.id}" class="btn btn-outline-success"><i class="far fa-eye"></i> View Details</a></td>
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