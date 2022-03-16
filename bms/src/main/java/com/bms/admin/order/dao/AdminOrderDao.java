package com.bms.admin.order.dao;

import java.util.List;
import java.util.Map;

import com.bms.member.dto.MemberDto;
import com.bms.order.dto.OrderDto;

public interface AdminOrderDao {
	
	public List<OrderDto> selectNewOrderList(Map<String,Object> condMap) throws Exception;
	public void updateDeliveryState(Map<String, String> deliveryMap) throws Exception;
	public Map<String,Object> selectOrderDetail(int orderId) throws Exception;
	public MemberDto selectOrderer(String memberId) throws Exception;
	
}
