package com.ps20669.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class HomeController_Admin {

	@RequestMapping("/index")
	public String index() {
		return "/admin/index";
	}
	
	@RequestMapping("/index3.html")
	public String index2() {
		return "/admin/accountList";
	}
}
