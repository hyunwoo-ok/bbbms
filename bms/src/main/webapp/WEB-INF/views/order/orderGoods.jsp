<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<head>
<script>
    
	function reset_all() {
		$("#receiverName").val("");
		$("#hp1").val(0);
		$("#hp2").val("");
		$("#hp3").val("");
		$("#tel1").val("");
		$("#tel2").val("");
		$("#tel3").val("");
		$("#zipcode").val("");
		$("#roadAddress").val("");
		$("#jibunAddress").val("");
		$("#namujiAddress").val("");
		
	}

	
	function restore_all() {
		
		$("#receiverName").val($("#h_receiver_name").val());
		$("#hp1").val($("#h_hp1").val());
		$("#hp2").val($("#h_hp2").val());
		$("#hp3").val($("#h_hp3").val());
		$("#tel1").val($("#h_tel1").val());
		$("#tel2").val($("#h_tel2").val());
		$("#tel3").val($("#h_tel3").val());
		$("#zipcode").val($("#h_zipcode").val());
		$("#roadAddress").val($("#h_roadAddress").val());
		$("#jibunAddress").val($("#h_jibunAddress").val());
		$("#namujiAddress").val($("#h_namujiAddress").val());
		
	}
	
	
	function fn_set_pay_method(method) {
		
		if (method == 'card') {
			$("#payOrderTel1").prop("disabled" , true);
			$("#payOrderTel2").prop("disabled" , true);
			$("#payOrderTel3").prop("disabled" , true);
			
			$("#cardComName").prop("disabled"  , false);
			$("#cardPayMonth").prop("disabled" , false);
		}
		else {
			$("#payOrderTel1").prop("disabled" , false);
			$("#payOrderTel2").prop("disabled" , false);
			$("#payOrderTel3").prop("disabled" , false);
			
			$("#cardComName").prop("disabled"  , true);
			$("#cardPayMonth").prop("disabled" , true);
		}
		
	}
	
	function fn_process_pay_order(){
		
		var deliveryAddress = "우편번호:" + $("#zipcode").val() + "<br>"+
							  "도로명 주소:" + $("#roadAddress").val() + "<br>" +
							  "[지번 주소:" + $("#jibunAddress").val() + "]<br>" + $("#namujiAddress").val();
		
		var payOrdererHpNum = "해당없음";
	  
	    if ( $("#payMethod").val() == "휴대폰결제"){
	    	payOrdererHpNum = $("#payOrderTel1").val(); + "-" + $("#payOrderTel2").val(); + "-" + $("#payOrderTel3").val(); 
	    }
							  
		var datas = {
			receiverName    : $("#receiverName").val(),
		    receiverHp1     : $("#hp1").val(),
		    receiverHp2     : $("#hp2").val(),
		    receiverHp3     : $("#hp3").val(),
		    receiverTel1    : $("#tel1").val(),
		    receiverTel2    : $("#tel2").val(),
		    receiverTel3    : $("#tel3").val(),
		    deliveryAddress : deliveryAddress,
		    deliveryMessage : $("#deliveryMessage").val(),
		    deliveryMethod  : $("#deliveryMethod").val(),
		    orderGoodsQty   : $("#orderGoodsQty").val(),
		    giftWrapping    : $("input[name='giftWrapping']:checked").val(),
		    payMethod       : $("#payMethod").val(),
		    cardComName     : $("#cardComName").val(),
		    cardPayMonth    : $("#cardPayMonth").val(),
		    payOrdererHpNum : payOrdererHpNum,
		}
		
		$.ajax({
			type : "POST",
			url  : "${contextPath}/order/payToOrderGoods.do",
			async : false,
			data : datas ,
			success : function(){
				alert("주문이 성공적으로 완료 되었습니다.");
				location.href = "${contextPath}/mypage/listMyOrderHistory.do";
			}
		});
		
		
	}
</script>
</head>
<body>
	<h1>1.상품정보</h1>
