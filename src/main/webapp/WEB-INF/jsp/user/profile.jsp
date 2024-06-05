<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>My Profile</title>
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
            <h1 class="fw-bold">MY PROFILE</h1>
            <p>Hồ Sơ Cá Nhân ?</p>
        </div>
    </div>
	<!-- Close Cart Page -->
	
	<!-- Start Cart -->
	<div class="container mx-auto col-10 mt-5 mb-5">
			<form action="/home/editProfile" method="GET" class="col-6 p-0 m-auto mt-5 mb-5 shadow rounded">
				<div class="p-3">
				<div class="alert alert-info" role="alert">
					My Profile - Hồ Sơ Cá Nhân
				</div>
				<!-- <small class="text-danger">${messC}</small> -->
				<hr class="p-0">
					<div class="form-group mb-3">
						<img src="/images/photo/${accountLogin.photo}" class="img-fluid w-25 d-block mx-auto">
					</div>
					<div class="form-group mb-3">
						<label class="fw-bold">Username:</label> 
						<input type="text" name="username" class="form-control" value="${accountLogin.username}" readonly>
					</div>
					<div class="form-group mb-3">
						<label class="fw-bold">Fullname:</label> 
						<input type="text" name="username" class="form-control" value="${accountLogin.fullname}" readonly>
					</div>
					<div class="form-group mb-3">
						<label class="fw-bold">Email:</label> 
						<input type="email" name="email" class="form-control" value="${accountLogin.email}" readonly>
					</div>
					<div class="form-group text-end">
						<button class="btn btn-primary fw-bold py-2 px-3">
							<i class="fas fa-exchange-alt"></i> Edit Profile ?
						</button>
					</div>
				</div>
			</form>
	</div>
	<!-- Close Cart Page -->

	<%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>
</html>