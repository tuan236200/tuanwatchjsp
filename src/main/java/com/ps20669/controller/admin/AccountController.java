package com.ps20669.controller.admin;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ps20669.dao.AccountDAO;
import com.ps20669.model.Account;
import com.ps20669.service.SessionService;

@Controller
@RequestMapping("/admin")
public class AccountController {
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ServletContext context;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/accountList")
	public String accountList(Model model) {
		List<Account> listAccounts = accountDAO.findAll();
		model.addAttribute("listAccounts", listAccounts);
		return "/admin/accountList";
	}
	
	@RequestMapping("/accountIndex")
	public String accountEdit() {
		return "/admin/accountEdit";
	}
	
	@RequestMapping("/accountEdit")
	public String getaccountEdit(Model model, @RequestParam("username") String username) {
		Account account = accountDAO.findByUsername(username);
		model.addAttribute("account", account);
		sessionService.set("username", username);
		return "/admin/accountEdit";
	}
	
	@RequestMapping("/accountEdit/create")
	public String accountCreate(Model model, @RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("activated") Boolean activated, @RequestParam("admin") Boolean admin,
			@RequestParam("photo") 	MultipartFile photo) {
		try {
			Account account = new Account();
			account.setUsername(username);
			account.setPassword(password);
			account.setFullname(fullname);
			account.setEmail(email);
			account.setPhoto(photo.getOriginalFilename());
			account.setActivated(activated);
			account.setAdmin(admin);
			accountDAO.save(account);
			photo.transferTo(new File(context.getRealPath("/images/photo/" + photo.getOriginalFilename()))); // tạo ảnh trong folder photo																									// folder
		} catch (Exception e) {
			model.addAttribute("messAcc", e.getMessage());
		}
		return "redirect:/admin/accountIndex";
	}
	
	@RequestMapping("/accountEdit/update")
	public String accountUpdate(Model model, @RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("activated") Boolean activated, @RequestParam("admin") Boolean admin,
			@RequestParam("photo") 	MultipartFile photo) {
		try {
			Account account = new Account();
			account.setUsername(username);
			account.setPassword(password);
			account.setFullname(fullname);
			account.setEmail(email);
			if(photo.getOriginalFilename().equals("")) {
				Account account2 = new Account();
				account2 = accountDAO.findById(username).get();
				account.setPhoto(account2.getPhoto());
			}else {
				account.setPhoto(photo.getOriginalFilename());
			}
			account.setActivated(activated);
			account.setAdmin(admin);
			accountDAO.save(account);
			photo.transferTo(new File(context.getRealPath("/images/photo/" + photo.getOriginalFilename()))); // tạo ảnh trong folder photo																									// folder
			System.out.println(new File(context.getRealPath("/images/photo/" + photo.getOriginalFilename())));
		} catch (Exception e) {
			model.addAttribute("messAcc", e.getMessage());
		}
		return "redirect:/admin/accountEdit?username="+sessionService.get("username");
	}
	
	@RequestMapping("/accountEdit/reset")
	public String accountReset() {
		return "/admin/accountEdit";
	}
	
	@RequestMapping("/accountEdit/deactive")
	public String accountDeactive(Model model, @RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("activated") Boolean activated, @RequestParam("admin") Boolean admin,
			@RequestParam("photo") 	MultipartFile photo) {
		try {
			Account account = new Account();
			account.setUsername(username);
			account.setPassword(password);
			account.setFullname(fullname);
			account.setEmail(email);
			account.setPhoto(photo.getOriginalFilename());
			account.setActivated(false);
			account.setAdmin(admin);
			accountDAO.save(account);
		} catch (Exception e) {
			model.addAttribute("messAcc", e.getMessage());
		}
		return "redirect:/admin/accountEdit?username="+sessionService.get("username");
	}
	
}
