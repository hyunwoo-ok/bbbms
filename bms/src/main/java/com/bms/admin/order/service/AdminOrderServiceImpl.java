package com.bms.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bms.admin.order.dao.AdminOrderDao;
import com.bms.order.dto.OrderDto;


@Service
@Transactional
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	private AdminOrderDao adminOrderDao;
	
	@Override
	public List<OrderDto> listNewOrder(Map<String,Object> condMap) throws Exception{
		return adminOrderDao.selectNewOrderList(condMap);
	}
	
	@Override
	public void modifyDeliveryState(Map<String, String> deliveryMap) throws Exception{
		adminOrderDao.updateDeliveryState(deliveryMap);
	}
	
	@Override
	public Map<String,Object> orderDetail(int orderId) throws Exception{
		return adminOrderDao.selectOrderDetail(orderId);
	}

}
