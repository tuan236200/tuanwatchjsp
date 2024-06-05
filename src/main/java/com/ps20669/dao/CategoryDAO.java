package com.ps20669.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ps20669.model.Category;

public interface CategoryDAO extends JpaRepository<Category, String> {

}
