package com.ps20669.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
	Integer id;
	String name;
	double price;
	String image;
	int qty = 1;
}
