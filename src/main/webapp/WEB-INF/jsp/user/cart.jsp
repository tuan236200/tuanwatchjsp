<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>My Cart</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
</head>
<body>
	<%@ include file="/common/header.jsp" %> <!-- Nhúng header -->
	
	<!-- Start Cart Page -->
    <div class="container-fluid bg-light py-4">
        <div class="col-6 m-auto text-center">
            <h1 class="fw-bold">My Cart</h1>
            <p>Những Sản Phẩm Bạn Lựa Chọn</p>
        </div>
    </div>
	<!-- Close Cart Page -->
	
	<!-- Start Cart -->
	<div class="container mx-auto col-10 mt-5 mb-5">
	<c:if test="${cart_NoProduct == 0}"> <!-- Nếu cart_Noproduct == 0 (ko có sp nào) -->
		<h3 class="fw-bold text-center">Giỏ Hàng Của Bạn Hiện Chưa Có Sản Phẩm Nào !! <i class="far fa-times-circle"></i></h3>
	</c:if>
	<div class="border border-bottom-0">
		<c:forEach var="item" items="${cart.items}">
			<form action="/home/cart/update" method="POST" class="mt-3">
				<input type="hidden" name="idProduct" value="${item.id}">
				<div class="form-group mb-3 row">
					<div class="col-2 pe-1">
						<img src="/images/Products/${item.image}" class="w-75 img-thumbnail mx-auto d-block">
					</div>
					<div class="col-6 p-0 my-auto">
						<div class="fw-bold">${item.name}</div>
						<div>
							<label class="fw-bold">Số Lượng: </label>
							<a class="btn btn-success text-white btn-xs fw-bold" style="width: 40px;" href="/home/cart/sub/${item.id}">-</a>
							<input name="qty" min="0" value="${item.qty}" onblur="this.form.submit()" style="width: 50px; border:none" class="text-center">
							<a class="btn btn-success text-white btn-xs fw-bold" style="width: 40px;" href="/home/cart/add/${item.id}">+</a>
						</div>
						<div>
							<a href="/home/cart/remove/${item.id}" class="btn btn-outline-primary btn-sm fw-bold"><i class="far fa-trash-alt"></i> Xóa</a>
						</div>
					</div>
					<div class="col-4 p-0 mt-4">
						<label class="text-danger"><b class="text-dark fw-bold">Giá SP: </b><fmt:formatNumber value="${item.price}" type="number"></fmt:formatNumber><sup>VNĐ</sup></label><br>
						<label class="text-danger"><b class="text-dark fw-bold">Thành Tiền: </b><fmt:formatNumber value="${item.price * item.qty}" type="number"></fmt:formatNumber><sup>VNĐ</sup></label>
					</div>
				</div>
			</form> <!-- FORM -->
			<hr>
		</c:forEach> <!-- Mỗi Lần Thêm SP Sẽ Thêm 1 Nội Dung Trong FOREACH -->
		</div>
		<!-- ALL BUTTON -->
	<div class="row mt-3">
		<div class="col-5">
			<a href="/home/cart/clear" class="btn btn-outline-danger btn-lg fw-bold"><i class="fas fa-minus-square"></i> Xóa Giỏ Hàng</a> 
			<a href="/home/shop" class="btn btn-outline-danger btn-lg fw-bold"><i class="fas fa-plus-square"></i> Thêm Sản Phẩm Khác</a>
		</div>
		<div class="col-4 ms-auto"> <!-- ms-auto: đẩy sang trái -->
				<div class="border rounded mb-3">
					<ul class="list-group">
						<li class="list-group-item py-3 fw-bold">Total: <span><fmt:formatNumber value="${cart.getAmount()}" type="number"></fmt:formatNumber></span></li>
					</ul>
					<c:if test="${accountLogin == null}">
						<a href="/home/login" class="btn btn-outline-dark fw-bold btn-lg" style="width:100%;">Mua Hàng</a>
					</c:if>
					<c:if test="${accountLogin != null && cart_NoProduct !=0}"> <!-- Nếu đã đăng nhập & giỏ hàng phải có sản phẩm thì mới hiện nút mua hàng -->
						<form action="/home/checkinfo" method="POST"> <!-- truyền sang checkinfo -->
							<input name="productSize" value="${cart_NoProduct}" type="hidden"> <!-- lấy giá trị cart_noproduct để truyền sang checkInfoController để kiểm tra... Nếu = 0 thì không cho qua trang nhập thông tin thanh toán  -->
							<button class="btn btn-outline-dark fw-bold btn-lg" style="width:100%">Mua Hàng</button>
						</form>
					</c:if>
				</div>
		</div>
	</div>
	<!-- END ALL BUTTON -->
	</div>
	<!-- Close Cart Page -->

	<%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>
</html>