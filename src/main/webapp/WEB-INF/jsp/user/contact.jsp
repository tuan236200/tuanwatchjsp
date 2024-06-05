<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
	
    <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
    <%@ include file="/common/header.jsp" %> <!-- Nhúng header -->

    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center fw-bold">
            <h1 class="fw-bold">Contact Us</h1>
            <p>
                Liên Hệ & Góp Ý Cho Chúng Tôi !
            </p>
        </div>
    </div>
	<!-- Close Content Page -->
	
	<div class="row m-0 shadow"> <!-- START ROW -->
    	<!-- Start Map -->
    	<div class="map text-center col-6 border p-4">
    		<iframe width="100%" height="100%" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5646.318719897067!2d106.62800402947578!3d10.85360488846771!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528dfcf546de7%3A0xf872809fb8deded!2zVHLGsMahzIBuZyBDYW8gxJDEg8yJbmcgRlBUIFBvbHl0ZWNobmljIEjhu5MgQ2jDrSBNaW5o!5e0!3m2!1svi!2s!4v1686363105912!5m2!1svi!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    	</div>
    	<!-- End Map -->

		<!-- Start Contact -->
		<div class="col-6 border p-4">
				<form action="/home/send_Feedback" method="POST" class="m-auto" role="form_send_email">
				<div class="alert alert-info py-2" role="alert">
					Feedback - Góp Ý <br>
					<c:if test="${messFeedback == null}">
						<small class="text-danger">Mọi thắc mắc cũng như đóng góp ý kiến của quý khách, xin vui lòng nhập form bên dưới !	</small>
					</c:if>
					<small class="text-danger">${messFeedback}</small>
				</div>
					<div class="row">
						<div class="form-group col-md-6 mb-3">
							<label for="inputname">Name</label> <input type="text"
								class="form-control mt-1" id="name" name="name"
								placeholder="Name">
						</div>
						<div class="form-group col-md-6 mb-3">
							<label for="inputemail">Email</label> <input type="email"
								class="form-control mt-1" id="from" name="from"
								placeholder="Email">
						</div>
					</div>
					<div class="mb-3">
						<label for="inputsubject">Subject</label> <input type="text"
							class="form-control mt-1" id="subject" name="subject"
							placeholder="Subject">
					</div>
					<div class="mb-3">
						<label for="inputmessage">Message</label>
						<textarea class="form-control mt-1" id="body" name="body"
							placeholder="Message" rows="8"></textarea>
					</div>
					<div class="row">
						<div class="col text-end mt-2">
							<button type="submit" class="btn btn-success btn-lg px-3">Send Feedback</button>
						</div>
					</div>
				</form>
		</div>
		<!-- End Contact -->
	</div> <!-- END ROW -->
    
    
    
    <!-- Start Map -->
    <!-- 
    <div id="mapid" style="width: 100%; height: 300px;"></div>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
    <script>
        var mymap = L.map('mapid').setView([-23.013104, -43.394365, 13], 13);

        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 18,
            attribution: 'Zay Telmplte | Template Design by <a href="https://templatemo.com/">Templatemo</a> | Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
                '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                'Imagery Â© <a href="https://www.mapbox.com/">Mapbox</a>',
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1
        }).addTo(mymap);

        L.marker([-23.013104, -43.394365, 13]).addTo(mymap)
            .bindPopup("<b>Zay</b> eCommerce Template<br />Location.").openPopup();

        mymap.scrollWheelZoom.disable();
        mymap.touchZoom.disable();
    </script> -->
    <!-- End Map --> 

    <%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
    
    <%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>

</html>