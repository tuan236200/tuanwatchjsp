<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
</head>
<body>
	<%@ include file="/common/header.jsp" %> <!-- Nhúng header -->
	
	<!-- Start Login Page -->
    <div class="container-fluid bg-light py-4">
        <div class="col-6 m-auto text-center">
            <h1 class="fw-bold">Login To Tai's Store</h1>
            <p>Đăng Nhập Vào Mua Đồ Của Tuấn</p>
        </div>
    </div>
	<!-- Close Login Page -->
	
	<!-- Start Login -->
	<form action="/home/login" method="POST" class="m-auto col-6 shadow p-3 mt-4 mb-4">
			<div class="alert alert-info text-center py-2" role="alert">
				Login - Đăng Nhập<br>
				<small class="text-danger">${messL}</small>
			</div>
			<div class="form-group row mb-3">
				<label class="col-2 col-form-label fw-bold">Username</label>
				<div class="col-10">
					<input class="col-10 form-control" name="username" type="text" placeholder="Enter Username ?">
				</div>
			</div>
			<div class="form-group row mb-3">
				<label class="col-2 col-form-label fw-bold">Password</label>
				<div class="col-10">
					<input class="col-10 form-control" name="password" type="password" placeholder="Enter Password ?">
				</div>
			</div>
			<div class="form-group row mb-3">
				<label class="col-2 col-form-label"></label>
				<div class="col-10">
					<input class="form-check-input" name="remember" type="checkbox" value="true"> Remember ?
				</div>
			</div>
			<div class="form-group row mb-3">
				<label class="col-2 col-form-label"></label>
				<div class="col-10">
					<small>Bạn Chưa Có Tải Khoản ? <a href="/home/register" class="fw-bold"> Tạo Tài Khoản</a></small>
				</div>
			</div>
			<button class="btn btn-primary fw-bold">Đăng Nhập</button>
	</form>
	<!-- Close Login Page -->
	
	<%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>
</html>