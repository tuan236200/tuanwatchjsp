package com.ps20669.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Orderdetails")
public class OrderDetail implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="oderdetailid") // khóa chính có tên OderDetailId
	Long id;
	Double price;
	Integer quantity;
	
	@ToString.Exclude
	@ManyToOne @JoinColumn(name = "productid")
	Product product;
	
	@ToString.Exclude
	@ManyToOne @JoinColumn(name = "orderid")
	Order order;
	
}
