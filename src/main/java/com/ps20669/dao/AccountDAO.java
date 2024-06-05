package com.ps20669.dao;


import org.springframework.data.jpa.repository.JpaRepository;


import com.ps20669.model.Account;
import java.util.List;




public interface AccountDAO extends JpaRepository<Account, String> {
	
	Account findByUsernameAndEmail(String username, String email);
	
	Account findByUsernameAndPassword(String username, String password); // giành cho chức năng đăng nhập
	
	Account findByUsername(String username); // giành cho chức năng đăng nhập
	
}
