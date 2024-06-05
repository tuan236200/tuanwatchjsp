package com.ps20669.controller;

import java.text.DecimalFormat;


import java.text.NumberFormat;
import java.util.List;


import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps20669.dao.CategoryDAO;
import com.ps20669.dao.ProductDAO;
import com.ps20669.model.Category;
import com.ps20669.model.Product;
import com.ps20669.service.SessionService;

@Controller
@RequestMapping("/home")
public class ShopController {

	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	HttpServletRequest request;
	@Autowired
	SessionService sessionService;
	
	public String formatPrice(Double price) { // hàm format price
		String format = "###";
		NumberFormat formatter = new DecimalFormat(format);
		return formatter.format(price); // trả về chuỗi
	}
	
	@RequestMapping("/shop")
	public String shopPage(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = productDAO.findAll(pageable);
		model.addAttribute("page", page);
		List<Category> list = categoryDAO.findAll(); // lấy list xổ ra Menu product type
		model.addAttribute("type", list);
		Product productmax = productDAO.findMaxPrice(); // tìm giá cao nhất trong tất cả sản phẩm
		model.addAttribute("maxprice", formatPrice(productmax.getPrice()));
		Product productmin = productDAO.findMinPrice(); // tìm giá THẤP nhất trong tất cả sản phẩm
		model.addAttribute("minprice", formatPrice(productmin.getPrice()));
		// first - end dunfg ddeer set số trang tối đa hiển thị = 4
		model.addAttribute("first", page.getNumber() + 1);
		model.addAttribute("end", page.getNumber() + 4);
		return "/user/shop";
	}
	
	// LỌC THEO GIÁ VÀ THEO LOẠI
	@RequestMapping("/shop/{name}")
	public String shopCategory(Model model, @PathVariable("name") String categoryName, @RequestParam("p") Optional<Integer> p,
			@RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) { //tên trong @PathVariable("name") phải trùng với @RequestMapping("/shop/{name}") : name = name
		Double minPrice = min.orElse(Double.MIN_VALUE);
		Double maxPrice = max.orElse(Double.MAX_VALUE);
		sessionService.set("max", maxPrice);
		sessionService.set("min", minPrice);
		model.addAttribute("categoryName", categoryName); // truyền sang shopcategory.jsp
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = productDAO.findByCategoryNameAndPricePage(categoryName, minPrice, maxPrice, pageable); // tìm theo name & giá & phân trang
		model.addAttribute("page", page);
		String categoryID = "";
		for (Product product : page) {
			categoryID = product.getCategory().getId();
			break;
		}
		if(categoryID == "") { // nếu id rỗng thì tìm giá cao nhất trong tất cả sp
			Product productmax = productDAO.findMaxPrice(); // tìm giá CAO nhất trong tất cả sản phẩm
			model.addAttribute("maxprice", formatPrice(productmax.getPrice()));
			Product productmin = productDAO.findMinPrice(); // tìm giá THẤP nhất trong tất cả sản phẩm
			model.addAttribute("minprice", formatPrice(productmin.getPrice()));
		}else {
			Product productmax = productDAO.findMaxPriceByCategoryID(categoryID); // tìm giá cao nhất trong 1 loại sản phẩm
			model.addAttribute("maxprice", formatPrice(productmax.getPrice()));
			Product productmin = productDAO.findMinPriceByCategoryID(categoryID); // tìm giá thấp nhất trong 1 loại sản phẩm
			model.addAttribute("minprice", formatPrice(productmin.getPrice()));
		}
		List<Category> list = categoryDAO.findAll(); // lấy list xổ ra Menu product type
		model.addAttribute("type", list);
		// first - end dunfg ddeer set số trang tối đa hiển thị = 4
		model.addAttribute("first", page.getNumber() + 1);
		model.addAttribute("end", page.getNumber() + 4);
		return "/user/shopCategory";
	}
	
	@RequestMapping("/shop-single/{idCategory}/{idProduct}")
	public String shopCategory(Model model, @PathVariable("idCategory") String idCategory, @PathVariable("idProduct") Integer idProduct) { //tên trong @PathVariable("name") phải trùng với @RequestMapping("/shop/{name}") : name = name
		Product product = productDAO.findById(idProduct).get(); // hiển sp được chọn theo idProduct lên chi tiết sp
		model.addAttribute("product", product);
		List<Product> list = productDAO.findByCategoryID(idCategory); // hiển thị các sản phẩm tương tự lên shop-single
		model.addAttribute("products", list);
		System.out.println(idCategory);
		return "/user/shop-single";
	}
	
	// lọc theo giá sản phẩm
	@RequestMapping("/shop/price")
	public String searchGia(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		Double minPrice = min.orElse(Double.MIN_VALUE);
		Double maxPrice = max.orElse(Double.MAX_VALUE);
		sessionService.set("max", maxPrice);
		sessionService.set("min", minPrice);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = productDAO.findByPrice(minPrice, maxPrice, pageable);
		model.addAttribute("page", page);
		List<Category> list = categoryDAO.findAll(); // lấy list xổ ra Menu product type
		model.addAttribute("type", list);
		Product productmax = productDAO.findMaxPrice(); // tìm giá cao nhất trong tất cả sản phẩm
		model.addAttribute("maxprice", formatPrice(productmax.getPrice()));
		Product productmin = productDAO.findMinPrice(); // tìm giá THẤP nhất trong tất cả sản phẩm
		model.addAttribute("minprice", formatPrice(productmin.getPrice()));
		// first - end dunfg ddeer set số trang tối đa hiển thị = 4
		model.addAttribute("first", page.getNumber() + 1);
		model.addAttribute("end", page.getNumber() + 4);
		return "user/shopPriceRange";
	}
}
