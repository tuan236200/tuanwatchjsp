package com.ps20669.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name="Categories")
public class Category implements Serializable{
	@Id
	@Column(name="categoryid") // khóa chính có tên CategoryId
	String id;
	String name;
	
	@OneToMany(mappedBy = "category") // map với bên product @ManyToOne
	List<Product> products;
	
}
