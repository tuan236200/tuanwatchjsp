<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>Product Detail Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
</head>
<body>
    <%@ include file="/common/header.jsp" %> <!-- Nhúng header -->

    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="/images/Products/${product.image}" alt="Card image cap" id="product-detail">
                    </div>
                    <div class="row">
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="prev">
                                <i class="text-dark fas fa-chevron-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </div>
                        <!--End Controls-->
                        <!--Start Carousel Wrapper-->
                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                            <!--Start Slides-->
                            <div class="carousel-inner product-links-wap" role="listbox">
                                <!--First slide-->
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/images/Products/${product.image}" alt="Product Image 1">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/images/Products/${product.image}" alt="Product Image 2">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/images/Products/${product.image}" alt="Product Image 3">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.First slide-->
                            </div>
                            <!--End Slides-->
                        </div>
                        <!--End Carousel Wrapper-->
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="next">
                                <i class="text-dark fas fa-chevron-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <!--End Controls-->
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="h2">${product.name}</h1>
                            <p class="h3 py-2"><fmt:formatNumber value="${product.price}" type="number"></fmt:formatNumber><sup>VNĐ</sup></p>
                            <p class="py-2">
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <span class="list-inline-item text-dark">Rating 4.8 | 36 Comments</span>
                            </p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Brand - Thương hiệu:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>Easy Wear</strong></p>
                                </li>
                            </ul>

                            <h6>Description - Mô tả:</h6>
                            <p>Sản phẩm có thiết kế siêu đẹp !</p>
                            <!--<ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Avaliable Color :</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>White / Black</strong></p>
                                </li>
                            </ul>-->

                            <h6>Specification - Chi tiết:</h6>
                            <ul class="list-unstyled pb-3">
                                <li>Chất lượng cao</li>
                                <li>Giá thành phải chăng</li>
                                <li>Dễ phối đồ</li>
                                <li>Thể hiện được cá tính của bạn</li>
                                <li>Sản phẩm lỗi sẽ được hoàn trả</li>
                                <li>Cam kết chất lượng</li>
                                <li>Uy tín tạo nên thương hiệu</li>
                            </ul>

                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item">Size :
                                                <input type="hidden" name="product-size" id="product-size" value="S">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size" id="s" onclick="doimauS()">S</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size" id="m" onclick="doimauM()">M</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size" id="l" onclick="doimauL()">L</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size" id="xl" onclick="doimauXL()">XL</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                Quantity
                                                <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                            <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <button type="submit" class="btn btn-success btn-lg" name="submit" value="buy">Buy</button>
                                    </div>
                                    <div class="col d-grid">
                                        <button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocard">Add To Cart</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->

    <!-- Start Article -->
    <section class="py-5">
        <div class="container">
            <div class="row text-left p-2 pb-3">
                <h4>Related Products</h4>
            </div>

            <!--Start Carousel Wrapper-->
            <div id="carousel-related-product">
            <div class="row">
            	<c:forEach items="${products}" var="item">
                <div class="p-2 pb-3 col-3">
                    <div class="product-wap card rounded-0">
                        <div class="card rounded-0">
                            <img class="card-img rounded-0 img-fluid" style="width:100%; height:300px" src="/images/Products/${item.image}">
                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                    <li><a class="btn btn-success text-white" href="#"><i class="far fa-heart"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="/home/shop-single/${item.category.id}/${item.id}"><i class="far fa-eye"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="/home/cart"><i class="fas fa-cart-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <a href="/home/shop-single/${item.category.id}/${item.id}" class="h3 text-decoration-none" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                            	<label style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display:block">${item.name}</label> <!-- css: nếu title dài quá thì che đi để khỏi xuống hàng và thay kí tự thừa  ... -->
                            </a>
                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                <li>M/L/X/XL</li>
                                <li class="pt-2">
                                    <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                    <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                </li>
                            </ul>
                            <ul class="list-unstyled d-flex justify-content-center mb-1">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                            </ul>
                            <p class="text-center mb-0"><fmt:formatNumber value="${item.price}" type="number"></fmt:formatNumber><sup>VNĐ</sup></p>
                        </div>
                    </div>
                </div>
               	</c:forEach>
				</div> <!-- ROW -->
            </div>
        </div>
    </section>
    <!-- End Article -->

    <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
        function doimauS(){
			document.getElementById('s').style.color = "blue";
			document.getElementById('m').style.color = "white";
			document.getElementById('l').style.color = "white";
			document.getElementById('xl').style.color = "white";
		}
        function doimauM(){
			document.getElementById('s').style.color = "white";
			document.getElementById('m').style.color = "blue";
			document.getElementById('l').style.color = "white";
			document.getElementById('xl').style.color = "white";
		}
        function doimauL(){
			document.getElementById('s').style.color = "white";
			document.getElementById('m').style.color = "white";
			document.getElementById('l').style.color = "blue";
			document.getElementById('xl').style.color = "white";
		}
        function doimauXL(){
			document.getElementById('s').style.color = "white";
			document.getElementById('m').style.color = "white";
			document.getElementById('l').style.color = "white";
			document.getElementById('xl').style.color = "blue";
		}
    </script>
    <!-- End Slider Script -->

</body>

</html>