<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
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
            <h1 class="fw-bold">Sign Up For An Account</h1>
            <p>Đăng Ký Tài Khoản ?</p>
        </div>
    </div>
	<!-- Close Login Page -->
	
	<!-- Start Login -->
	<form action="/home/register/created" method="POST" class="m-auto col-6 shadow p-4 mt-4 mb-4" enctype="multipart/form-data">
			<div class="alert alert-info py-2" role="alert">
				Register Account - Đăng Ký Tài Khoản<br>
				<small class="text-danger">${messR}</small>
			</div>
			<div class="form-group mb-3">
				<label class="fw-bold">Username Or Email Address *:</label>
				<input type="text" name="username" class="form-control" placeholder="Enter Username Or Email Address ?"/>
			</div>
			<div class="form-group mb-3">
				<label class="fw-bold">Password *:</label> 
				<input type="password" name="password" class="form-control" placeholder="Enter Password ?"/>
			</div>
			<div class="form-group mb-3">
				<label class="fw-bold">Fullname *:</label> 
				<input type="text" name="fullname" class="form-control" placeholder="Enter Fullname ?"/>
			</div>
			<div class="form-group mb-3">
				<label class="fw-bold">Email Address *:</label> 
				<input type="email" name="email" class="form-control" placeholder="Enter Email Address ?"/>
			</div>
			<div class="form-group mb-3">
				<label class="fw-bold">Avatar *:</label> 
				<input type="file" name="photo" class="form-control"/>
			</div>	
			<button class="btn btn-primary fw-bold py-2 px-4">SIGN UP</button>
	</form>
	<!-- Close Login Page -->
	
	<%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>
</html>