package com.bms.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bms.member.dto.MemberDto;
import com.bms.order.dto.OrderDto;
import com.bms.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/orderEachGoods.do" , method = RequestMethod.POST)
	public ModelAndView orderEachGoods(@RequestParam Map<String, Object> goodsInfo, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();  			
		mv.setViewName("/order/orderGoods");
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		
		session.setAttribute("goodsInfo", goodsInfo);
		session.setAttribute("orderer", memberInfo);
		mv.addObject("goodsInfo", goodsInfo);
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/payToOrderGoods.do" , method = RequestMethod.POST)
	public ResponseEntity<Object> payToOrderGoods(@RequestParam Map<String, String> receiverMap , HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		Map<String,Object> goodsInfo= (Map<String,Object>)session.getAttribute("goodsInfo");
		MemberDto memberDto = (MemberDto)session.getAttribute("orderer");
		String memberId =  "";
		if (memberDto != null) 
			memberId = memberDto.getMemberId();
		
		String ordererName = "";
		if (memberDto != null)
			ordererName = memberDto.getMemberName();
		
		String ordererHp = memberDto.getHp1() + "-" + memberDto.getHp2() + "-" + memberDto.getHp3();
		
		
		OrderDto orderDto = new OrderDto();;
		orderDto.setMemberId(memberId);
		orderDto.setOrdererName(ordererName);
		orderDto.setGoodsId(Integer.parseInt((String)(goodsInfo.get("goodsId"))));
		orderDto.setGoodsTitle((String)goodsInfo.get("goodsTitle"));
		orderDto.setGoodsSalesPrice(Integer.parseInt((String)(goodsInfo.get("goodsSalesPrice"))));
		orderDto.setOrderGoodsQty(Integer.parseInt((String)(goodsInfo.get("orderGoodsQty"))));
		orderDto.setReceiverName(receiverMap.get("receiverName"));
		orderDto.setReceiverHp1(receiverMap.get("receiverHp1"));
		orderDto.setReceiverHp2(receiverMap.get("receiverHp2"));
		orderDto.setReceiverHp3(receiverMap.get("receiverHp3"));
		orderDto.setReceiverTel1(receiverMap.get("receiverTel1"));
		orderDto.setReceiverTel2(receiverMap.get("receiverTel2"));
		orderDto.setReceiverTel3(receiverMap.get("receiverTel3"));
		orderDto.setDeliveryAddress(receiverMap.get("deliveryAddress"));
		
		if (receiverMap.get("deliveryMessage") == null) orderDto.setDeliveryMessage("");
		else	orderDto.setDeliveryMessage(receiverMap.get("deliveryMessage"));
		
		orderDto.setDeliveryMethod(receiverMap.get("deliveryMethod"));
		orderDto.setGiftWrapping(receiverMap.get("giftWrapping"));
		orderDto.setPayMethod(receiverMap.get("payMethod"));
		orderDto.setCardComName(receiverMap.get("cardComName"));
		orderDto.setCardPayMonth(receiverMap.get("cardPayMonth"));
		orderDto.setPayOrdererHpNum(receiverMap.get("payOrdererHpNum"));	
		orderDto.setOrdererHp(ordererHp);	
		
	    orderService.addNewOrder(orderDto);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
		
	}
	

}
