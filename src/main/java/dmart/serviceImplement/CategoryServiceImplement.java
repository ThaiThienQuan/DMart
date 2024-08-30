package dmart.serviceImplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dmart.entity.Category;
import dmart.repository.CategoryRepository;
import dmart.service.CategoryService;

@Service
public class CategoryServiceImplement implements CategoryService{
	@Autowired
	CategoryRepository categoryDAO;

	@Override
	public List<Category> findAll() {
		return categoryDAO.findAll();
	}
	
}
