package com.ps20669.controller;

import java.util.List;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps20669.dao.OrderDAO;
import com.ps20669.dao.OrderDetailDAO;
import com.ps20669.model.Account;
import com.ps20669.model.CartItem;
import com.ps20669.model.Order;
import com.ps20669.model.OrderDetail;
import com.ps20669.model.Product;
import com.ps20669.service.SessionService;
import com.ps20669.service.ShoppingCartService;

@Controller
@RequestMapping("/home")
public class CheckInfoController {

	@Autowired
	ShoppingCartService shoppingService;
	@Autowired
	SessionService sessionService;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailDAO orderDetailDAO;

	@RequestMapping("/checkinfo")
	public String checkinfo(Model model, @RequestParam("productSize") int productSize) { // lấy productSize từ bên cart.jsp
		model.addAttribute("cart", shoppingService);
		if (productSize == 0) { // nếu mảng product trong cart không có phần tử nào (tức là trong cart ko có sản phẩm) thì...
			return "redirect:/home/cart";
		}
		sessionService.set("size", productSize);
		return "/user/check_info_order";
	}

	@RequestMapping("/orderDetail")
	public String orderDetail(Model model, @RequestParam("phonenumber") String phonenumber, @RequestParam("address") String address) {
		// Redirect to cart page if the cart is empty
		if (shoppingService.getItems().isEmpty()) {
			return "redirect:/home/cart";
		}

		// Redirect to checkinfo if phone number or address is empty
		if (phonenumber.isEmpty() || address.isEmpty()) {
			return "redirect:/home/checkinfo?productSize=" + sessionService.get("size");
		}

		try {
			// Get the logged-in user
			Account currentUser = sessionService.get("accountLogin");
			if (currentUser == null) {
				throw new IllegalStateException("User not logged in");
			}

			// Create a new order
			Order order = new Order();
			order.setAccount(currentUser);
			order.setPhonenumber(phonenumber);
			order.setAddress(address);
			order.setOrderDate(LocalDate.now()); // Ensure order date is set
			orderDAO.save(order);

			// Save order details
			for (CartItem item : shoppingService.getItems()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(order);
				orderDetail.setPrice(item.getPrice());
				orderDetail.setQuantity(item.getQty());

				Product product = new Product();
				product.setId(item.getId());
				product.setName(item.getName());
				orderDetail.setProduct(product);
				orderDetailDAO.save(orderDetail);
			}

			// Clear the cart
			shoppingService.clear();

			// Fetch order details and add to model
			List<OrderDetail> items = orderDetailDAO.findByOrderID(order.getId());
			model.addAttribute("order", order);
			model.addAttribute("items", items);
			return "/user/orderDetail";

		} catch (Exception e) {
			// Handle the exception and log it if needed
			e.printStackTrace();
			return "redirect:/error"; // Redirect to the custom error page if there is an exception
		}
	}}
