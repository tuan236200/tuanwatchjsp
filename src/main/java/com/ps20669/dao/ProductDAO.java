package com.ps20669.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ps20669.model.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {

	@Query("SELECT p FROM Product p WHERE p.category.name=?1")
	Page<Product> findByCategoryNamePage(String category, Pageable pageable);

	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	List<Product> findByCategoryID(String category);

	@Query("SELECT p FROM Product p WHERE p.price BETWEEN ?1 AND ?2")
	Page<Product> findByPrice(Double minPrice, Double maxPrice, Pageable pageable);

	@Query(value = "SELECT * FROM Products ORDER BY price DESC LIMIT 1", nativeQuery = true)
	Product findMaxPrice();


	@Query(value = "SELECT * FROM Products ORDER BY price ASC LIMIT 1", nativeQuery = true)
	Product findMinPrice();


	@Query(value = "SELECT * FROM Products WHERE CategoryId LIKE ?1 ORDER BY Price DESC LIMIT 1", nativeQuery = true)
	Product findMaxPriceByCategoryID(String categoryID);


	@Query(value = "SELECT * FROM Products WHERE CategoryId LIKE ?1 ORDER BY Price ASC LIMIT 1", nativeQuery = true)
	Product findMinPriceByCategoryID(String categoryID);


	@Query("SELECT p FROM Product p WHERE p.category.name=?1 AND p.price BETWEEN ?2 AND ?3")
	Page<Product> findByCategoryNameAndPricePage(String category, Double minPrice, Double maxPrice, Pageable pageable);


}