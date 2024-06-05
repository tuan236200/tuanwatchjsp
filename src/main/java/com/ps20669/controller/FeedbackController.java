package com.ps20669.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps20669.service.MailerService;

@Controller
@RequestMapping("/home")
public class FeedbackController {
	@Autowired
	MailerService mailerService;
	
	@RequestMapping("/send_Feedback")
	public String sendFeedback(Model model,
			@RequestParam("name") String name,
			@RequestParam("from") String from,
			@RequestParam("subject") String subject,
			@RequestParam("body") String body) {
		String from_name = name+" <"+from+">"; //
		String to = "ititiu20345@student.hcm.edu.vn"; // mặc định địa chỉ nhận email khi gửi feed back
		try{
			mailerService.sendFeedback(from_name, to, subject, body);
			model.addAttribute("messFeedback", "Gửi feedback thành công !");
		}
		catch(Exception ex){
			model.addAttribute("messFeedback", "Gửi feedback thất bại !");
			System.out.println(ex.getMessage());
		}
		return "/user/contact";
	}
}
