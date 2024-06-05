<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Account</title>
<%@ include file="/common/library_admin.jsp" %> <!-- NHÚNG CÁC CSS, THƯ VIỆN -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<%@ include file="/common/header_admin.jsp" %> <!-- HEADER -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Account Controller</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item">Controller</li>
								<li class="breadcrumb-item active">Account List</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Account List</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Photo</th>
									<th>Username</th>
									<th>Password</th>
									<th>Fullname</th>
									<th>Email</th>
									<th>Activated</th>	
									<th>Admin</th>	
									<th>Action</th>	
								</tr>
							</thead>
							<tbody >
								<c:forEach var="account" items="${listAccounts}">
								<tr>
									<td class="align-middle" style="width:100px"><img class="w-50 d-block mx-auto" src="/images/photo/${account.photo}"></td>
									<td class="align-middle">${account.username}</td>
									<td class="align-middle">${account.password}</td>
									<td class="align-middle">${account.fullname}</td>
									<td class="align-middle">${account.email}</td>
									<td class="align-middle">${account.activated == true ? 'Activated' : 'Deactivated'}</td>
									<td class="align-middle">${account.admin == true ? 'Admin' : 'User'}</td>
									<td class="align-middle"><a href="/admin/accountEdit?username=${account.username}" class="btn btn-warning">Edit</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="/common/footer_admin.jsp"%> <!-- FOOTER -->
	</div>
	<!-- END .WRAPPER -->
	<%@ include file="/common/script_admin.jsp" %> <!-- NHÚNG SCRIPT -->
</body>
</html>