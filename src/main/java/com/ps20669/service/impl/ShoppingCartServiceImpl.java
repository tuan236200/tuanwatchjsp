package com.ps20669.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.ps20669.model.CartItem;
import com.ps20669.model.Product;
import com.ps20669.service.ShoppingCartService;

import com.ps20669.dao.ProductDAO;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	ProductDAO productDAO;
	Map<Integer, CartItem> map = new HashMap<>();
	
	@Override
	public CartItem add(Integer id) {
		CartItem item = map.get(id);
		if(item == null) {
			Product product = productDAO.findById(id).get();
			item = new CartItem();
			item.setId(product.getId());
			item.setName(product.getName());
			item.setImage(product.getImage());
			item.setPrice(product.getPrice());
			item.setQty(1);
			map.put(id, item);
		} else {
			item.setQty(item.getQty() + 1);
		}
		return item;
	}
	
	@Override
	public CartItem sub(Integer id) {
		CartItem item = map.get(id);
		if (item == null) {
			Product product = productDAO.findById(id).get();
			item = new CartItem();
			item.setId(product.getId());
			item.setImage(product.getImage());
			item.setName(product.getName());
			item.setPrice(product.getPrice());
			item.setQty(1);
			map.put(id, item);
		} else {
			if(item.getQty() > 1) {
				item.setQty(item.getQty() - 1);
			}else {
				item.setQty(1);
			}
		}
		return item;
	}
	
	@Override
	public void remove(Integer id) {
		map.remove(id);
	}
	
	@Override
	public CartItem update(Integer id, int qty) {
		CartItem item = map.get(id);
		item.setQty(qty);
		return item;
	}
	
	@Override
	public void clear() {
		map.clear();
	}
	
	@Override
	public Collection<CartItem> getItems() {
		return map.values();
	}
	
	@Override
	public int getCount() {
		return map.values().stream()
				.mapToInt(item -> item.getQty())
				.sum();
	}
	
	@Override
	public double getAmount() {
		return map.values().stream()
				.mapToDouble(item -> item.getPrice()*item.getQty())
				.sum();
	}
}
