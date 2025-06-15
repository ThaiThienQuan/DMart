package dmart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dmart.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

	@Query("SELECT p FROM Product p WHERE p.category.id=?1 and p.available = 'true'")
	List<Product> findByCategoryId(String cid);
	
	
	@Query("SELECT o from Product o where o.name like ?1 and o.available = 'true'")
	List<Product> findAllByNameLike(String keywords);
	@Query("SELECT o from Product o where o.available = 'true'")
	List<Product> findAllByAvailable();
	List<Product>findByPriceBetween(int minPrice, int maxPrice);
	/*List<Product>findByPriceBetween(int minPrice, int maxPrice);*/
	@Query("SELECT o from Product o where o.price <= 10000000")
	List<Product> findBy10();
	@Query("SELECT o from Product o where o.price BETWEEN 10000000 AND 15000000")
	List<Product> findBy1015();
	@Query("SELECT o from Product o where o.price BETWEEN 15000000 AND 20000000")
	List<Product> findBy1520();
	@Query("SELECT o from Product o where o.price BETWEEN 20000000 AND 25000000")
	List<Product> findBy2025();
	@Query("SELECT o from Product o where o.price BETWEEN 25000000 AND 30000000")
	List<Product> findBy2530();
	@Query("SELECT o from Product o where o.price >= 30000000")
	List<Product> findBy30();
}
