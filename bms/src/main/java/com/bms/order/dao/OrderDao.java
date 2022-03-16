package com.bms.order.dao;

import java.util.List;
import java.util.Map;

import com.bms.order.dto.OrderDto;

public interface OrderDao {
	
	public List<Map<String, Object>> listMyOrderGoods(OrderDto orderDto) throws Exception;
	public void insertNewOrder(OrderDto orderDto) throws Exception;
	public OrderDto findMyOrder(String orderId) throws Exception;

}
