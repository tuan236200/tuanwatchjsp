<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>Home User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
	
    <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
	
	<!-- Slick - Shop-Single -->
    <link rel="stylesheet" type="text/css" href="<c:url value='assets/css/slick.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='assets/css/slick-theme.css'/>">
</head>
<body>
	<%@ include file="/common/header.jsp" %> <!-- Nhúng header -->
	
	<jsp:include page="${views}"/> <!-- nhúng phần thân của các trang -->
	
	<%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>
</html>