package com.bms.mypage.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bms.member.dto.MemberDto;
import com.bms.mypage.dto.MyPageDto;
import com.bms.order.dto.OrderDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	private SqlSession sqlSession; 
	
	public List<OrderDto> selectMyOrderGoodsList(String memberId) throws Exception{
		return sqlSession.selectList("mapper.mypage.selectMyOrderGoodsList" , memberId);
	}
	
	
	public Map<String,Object> selectMyOrderInfo(String orderId) throws Exception{
		return sqlSession.selectOne("mapper.mypage.selectMyOrderInfo" , orderId);
	}	

	
	public List<OrderDto> selectMyOrderHistoryList(Map<String,String> dateMap) throws Exception{
		return sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList" , dateMap);
	}
	
	
	public void updateMyInfo(Map<String,String> memberMap) throws Exception{
		sqlSession.update("mapper.mypage.updateMyInfo" , memberMap);
	}
	
	
	public MemberDto selectMyDetailInfo(String memberId) throws Exception{
		return sqlSession.selectOne("mapper.mypage.selectMyDetailInfo" , memberId);
	}

	
	public void updateMyOrderCancel(String orderId) throws Exception{
		sqlSession.update("mapper.mypage.updateMyOrderCancel" , orderId);
	}


	@Override
	public List<OrderDto> selectOrderGoodsList(Map<String, Object> condMap) throws Exception {
		return sqlSession.selectList("mapper.mypage.selectOrderGoodsList" , condMap);
	}


}
