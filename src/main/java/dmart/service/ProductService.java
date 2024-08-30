package dmart.service;

import java.util.List;

import dmart.entity.Product;

public interface ProductService {

	List<Product> findAll();
	List<Product> findAllByAvailable();

	Product findById(Integer id);

	List<Product> findByCategoryId(String cid);

	Product create(Product product);

	Product update(Product product);

	void delete(Integer id);

}
