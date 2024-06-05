<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Account</title>
<%@ include file="/common/library_admin.jsp" %> <!-- NHÚNG CÁC CSS, THƯ VIỆN -->
<style>
.custom-file-input2::-webkit-file-upload-button {
  background: white;
  border: 2px solid #999;
  border-radius: 4px;
  margin-top: -10px;
  margin-left: -12px;
  padding-top: 7px;
  padding-bottom: 6px;
  outline: none;
  white-space: nowrap;
  -webkit-user-select: none;
  font-weight: 700;
  font-size: 15px;
}
</style>
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
								<li class="breadcrumb-item active">Account Edit</li>
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
				<div class="container-fluid col-9">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Account Edit</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form enctype="multipart/form-data" action="/admin/accountEdit" method="POST">
							<div class="card-body">
								<div class="row">
									<div class="form-group col-6">
										<label for="exampleInputUsername">Username*</label> 
										<input name="username" value="${account.username}" type="text" class="form-control" id="exampleInputUsername" placeholder="Enter Username" required>
									</div>
									<div class="form-group col-6">
										<label for="exampleInputPassword">Password*</label> 
										<input name="password" value="${account.password}" type="password" class="form-control" id="exampleInputPassword" placeholder="Enter Password" required>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-6">
										<label for="exampleInputFullname">Fullname*</label> 
										<input name="fullname" value="${account.fullname}" type="text" class="form-control" id="exampleInputFullname" placeholder="Enter Fullname" required>
									</div>
									<div class="form-group col-6">
										<label for="exampleInputEmail">Email*</label> 
										<input name="email" value="${account.email}" type="email" class="form-control" id="exampleInputEmail" placeholder="Enter Email" required>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-6">
										<label>Status*</label>
										<div class="ml-4">
											<input name="activated" value="true" ${account.activated == true ? 'checked' : ''} type="radio" class="form-check-input" id="exampleInputActivated" required>
											<label for="exampleInputActivated" class="mr-4">Activated</label> 
											<input name="activated" value="false" ${account.activated == false ? 'checked' : ''} type="radio" class="form-check-input" id="exampleInputDeactivated" required>
											<label for="exampleInputDeactivated">Deactivated</label> 
										</div>
									</div>
									<div class="form-check col-6">
										<label>Role*</label>
										<div class="ml-4">
											<input name="admin" value="true" ${account.admin == true ? 'checked' : ''} type="radio" class="form-check-input" id="exampleInputAdmin" required>
											<label for="exampleInputAdmin" class="mr-4">Admin</label> 
											<input name="admin" value="false" ${account.admin == false ? 'checked' : ''} type="radio" class="form-check-input" id="exampleInputUser" required>
											<label for="exampleInputUser">User</label> 
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group mb-3 col-12">
										<label class="fw-bold">Choose Avatar *:</label> 
										<input type="file" name="photo" class="custom-file-input2 form-control"/> <!-- vì dùng bootstrap 4 nê form-control trong type=file không có hoạt động như bootstrap 5 -->
										<img src="/images/photo/${account.photo}" class="w-25 img-thumbnail">
									</div>
								</div>
							</div>
							<!-- /.card-body -->
							<div class="card-footer">
								<button type="submit" formaction="/admin/accountEdit/create" class="btn btn-success">Create</button>
								<button type="submit" formaction="/admin/accountEdit/update" class="btn btn-info">Update</button>
								<button type="submit" formaction="/admin/accountEdit/reset" class="btn btn-secondary">Reset</button>
								<button type="submit" formaction="/admin/accountEdit/deactive" class="btn btn-danger">Deactivated Account</button>
							</div>
						</form>
					</div>
					<!-- /.card -->
				</div>
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