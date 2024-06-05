package com.ps20669.service;

import java.util.Collection;

import com.ps20669.model.CartItem;

public interface ShoppingCartService {
	/**
	 * Thêm mặt hàng vào giỏ hoặc tăng số lượng lên 1 nếu đã tồn tại
	 * @param item là mặt hàng cần thêm
	 * @return mặt hàng đã được thêm vào hoặc cập nhật số lượng
	 */
	CartItem add(Integer id);
// -----------------------------------------------------------------------------------------------------------------------------
	
	/**
	 * Giảm số lượng đi 1, đến 1 thì không giảm được nữa
	 * @param id mã mặt hàng
	 * @return mặt hàng đã được thay đổi số lượng
	 */
	CartItem sub(Integer id);
// -----------------------------------------------------------------------------------------------------------------------------
	/**
	 * Xóa mặt hàng khỏi giỏ
	 * @param id mã mặt hàng cần xóa
	 */
	void remove(Integer id);
	
// -----------------------------------------------------------------------------------------------------------------------------
	/**
	 * Thay đổi số lượng lên của mặt hàng trong giỏ
	 * @param id mã mặt hàng
	 * @param qty số lượng mới
	 * @return mặt hàng đã được thay đổi số lượng
	 */
	CartItem update(Integer id, int qty);
	
// -----------------------------------------------------------------------------------------------------------------------------
	/**
	 * Xóa sạch các mặt hàng trong giỏ
	 */
	void clear();
	
// -----------------------------------------------------------------------------------------------------------------------------
	/**
	 * Lấy tất cả các mặt hàng trong giỏ
	 */
	Collection<CartItem> getItems();

// -----------------------------------------------------------------------------------------------------------------------------
	/**
	 * Lấy tổng số lượng các mặt hàng trong giỏ
	 */
	int getCount();
	
// -----------------------------------------------------------------------------------------------------------------------------
	/**
	 * Lấy tổng số tiền tất cả các mặt hàng trong giỏ
	 */
	double getAmount();
}
