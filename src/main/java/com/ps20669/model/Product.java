package com.ps20669.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.ToString;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="productid") // khóa chính có tên ProductId
	Integer id;
	
	String name;
	String image;
	Double price;
	Integer quantity;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date createDate = new Date();
	
	Boolean available;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "categoryid")
	Category category;
	
	
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
	
	
}
