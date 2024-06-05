package com.ps20669.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class EditProfileController {
	
	@RequestMapping("/profile")
	public String profile() {
		return "/user/profile";
	}
	
	@GetMapping("/editProfile")
	public String geteditProfile() {
		return "/user/editProfile";
	}
	
	@PostMapping("/editProfile")
	public String posteditProfile(Model model) {
		model.addAttribute("messE", "Chức Năng Này Chưa Hoàn Thành !");
		return "/user/editProfile";
	}
}
