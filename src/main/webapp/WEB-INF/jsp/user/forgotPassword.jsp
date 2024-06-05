<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Forgot Password</title>
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
            <h1 class="fw-bold">FORGOT PASSWORD</h1>
            <p>Quên Mật Khẩu ?</p>
        </div>
    </div>
	<!-- Close Cart Page -->
	
	<!-- Start Cart -->
	<div class="container mx-auto col-10 mt-5 mb-5">
			<form action="/home/forgotPassword" method="POST" class="col-6 p-0 m-auto mt-5 mb-5 shadow rounded">
				<div class="p-3">
				<div class="alert alert-info text-center py-2" role="alert">
					Find Account - Forgot Password <br>
					<small class="text-danger">${messF}</small>
				</div>
				<hr class="p-0">
					<div class="form-group mb-3">
						<label class="fw-bold">Username*:</label> 
						<c:if test="${accountLogin != null}"> <!-- Nếu đã đăng nhập thì hiện form này -->
							<input type="text" name="username" class="form-control" value="${accountLogin.username}" readonly>
						</c:if>
						<c:if test="${accountLogin == null}"> <!-- Nếu chưa đăng nhập thì hiện form này -->
							<input type="text" name="username" class="form-control" placeholder="Enter Username ?" required>
						</c:if>
					</div>
					<div class="form-group mb-3">
						<label class="fw-bold">Email*:</label> 
						<input type="email" name="email" class="form-control" placeholder="Enter Email ?" required>
					</div>
					<div class="form-group text-end">
						<button class="btn btn-primary fw-bold py-2 px-3">
							<i class="fas fa-trash-restore-alt"></i> Password Recovery
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