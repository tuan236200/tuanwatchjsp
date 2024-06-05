package com.ps20669.controller;

import java.io.File;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ps20669.dao.AccountDAO;
import com.ps20669.model.Account;
import com.ps20669.service.CookieService;
import com.ps20669.service.SessionService;

@Controller
@RequestMapping("/home")
public class HomeController {
	// CÁC CHỨC NĂNG : LOGIN - LOGOUT
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	CookieService cookieService;
	@Autowired
	SessionService sessionService;
	@Autowired
	ServletContext context;
	
	@RequestMapping("/index")
	public String index() {
		return "/user/index";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "/user/about";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "/user/contact";
	}
	
	@RequestMapping("/shop-single")
	public String shop2() {
		return "/user/shop-single";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@PostMapping("/login")
	public String login(Model model, @RequestParam("username") String username, @RequestParam("password") String password) throws IOException {
		Account accountLogin = accountDAO.findByUsernameAndPassword(username, password); // DSL
		if(accountLogin != null) {
			sessionService.set("accountLogin", accountLogin);
			sessionService.set("messL", "Đăng Nhập Thành Công !");
		}else {
			sessionService.set("messL", "Đăng Nhập Thất Bại !");
			return "redirect:/home/login"; // trả lại trang đăng nhập
		}
		return "redirect:/home/index";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		sessionService.remove("accountLogin");
		sessionService.remove("messL");
		return("redirect:/home/index");
	}
	
	@GetMapping("/register")
	public String getregister(Model model) {
		return "/user/register";
	}
	
	@PostMapping("/register/created")
	public String postregister(Model model,
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("fullname") String fullname,
			@RequestParam("email") String email,
			@RequestParam("photo") MultipartFile photo) { // lấy giá trị đã nhập từ form
		try {
			Account account = new Account();
			account.setUsername(username);
			account.setPassword(password);
			account.setFullname(fullname);
			account.setEmail(email);
			account.setPhoto(photo.getOriginalFilename());
			account.setActivated(true);
			account.setAdmin(false);
			Account accountR = accountDAO.findByUsername(username);
			if(accountR != null) {
				model.addAttribute("messR", "Created account failed ! Username exists !");
				return "/user/register";
			}else {
				System.out.println(account);
				accountDAO.save(account);
				photo.transferTo(new File(context.getRealPath("/images/photo/"+photo.getOriginalFilename()))); // tạo ảnh trong folder
				model.addAttribute("messR", "Created account successfully ! <a href='/home/login' style='fw-bold'><small>Login ?</small></a>");
				
			}
		} catch (Exception e) {
			model.addAttribute("messR", "Created account failed ! \n" +e.getMessage());
		}
		return "/user/register";
	}
}
