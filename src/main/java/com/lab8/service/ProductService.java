package com.lab8.service;

import java.util.List;

import com.lab8.entity.Product;

public interface ProductService {

	List<Product> findAll();

	List<Product> findmau(String timmau);

	Product findById(Integer id);

	List<Product> findByCategoryId(String cid);

	Product create(Product product);

	Product update(Product product);

	void delete(Integer id);

}
