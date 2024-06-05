package com.ps20669.service;

import com.ps20669.model.Account;

public interface AccountDaoService {
	/** Tìm account có tồn tại hay không và random password mới
	*@param username tên đăng nhập đã đăng ký
	*@param email email đã đăng ký 
	*@return trả về một account với mật khẩu mới được random hoặc null nếu account có username và email đó không tồn tại
	**/
	Account resetPassword(String username, String email);
}
