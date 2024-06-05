<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Edit My Profile</title>
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
            <h1 class="fw-bold">EDIT MY PROFILE</h1>
            <p>Chỉnh Sửa Hồ Sơ Cá Nhân ?</p>
        </div>
    </div>
	<!-- Close Cart Page -->
	
	<!-- Start Cart -->
	<div class="container mx-auto col-10 mt-5 mb-5">
			<form action="/home/editProfile" method="POST" class="col-6 p-0 m-auto mt-5 mb-5 shadow rounded">
				<div class="p-3">
				<div class="alert alert-info" role="alert">
					Edit My Profile - Chỉnh Sửa Hồ Sơ Cá Nhân <br>
					<small class="text-danger">${messE}</small>
				</div>
				<hr class="p-0">
					<div class="form-group mb-3">
						<c:if test="${accountLogin.admin == false}"> <!-- Nếu là user -->
							<img src="/images/Users/${accountLogin.photo}" class="img-fluid w-25 d-block mx-auto">
						</c:if>
						<c:if test="${accountLogin.admin == true}"> <!-- Nếu là admin -->
							<img src="/images/Admins/${accountLogin.photo}" class="img-fluid w-25 d-block mx-auto">
						</c:if>
					</div>
					<div class="form-group mb-3">
						<label class="fw-bold">Username:</label> 
						<input type="text" name="username" class="form-control" value="${accountLogin.username}" readonly>
					</div>
					<div class="form-group mb-3">
						<label class="fw-bold">Fullname:</label> 
						<input type="text" name="username" class="form-control" value="${accountLogin.fullname}">
					</div>
					<div class="form-group mb-3">
						<label class="fw-bold">Email:</label> 
						<input type="email" name="email" class="form-control" value="${accountLogin.email}">
					</div>
					<div class="form-group text-end">
						<button class="btn btn-primary fw-bold py-2 px-3">
							<i class="fas fa-exchange-alt"></i> Edit
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