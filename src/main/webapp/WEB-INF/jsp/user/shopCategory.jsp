<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>Category</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
     <!-- Nhúng các CSS, icon (library) -->
	<%@ include file="/common/library.jsp" %>
	<link rel="stylesheet" href="/assets/css/style.css">
	<style>
		.disabled_a{
			pointer-events: none;
		}
	</style>
</head>

<body>
	<%@ include file="/common/header.jsp" %> <!-- Nhúng header -->
	
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
			<div class="col-lg-3">
				<h1 class="h2 pb-4 fw-bold">Categories</h1>
				<ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Gender
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled ms-3">
                            <li><a class="text-decoration-none" href="/home/shop/Đồng Hồ Quân Đội">Men</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="text-decoration-none" href="/home/shop/Đồng Hồ Thời Trang">Women</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Product
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled ms-3">
                        	<c:forEach var="typep" items="${type}">
                            	<li><a class="text-decoration-none" href="/home/shop/${typep.name}">${typep.name}</a></li>
                            	<li><hr class="dropdown-divider"></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="pb-3">
                    	<div class="wrapper">
							<label class="collapsed d-flex justify-content-between h3 text-decoration-none">
								Price Range
							</label>
							<form action="/home/shop/${categoryName}" method="POST">
								<div class="price-input">
									<div class="field">
										<span>MIN</span>
										<input type="text" class="input-min" value="${minprice}" name="min">
									</div>
									<div class="separator">-</div>
									<div class="field">
										<span>MAX</span>
										<input type="text" class="input-max" value="${maxprice}" name="max">
									</div>
								</div>
								<div class="slider">
									<div class="progress"></div>
								</div>
								<div class="range-input">
        							<input type="range" class="range-min" min="${minprice}" max="${maxprice - maxprice/100}" value="${minprice}" step="${maxprice/100}">
        							<input type="range" class="range-max" min="${maxprice/100}" max="${maxprice}" value="${maxprice}" step="${maxprice/100}">
      							</div>
      							<button class="mt-4 btn btn-primary">SEARCH</button>
							</form>
						</div>
                    </li>
                </ul>
			</div>

			<div class="col-lg-9">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="/home/shop">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">Men's</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="#">Women's</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 pb-4">
                        <div class="d-flex">
                            <select class="form-control">
                                <option>Featured</option>
                                <option>A to Z</option>
                                <option>Item</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                <c:forEach items="${page.content}" var="item">
                    <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" style="width=100%; height:320px" src="/images/Products/${item.image}">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white" href="#"><i class="far fa-heart"></i></a></li>
                                        <li><a class="btn btn-success text-white mt-2" href="/home/shop-single/${item.category.id}/${item.id}"><i class="far fa-eye"></i></a></li>
                                        <li><a class="btn btn-success text-white mt-2" href="/home/cart/add/${item.id}"><i class="fas fa-cart-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="/home/shop-single/${item.category.id}/${item.id}" class="h3 text-decoration-none">
                               		<label style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display:block">${item.name}</label>
                                </a> <!-- css: nếu title dài quá thì che đi để khỏi xuống hàng và thay kí tự thừa m ... -->
                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                    <!--<li>M/L/X/XL</li>-->
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
                                        <i class="text-warning fa fa-star"></i>
                                        <!--<i class="text-muted fa fa-star"></i>-->
                                    </li>
                                </ul>
                                <p class="text-center mb-0"><fmt:formatNumber value="${item.price}" type="number"></fmt:formatNumber><sup>VNĐ</sup></p>
                            </div>
                        </div>
                    </div>
                    <input name="categoryID" type="hidden" value="${item.category.id}"> <!-- lấy idCategory của product để hiện thị ra các sp cùng loại -->
                    </c:forEach>
                </div>
                <div class="row">
                	<div class="col-6 my-auto">
						<p class="h3">Showing <b class="text-danger">${page.number*6 + 1}</b> to <b class="text-danger">${page.number*6 + page.numberOfElements}</b> of <b class="text-danger">${page.totalElements}</b> products</p>
                    </div>
                    <ul class="col-6 pagination pagination-lg justify-content-center">
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="/home/shop/${categoryName}?p=0&min=${min}&max=${max}" tabindex="-1"><i class="fas fa-angle-double-left"></i></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark ${page.number == 0 ? 'disabled_a text-muted' : ''}" href="/home/shop/${categoryName}?p=${page.number-1}&min=${min}&max=${max}"><i class="fas fa-angle-left"></i></a>
                        </li>
           				<!-- LẶP SỐ TRANG -->
           				<c:forEach var="sotrang" begin="${first >= page.totalPages - 3 ? page.totalPages - 3 >= 1 ? page.totalPages - 3 : 1 : first}" end="${end >= page.totalPages ? page.totalPages : end}"> <!-- Begin: nếu page cuối - 3 >= 1 thì cho begin = 1, không thì cho bằng first -->
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 fw-bold text-dark ${page.number == sotrang-1 ? 'active text-white' : ''}" href="/home/shop/${categoryName}?p=${sotrang-1}&min=${min}&max=${max}">${sotrang}</a>    
                        </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark ${page.number == page.totalPages-1 ? 'disabled_a text-muted' : ''}" href="/home/shop/${categoryName}?p=${page.number+1}&min=${min}&max=${max}"><i class="fas fa-angle-right"></i></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="/home/shop/${categoryName}?p=${page.totalPages-1}&min=${min}&max=${max}"><i class="fas fa-angle-double-right"></i></a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!-- End Content -->

    <!-- Start Brands -->
    <section class="bg-light py-5">
        <div class="container my-4">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Our Brands</h1>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        Lorem ipsum dolor sit amet.
                    </p>
                </div>
                <div class="col-lg-9 m-auto tempaltemo-carousel">
                    <div class="row d-flex flex-row">
                        <!--Controls-->
                        <div class="col-1 align-self-center">
                            <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                <i class="text-light fas fa-chevron-left"></i>
                            </a>
                        </div>
                        <!--End Controls-->

                        <!--Carousel Wrapper-->
                        <div class="col">
                            <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example" data-bs-ride="carousel">
                                <!--Slides-->
                                <div class="carousel-inner product-links-wap" role="listbox">

                                    <!--First slide-->
                                    <div class="carousel-item active">
                                        <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_01.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_02.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_03.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_04.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End First slide-->

                                    <!--Second slide-->
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_01.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_02.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_03.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_04.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Second slide-->

                                    <!--Third slide-->
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_01.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_02.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_03.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="/images/brand_04.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Third slide-->

                                </div>
                                <!--End Slides-->
                            </div>
                        </div>
                        <!--End Carousel Wrapper-->

                        <!--Controls-->
                        <div class="col-1 align-self-center">
                            <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                <i class="text-light fas fa-chevron-right"></i>
                            </a>
                        </div>
                        <!--End Controls-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--End Brands-->
    
    <%@ include file="/common/footer.jsp" %> <!-- Nhúng footer -->
	
	<%@ include file="/common/script.jsp" %> <!-- Nhúng JS -->
</body>

</html>