<form  name="form_order">	
	<table class="list_view">
		<tbody align="center">
			<tr style="background: blue; color:#fff;">
				<td colspan=2 class="fixed">주문상품명</td>
				<td>수량</td>
				<td>주문금액</td>
				<td>배송비</td>
				<td>예상적립금</td>
				<td>주문금액합계</td>
			</tr>
			<tr>
				<td class="goods_image">
				  <a href="${contextPath}/goods/goodsDetail.do?goodsId=${goodsInfo.goodsId }">
				    <img width="75" alt="thumbnails" src="${contextPath}/thumbnails.do?goodsId=${goodsInfo.goodsId}&fileName=${goodsInfo.goodsFileName}">
				  </a>
				</td>
				<td>
				  <h2>
				     <a href="${contextPath}/goods/goodsDetail.do?goodsId=${goodsInfo.goodsId }">${goodsInfo.goodsTitle }</A>
				      <input type="hidden" id="goodsTitle" name="goodsTitle" value="${goodsInfo.goodsTitle }" />
				  </h2>
				</td>
				<td>
				  <h2>${goodsInfo.orderGoodsQty }개</h2>
				    <input type="hidden" id="orderGoodsQty" name="orderGoodsQty" value="${goodsInfo.orderGoodsQty}" />
				</td>
				<td><h2>${goodsInfo.goodsSalesPrice}원 (10% 할인)</h2></td>
				<td><h2>${goodsInfo.goodsDeliveryPrice}원 </h2></td>
				<td><h2>${1500 * goodsInfo.orderGoodsQty}원</h2></td>
				<td>
				  <h2>${goodsInfo.goodsSalesPrice * goodsInfo.orderGoodsQty + goodsInfo.goodsDeliveryPrice}원</h2>
				  <input type="hidden" id="totalOrderGoodsPrice" value="${goodsInfo.goodsSalesPrice * goodsInfo.orderGoodsQty + goodsInfo.goodsDeliveryPrice}">
				</td>
			</tr>
		</tbody>
	</table>
	<div class="clear"></div>
	<br>
	<br>
	<h1>2.배송 정보</h1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td><input type="text" value="${orderer.memberName}"  readonly /></td>
				 </tr>
				 <tr class="dot_line">
					<td class="fixed_join">핸드폰</td>
					<td><input type="text" value="${orderer.hp1} - ${orderer.hp2} - ${orderer.hp3}"  readonly/></td>
				 </tr>
				 <tr class="dot_line">
					<td class="fixed_join">이메일</td>
					<td><input type="text" value="${orderer.email1}@${orderer.email2}" readonly/></td>
				 </tr>
			
				<tr class="dot_line">
					<td class="fixed_join">배송방법</td>
					<td>
					    <input type="radio" id="deliveryMethod" name="deliveryMethod" value="일반택배" checked> 일반택배 &emsp; 
						<input type="radio" id="deliveryMethod" name="deliveryMethod" value="편의점택배"> 편의점택배 &emsp;
						<input type="radio" id="deliveryMethod" name="deliveryMethod" value="해외배송"> 해외배송 &emsp;
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">배송지 선택</td>
					<td>
						<input type="radio" name="deliveryPlace"  value="기본배송지" onClick="restore_all()" checked> 기본배송지&emsp;
						<input type="radio" name="deliveryPlace"  value="새로입력"   onClick="reset_all()"> 새로입력 &emsp;
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">받으실 분</td>
					<td>
					   <input id="receiverName" name="receiverName" type="text" size="40" value="${orderer.memberName }" />
					   <input type="hidden" id="h_orderer_name" name="h_orderer_name"  value="${orderer.memberName }" /> 
					   <input type="hidden" id="h_receiver_name" name="h_receiver_name"  value="${orderer.memberName }" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">휴대폰번호</td>
					<td><select id="hp1" name="hp1">
							<option>없음</option>
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> 
					 - <input size="10px" type="text" id="hp2" name="hp2" value="${orderer.hp2 }"> 
					 - <input size="10px" type="text" id="hp3" name="hp3" value="${orderer.hp3 }">
					  <input type="hidden" id="h_hp1" name="h_hp1" value="${orderer.hp1 }" /> 
					  <input type="hidden" id="h_hp2" name="h_hp2" value="${orderer.hp2 }" /> 
					  <input type="hidden" id="h_hp3" name="h_hp3"  value="${orderer.hp3 }" />
					  <c:set  var="orderer_hp" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3 }"/>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">유선전화(선택)</td>
					<td><select id="tel1" name="tel1">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
					</select> - 
					<input size="10px" type="text" id="tel2" name="tel2" value="${orderer.tel2 }"> - <input size="10px" type="text" id="tel3" name="tel3" value="${orderer.tel3 }">
					<input type="hidden" id="h_tel1" name="h_tel1" value="${orderer.tel1 }" />
					<input type="hidden" id="h_tel2" name="h_tel2"	value="${orderer.tel2 }" />
					<input type="hidden" id="h_tel3" name="h_tel3" value="${orderer.tel3 }" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td><input type="text" id="zipcode" name="zipcode" size="5" value="${orderer.zipcode }"> 
						<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
						<p>
							지번 주소:<br>
							<input type="text" id="roadAddress" name="roadAddress" size="50" value="${orderer.roadAddress }" /><br>
							<br> 
							도로명 주소: 
							<input type="text" id="jibunAddress" name="jibunAddress" size="50" value="${orderer.jibunAddress }" /><br>
							<br> 
							나머지 주소: 
							<input type="text" id="namujiAddress"  name="namujiAddress" size="50" value="${orderer.namujiAddress }" /> 
						</p> 
						 <input type="hidden" id="h_zipcode" name="h_zipcode" value="${orderer.zipcode }" /> 
						 <input type="hidden"  id="h_roadAddress" name="h_roadAddress"  value="${orderer.roadAddress }" /> 
						 <input type="hidden"  id="h_jibunAddress" name="h_jibunAddress" value="${orderer.jibunAddress }" /> 
						 <input type="hidden"  id="h_namujiAddress" name="h_namujiAddress" value="${orderer.namujiAddress }" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">배송 메시지</td>
					<td>
					   <input id="deliveryMessage" name="deliveryMessage" type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요." />
				     </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">선물 포장</td>
					<td>
						<input type="radio" id="giftWrapping" name="giftWrapping" value="yes">예 &emsp;
						<input type="radio" id="giftWrapping" name="giftWrapping" checked value="no">아니요
					</td>
				</tr>
			</tboby>
		</table>
	</div>
	<div class="clear"></div>
	<br>
	<br>

	<h1>3.결제정보</h1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line" >
					<td class="fixed_join">
						<input type="radio" id="payMethod" name="payMethod" value="신용카드" onclick="fn_set_pay_method('card')" checked> 신용카드
					<td>
					    카드 선택 : &nbsp;
						  <select id="cardComName" name="cardComName">
								<option value="삼성" selected>삼성</option>
								<option value="하나SK">하나SK</option>
								<option value="현대">현대</option>
								<option value="KB">KB</option>
								<option value="신한">신한</option>
								<option value="롯데">롯데</option>
								<option value="BC">BC</option>
								<option value="시티">시티</option>
								<option value="NH농협">NH농협</option>
						  </select>
						&emsp;
						할부 기간 : &nbsp;
						<select id="cardPayMonth" name="cardPayMonth">
								<option value="일시불" selected>일시불</option>
								<option value="2개월">2개월</option>
								<option value="3개월">3개월</option>
								<option value="4개월">4개월</option>
								<option value="5개월">5개월</option>
								<option value="6개월">6개월</option>
						</select>
					   <br>
					</td>
				</tr>
				<tr class="dot_line" >
					<td class="fixed_join">
						<input type="radio" id="payMethod" name="payMethod" value="휴대폰결제(간편결제)" onclick="fn_set_pay_method('phone')"> 휴대폰 결제
					</td>
					<td>
					   휴대폰 번호 입력 : 
			  	       <input type="text" size="5" id="payOrderTel1" name="payOrderTel1" disabled/> -
			           <input type="text" size="5" id="payOrderTel2" name="payOrderTel2" disabled/> -
			           <input type="text" size="5" id="payOrderTel3" name="payOrderTel3" disabled/>
					   <br>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
   <div class="clear"></div>
	</form>
	<div align="center">
		<br>
		<a href="javascript:fn_process_pay_order();">  
			<img width="125" alt="" src="${contextPath}/resources/image/btn_gulje.jpg">
		</a> 
	</div>
	
</body>
</html>
			
			
			