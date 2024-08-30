package dmart.serviceImplement;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import dmart.entity.Order;
import dmart.entity.OrderDetail;
import dmart.repository.OrderDetailDAO;
import dmart.repository.OrderRepository;
import dmart.service.OrderService;

@Service
public class OrderServiceImplement implements OrderService {
	@Autowired
	OrderRepository orderDAO;
	@Autowired
	OrderDetailDAO orderDetailDAO;

	@Override
	public Order create(JsonNode orderData) {
		ObjectMapper mapper = new ObjectMapper();

		Order order = mapper.convertValue(orderData, Order.class);
		orderDAO.save(order);

		TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {
		};
		List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type)
				.stream().peek(d -> d.setOrder(order)).collect(Collectors.toList());
		orderDetailDAO.saveAll(details);
		return order;
	}

	@Override
	public Order findById(Integer id) {
		return orderDAO.findById(id).get();
	}

	@Override
	public List<Order> findByUsername(String username) {
		return orderDAO.findByUsername(username);
	}

	public Object reportByDate(Date date) {
		return orderDetailDAO.reportByDate(date);
	}

	public Object reportByMonth(int month) {
		return orderDetailDAO.reportByMonth(month);
	}

	public Object reportByYear(int year) {
		return orderDetailDAO.reportByYear(year);
	}

	public Long reportByMonthNumber(int month) {
		return orderDetailDAO.reportByMonthNumber(month);
	}

	@Transactional
	public List<Object> sp_reportByYear(int year) {
		return orderDetailDAO.sp_reportByYear(year);
	}

	@Transactional
	public List<Object> GetTop10LeastSellingProducts() {
		return orderDetailDAO.GetTop10LeastSellingProducts();
	}

	@Transactional
	public List<Object> GetTop10BestSellingProducts() {
		return orderDetailDAO.GetTop10BestSellingProducts();
	}

	public List<Order> getOrderDate(Date date) {
		return orderDAO.getOrderDate(date);
	}
}
