package com.ps20669.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps20669.dao.AccountDAO;
import com.ps20669.model.Account;

@Controller
@RequestMapping("/home")
public class ChangePasswordController {
	
	@Autowired
	AccountDAO accountDAO;
	
	@GetMapping("/changePassword")
	public String getChangePass() {
		return "/user/changePassword";
	}
	
	@PostMapping("/changePassword")
	public String postChangePass(Model model, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("newpassword") String newpassword, @RequestParam("confirmpassword") String confirmpassword) {
		try {
			Account currentAccount = accountDAO.findById(username).get(); // lấy account hiện tại - (tìm account theo username)
				if(!currentAccount.getPassword().equals(password)) { // nếu mật khẩu của account hiện tại != mật khẩu nhập
					model.addAttribute("messC", "Wrong Password!"); // báo sai mật khẩu
				}else { // nếu mật khẩu của account hiện tại == mật khẩu nhập
					if(newpassword.equals(confirmpassword)) { // nếu field password mới == field nhập lại password mới
						currentAccount.setPassword(confirmpassword); // setPassword == field nhập lại password mới;
						accountDAO.save(currentAccount); // lưu lại thông tin
						model.addAttribute("messC", "Password is changed!"); // thông báo password đã đổi
					}else { // ngược lại nếu field password mới != field nhập lại password mới
						model.addAttribute("messC", "Confirm Password not match New Password!"); // thông báo password nhập lại không khớp vs password mới
					}
				}
		} catch (Exception e) {
			model.addAttribute("messC", "Account invalid!"); // nếu username không tồn tại thì thông báo...
		}
		return "user/changePassword";
	}
}
