package com.bms.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bms.member.dto.MemberDto;
import com.bms.order.dto.OrderDto;

@Repository
public class AdminOrderDaoImpl implements AdminOrderDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<OrderDto> selectNewOrderList(Map<String,Object> condMap) throws Exception{
		return sqlSession.selectList("mapper.admin.order.selectNewOrderList" , condMap);
	}
	
	public void  updateDeliveryState(Map<String, String> deliveryMap) throws Exception{
		sqlSession.update("mapper.admin.order.updateDeliveryState" , deliveryMap);
	}
	
	
	public Map<String,Object> selectOrderDetail(int orderId) throws Exception{
		return sqlSession.selectOne("mapper.admin.order.selectOrderDetail" , orderId);
	}


	public MemberDto selectOrderer(String memberId) throws Exception{
		return sqlSession.selectOne("mapper.admin.order.selectOrderer" , memberId);
	}

}
