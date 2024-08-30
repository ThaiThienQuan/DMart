package dmart.service;

import java.util.List;

import dmart.entity.Authority;
import dmart.entity.Product;

public interface AuthorityService {

	public  List<Authority> findAuthoritiesOfAdministrators();

	public Authority create(Authority auth);
	
	public List<Authority> findAll();
	
	public void delete(Integer id);

}
