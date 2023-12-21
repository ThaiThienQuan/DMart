package com.lab8.service;

import java.util.List;

import com.lab8.entity.Authority;
import com.lab8.entity.Product;

public interface AuthorityService {

	public  List<Authority> findAuthoritiesOfAdministrators();

	public Authority create(Authority auth);
	
	public List<Authority> findAll();
	
	public void delete(Integer id);

}
