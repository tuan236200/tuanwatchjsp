package com.ps20669.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps20669.service.MailerService;
import com.ps20669.model.Account;
import com.ps20669.service.AccountDaoService;

@Controller
@RequestMapping("/home")
public class ForgotPasswordController {
	
	@Autowired
	AccountDaoService accountDaoService; 
	@Autowired
	MailerService mailer;
	
	@GetMapping("/forgotPassword")
	public String getForgotPassword() {
		return "/user/forgotPassword";
	}
	
	@PostMapping("/forgotPassword")
	public String postForgotPassword(Model model, @RequestParam("username") String username, @RequestParam("email") String email) throws MessagingException {
		Account account = accountDaoService.resetPassword(username, email); // đã có random password
		if(account != null) { // nếu tài khoản có username & email đó có tồn tại
			mailer.sendEmail(account, "forgot_Pass"); // forgot_pass tên đặt bên mailerserviceimpl
			model.addAttribute("messF", "Hãy Kiểm Tra Email, Chúng Tôi Đã Gửi Mật Khẩu Mới !");
		}else {
			model.addAttribute("messF", "Username & Email Không Hợp Lệ !");
		}
		return "/user/forgotPassword";
	}
}
