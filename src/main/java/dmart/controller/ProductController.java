package dmart.controller;

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

import dmart.entity.Product;
import dmart.repository.ProductRepository;
import dmart.service.ProductService;
import dmart.service.SessionService;
import dmart.serviceImplement.OrderServiceImplement;

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
			List<Product> list = ProductService.findAllByAvailable(); // Lấy sản phẩm từ database
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

	@RequestMapping("/product/list/timkiem/gia")
	public String timgia(Model model, @RequestParam("min") Optional<Integer> min,
			@RequestParam("max") Optional<Integer> max) {
		int minPrice = min.orElse(Integer.MIN_VALUE);
		int maxPrice = max.orElse(Integer.MAX_VALUE);
		List<Product> items = dao.findByPriceBetween(minPrice, maxPrice);
		model.addAttribute("items", items);
		return "product/list";
	}

	@RequestMapping("/product/list/10")
	public String timgia10(Model model) {
		List<Product> items = dao.findBy10();
		model.addAttribute("items", items);
		return "product/list";
	}

	@RequestMapping("/product/list/1015")
	public String timgia1015(Model model) {
		List<Product> items = dao.findBy1015();
		model.addAttribute("items", items);
		return "product/list";
	}

	@RequestMapping("/product/list/1520")
	public String timgia1520(Model model) {
		List<Product> items = dao.findBy1520();
		model.addAttribute("items", items);
		return "product/list";
	}

	@RequestMapping("/product/list/2025")
	public String timgia2025(Model model) {
		List<Product> items = dao.findBy2025();
		model.addAttribute("items", items);
		return "product/list";
	}

	@RequestMapping("/product/list/2530")
	public String timgia2530(Model model) {
		List<Product> items = dao.findBy2530();
		model.addAttribute("items", items);
		return "product/list";
	}

	@RequestMapping("/product/list/30")
	public String timgia30(Model model) {
		List<Product> items = dao.findBy30();
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
