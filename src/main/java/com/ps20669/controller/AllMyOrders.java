package com.ps20669.controller;

import java.util.List;
import java.util.Optional;

import com.ps20669.model.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps20669.dao.OrderDAO;
import com.ps20669.dao.OrderDetailDAO;
import com.ps20669.model.Account;
import com.ps20669.model.Order;
import com.ps20669.service.SessionService;

@Controller
@RequestMapping("/home")
public class AllMyOrders{

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	OrderDetailDAO orderDetailDAO;

	@Autowired
	SessionService sessionService;

	@RequestMapping("/allOrders")
	public String myOrders(Model model) {
		Account currentAccount = sessionService.get("accountLogin");
		List<Order> orders = orderDAO.findOrderByAccountUsername(currentAccount.getUsername());
		model.addAttribute("orders", orders);
		return "/user/allMyOrders";
	}

	@RequestMapping("/myOrderDetail")
	public String myOrderDetails(Model model, @RequestParam("orderID") long orderID, @RequestParam("p") Optional<Integer> p) {
		Optional<Order> orderOpt = orderDAO.findById(orderID);
		if (orderOpt.isEmpty()) {
			return "redirect:/home/allOrders"; // Redirect if order not found
		}
		Order order = orderOpt.get();
		model.addAttribute("order", order);

		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<OrderDetail> page = orderDetailDAO.findByOrder(orderID, pageable);
		model.addAttribute("page", page);
		return "/user/myOrderDetail";
	}
}
