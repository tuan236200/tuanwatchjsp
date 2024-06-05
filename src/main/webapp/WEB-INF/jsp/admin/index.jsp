<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN</title>
<%@ include file="/common/library_admin.jsp"%>
<!-- NHÚNG CÁC CSS, THƯ VIỆN -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<%@ include file="/common/header_admin.jsp"%>
		<div class="content-wrapper">

			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<section class="content"></section>
		</div>
		<%@ include file="/common/footer_admin.jsp"%>
	</div>
	<%@ include file="/common/script_admin.jsp"%>
</body>
</html>