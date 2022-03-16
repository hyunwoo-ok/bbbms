package com.bms.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bms.order.dao.OrderDao;
import com.bms.order.dto.OrderDto;


@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	public List<Map<String, Object>> listMyOrderGoods(OrderDto orderDto) throws Exception{
		return orderDao.listMyOrderGoods(orderDto);
	}
	
	public void addNewOrder(OrderDto orderDto) throws Exception{
		orderDao.insertNewOrder(orderDto);
	}	
	
	public OrderDto findMyOrder(String orderId) throws Exception{
		return orderDao.findMyOrder(orderId);
	}

}
