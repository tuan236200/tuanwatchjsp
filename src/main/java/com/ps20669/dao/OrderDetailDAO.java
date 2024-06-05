package com.ps20669.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ps20669.model.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {
	
	@Query("SELECT o FROM OrderDetail o WHERE o.order.id = ?1")
	List<OrderDetail> findByOrderID(Long orderid);
	
	@Query("SELECT o FROM OrderDetail o WHERE o.order.id = ?1")
	Page<OrderDetail> findByOrder(Long id, Pageable pageable);
	
}
