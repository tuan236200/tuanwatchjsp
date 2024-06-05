package com.ps20669.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps20669.dao.OrderDAO;
import com.ps20669.dao.OrderDetailDAO;
import com.ps20669.model.Account;
import com.ps20669.model.Order;
import com.ps20669.model.OrderDetail;
import com.ps20669.service.SessionService;


@Controller
@RequestMapping("/home")
public class AllMyOrders {
	
	@Autowired
	OrderDAO orderDAO; 
	
	@Autowired
	OrderDetailDAO 	orderDetailDAO;
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/allOrders")
	public String myorders(Model model) {
		Account currentAccount = sessionService.get("accountLogin"); // lấy từ bên homecontroller
		List<Order> orders = orderDAO.findOrderByAccountUsername(currentAccount.getUsername());
		model.addAttribute("orders", orders);
		return "/user/allMyOrders";
	}
	
	@RequestMapping("/myOrderdetail")
	public String myorderdetails(Model model, @RequestParam("orderID") long orderID, @RequestParam("p") Optional<Integer> p) {
		Order order = new Order();
		List<Order> orders = orderDAO.findAll(); // lấy tất cả orders
		for (Order ord : orders) { // cho chạy vòng lặp
			if (ord.getId() == orderID) { // nếu id trong mảng = orderID (id được lấy từ @Requestparam)
				order = ord; // gán ord mới tìm được vào order
				break;
			}
		}
		model.addAttribute("order", order); // gán vào để lấy id để phân trang
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<OrderDetail> page = orderDetailDAO.findByOrder(orderID, pageable); // lấy tất cả orderdetail có orderID = orderID và phân trang
		model.addAttribute("page", page);
		return "/user/myOrderDeltail";
	}
}
