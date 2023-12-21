package com.lab8.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lab8.entity.Product;
import com.lab8.repository.ProductRepository;
import com.lab8.service.ProductService;
import com.lab8.service.SessionService;
import com.lab8.serviceImplement.OrderServiceImplement;

@Controller
public class ProductController {
	@Autowired
	ProductRepository dao;
	@Autowired
	SessionService session;
	@Autowired
	ProductService ProductService;

	@Autowired
	OrderServiceImplement serviceImplement;

	@RequestMapping("/product/list")
	public String list(Model model, @RequestParam("cid") Optional<String> cid) {
		if (cid.isPresent()) {
			List<Product> list = ProductService.findByCategoryId(cid.get());
			model.addAttribute("items", list);
		} else {
			List<Product> list = ProductService.findAll(); // Lấy sản phẩm từ database
			model.addAttribute("items", list); // đưa vào trong model
		}
		model.addAttribute("topProduct", serviceImplement.GetTop10BestSellingProducts());
		return "product/list";
	}


	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product item = ProductService.findById(id);
		model.addAttribute("item", item);
		return "product/detail";
	}

	@RequestMapping("/product/list/timkiem/{keywords}")
	public String timkiem(Model model, @PathVariable String keywords) {
		List<Product> items;
		if (keywords.equals("0")) {
			items = ProductService.findAll();
		} else {
			items = dao.findAllByNameLike("%" + keywords + "%");
		}
		model.addAttribute("items", items);
		return "product/list";
	}

	@RequestMapping("/product/list/DESC")
	public String sort1(Model model, @RequestParam("field") Optional<String> field) {
		// 1. field sắp xếp theo trường/ field/ cột nào
		// 2. DESC : sắp xếp giảm dần
		// 3. Ngược lại ko chỉ định field nào thì sắp xếp theo price
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort); // 4. danh sách phẩm có sap xếp
		model.addAttribute("items", items);
		return "/product/list"; // 5. view lên trang sort
	}

	@RequestMapping("/product/list/ASC")
	public String sort2(Model model, @RequestParam("field") Optional<String> field) {
		// 1. field sắp xếp theo trường/ field/ cột nào
		// 2. DESC : sắp xếp giảm dần
		// 3. Ngược lại ko chỉ định field nào thì sắp xếp theo price
		Sort sort = Sort.by(Direction.ASC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort); // 4. danh sách phẩm có sap xếp
		model.addAttribute("items", items);
		return "/product/list"; // 5. view lên trang sort
	}

}
