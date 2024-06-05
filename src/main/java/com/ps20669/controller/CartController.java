package com.ps20669.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ps20669.service.ParamService;
import com.ps20669.service.SessionService;
import com.ps20669.service.ShoppingCartService;


@Controller
@RequestMapping("/home")
public class CartController {
	
	@Autowired
	ShoppingCartService cartService;
	@Autowired
	ParamService param;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("cart", cartService);
		model.addAttribute("cart_NoProduct", cartService.getItems().size()); // lấy size() để truyền qua cart.jsp. nếu cart_NoProduct = 0 thì hiển giỏ hàng chưa có sản phẩm
		return "/user/cart";
	}
	
	@RequestMapping("/cart/add/{idProduct}")
	public String add(@PathVariable("idProduct") Integer id) {
		cartService.add(id);
		return "redirect:/home/cart";
	}
	
	@RequestMapping("/cart/sub/{idProduct}")
	public String sub(@PathVariable("idProduct") Integer id) {
		cartService.sub(id);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/remove/{idProduct}")
	public String remove(@PathVariable("idProduct") Integer id) {
		cartService.remove(id);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/update")
	public String update() {
		Integer id = param.getInt("idProduct", 0);
		int qty = param.getInt("qty", 0);
		cartService.update(id, qty);
		System.out.println(id);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cartService.clear();
		return "redirect:/home/cart";
	}

}
