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
@Table(name="Orders")
public class Order implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="orderid") // khóa chính có tên OrderId
	Long id;
	String phonenumber;
	String address;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "createdate")
	Date createDate = new Date();
	
	@ToString.Exclude
	@ManyToOne @JoinColumn(name = "username")
	Account account;
	
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;
	
	
}
