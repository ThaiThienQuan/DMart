package com.lab8.rest.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.lab8.entity.Order;
import com.lab8.service.OrderService;
import com.lab8.serviceImplement.OrderServiceImplement;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orders")
public class OrderRestController {
	@Autowired
	OrderService orderService;

	@Autowired
	OrderServiceImplement serviceImplement;

	@PostMapping()
	public Order create(@RequestBody JsonNode orderData) {
		return orderService.create(orderData);
	}

	@GetMapping("/reportByDate")
	public Object reportByDate() {
		return serviceImplement.reportByDate(new Date());
	}

	@GetMapping("/reportByMonth")
	public Object reportByMonth() {
		return serviceImplement.reportByMonth(LocalDate.now().getMonthValue());
	}

	@GetMapping("/reportByYear")
	public Object reportByYear() {
		return serviceImplement.reportByYear(LocalDate.now().getYear());
	}

	@GetMapping("/reportByMonthNumber")
	public Object reportByMonthNumber() {
		return serviceImplement.reportByMonthNumber(LocalDate.now().getMonthValue());
	}

	@GetMapping("/sp_reportByYear/{year}")
	public Object sp_reportByYear(@PathVariable int year) {
		return serviceImplement.sp_reportByYear(year);
	}

	@GetMapping("/GetTop10BestSellingProducts")
	public List<Object> GetTop10BestSellingProducts() {
		return serviceImplement.GetTop10BestSellingProducts();
	}

	@GetMapping("/GetTop10LeastSellingProducts")
	public List<Object> GetTop10LeastSellingProducts() {
		return serviceImplement.GetTop10LeastSellingProducts();
	}

	@GetMapping("/orderDate/{date}")
	public List<Order> GetTop10LeastSellingProducts(@PathVariable Date date) {
		return serviceImplement.getOrderDate(date);
	}
}
