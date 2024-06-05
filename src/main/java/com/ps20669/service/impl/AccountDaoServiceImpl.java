package com.ps20669.service.impl;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps20669.dao.AccountDAO;
import com.ps20669.model.Account;
import com.ps20669.service.AccountDaoService;

@Service
public class AccountDaoServiceImpl implements AccountDaoService {

	@Autowired
	AccountDAO accountDAO;
	
	@Override
	public Account resetPassword(String username, String email) {
		Account accountExist = accountDAO.findByUsernameAndEmail(username, email);
		if(accountExist != null) {
			String chuoi = "qwertyuiopasdfghjkl1234567890zxcvbnmQWERTYUIOP1234567890ASDFGHJKLZXCVBNM!@#$%^&*()_";
			int len = 6;
			char[] password = new char[len];
			Random random = new Random();
			for(int i=0; i<len; i++) {
				password[i] = chuoi.charAt(random.nextInt(chuoi.length()));
			}
			accountExist.setPassword(new String(password)); // gán password mới
			return accountDAO.save(accountExist); // cập nhật lại thông tin
		}
		return null;
	}
	

}
