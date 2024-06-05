package com.ps20669.controller;

import java.util.List;

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
		if(productSize == 0) { // nếu mảng product trong cart không có phần tử nào (tức là trong cart ko có sản phẩm) thì...
			return "redirect:/home/cart";
		}
		sessionService.set("size", productSize);
		return "/user/check_info_order";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail(Model model, @RequestParam("phonenumber") String phonenumber, @RequestParam("address") String address) {
		if(shoppingService.getItems().size() > 0) { // lấy tất cả mặt hàng trong giỏ (.size() trả về số ptu trong mảng)... nếu > 0 (tức là có mặt hàng trong giỏ) thì...
			if(phonenumber.equals("") && address.equals("")) { // nếu field sđt rồng và địa chỉ rỗng thì..
				return "redirect:/home/checkinfo?productSize="+sessionService.get("size"); // quay lại home/checkinfo
			}else { // ngược lại, phonenumber && address được nhập
				Account currentUser = sessionService.get("accountLogin"); // lấy attribute("accountLogin") từ bên homeController
				Order order = new Order();
				order.setAccount(currentUser); // set lấy username
				order.setPhonenumber(phonenumber);
				order.setAddress(address);
				orderDAO.save(order); // hàm lưu
				for(CartItem item : shoppingService.getItems()) {
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
				shoppingService.clear();
				List<OrderDetail> items = orderDetailDAO.findByOrderID(order.getId());
				model.addAttribute("order", order);
				model.addAttribute("items",items);
				return "/user/orderDetail";
			}
		}else {
			return "redirect:/home/cart";
		}
	}
}
