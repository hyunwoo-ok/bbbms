package com.bms.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bms.member.dto.MemberDto;
import com.bms.mypage.dao.MyPageDao;
import com.bms.mypage.dto.MyPageDto;
import com.bms.order.dto.OrderDto;

@Service
@Transactional
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;

	public List<OrderDto> listMyOrderGoods(String memberId) throws Exception{
		return myPageDao.selectMyOrderGoodsList(memberId);
	}
	
	public Map<String,Object> findMyOrderInfo(String orderId) throws Exception{
		return myPageDao.selectMyOrderInfo(orderId);
	}
	
	public List<OrderDto> listMyOrderHistory(Map<String,String> dateMap) throws Exception{
		return myPageDao.selectMyOrderHistoryList(dateMap);
	}
	
	public MemberDto modifyMyInfo(Map<String,String> memberMap) throws Exception{
		 String memberId = (String)memberMap.get("memberId");
		 myPageDao.updateMyInfo(memberMap);
		 return myPageDao.selectMyDetailInfo(memberId);
	}
	
	public void cancelOrder(String orderId) throws Exception{
		myPageDao.updateMyOrderCancel(orderId);
	}
	
	public MemberDto myDetailInfo(String memberId) throws Exception{
		return myPageDao.selectMyDetailInfo(memberId);
	}

	@Override
	public List<OrderDto> listOrderGoods(Map<String, Object> condMap) throws Exception {
		return myPageDao.selectOrderGoodsList(condMap);
	}




	
}
