package com.bms.mypage.service;

import java.util.List;
import java.util.Map;

import com.bms.member.dto.MemberDto;
import com.bms.mypage.dto.MyPageDto;
import com.bms.order.dto.OrderDto;

public interface MyPageService{
	
	public List<OrderDto> listMyOrderGoods(String memberId) throws Exception;
	public Map<String,Object> findMyOrderInfo(String orderId) throws Exception;
	public List<OrderDto> listMyOrderHistory(Map<String,String> dateMap) throws Exception;
	public MemberDto  modifyMyInfo(Map<String,String> memberMap) throws Exception;
	public void cancelOrder(String orderId) throws Exception;
	public MemberDto myDetailInfo(String memberId) throws Exception;
	public  List<OrderDto>listOrderGoods(Map<String, Object> condMap) throws Exception;

}
