package com.lab8.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lab8.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, String>{

}
