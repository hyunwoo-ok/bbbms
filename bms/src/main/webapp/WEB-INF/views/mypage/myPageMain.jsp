<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<c:if test="${message=='cancelOrder'}">
	<script>
		window.onload=function() {
			alert("주문을 취소했습니다.");
		}
	</script>
</c:if>
<script>

	function fn_cancel_order(orderId){
		
		var answer = confirm("주문을 취소하시겠습니까?");
		
		if (answer) {
			var formObj = document.createElement("form");
			var i_orderId = document.createElement("input");
			
		    i_orderId.name = "orderId";
		    i_orderId.value = orderId;
			
		    formObj.appendChild(i_orderId);
		    document.body.appendChild(formObj); 
		    formObj.method = "post";
		    formObj.action = "${contextPath}/mypage/cancelMyOrder.do";
		    formObj.submit();	
		}
		
	}

</script>
</head>
<body>

	<h1>최근주문내역</h1>
	<table class="list_view">
		<tbody align=center >
			<tr style="background:blue; color:#fff; height: 50px;" >
				<td>주문번호</td>
				<td>주문일자</td>
				<td>주문상품</td>
				<td>주문상태</td>
				<td>주문취소</td>
			</tr>
	      <c:choose>
	         <c:when test="${empty myOrderList }">
			  <tr>
			  	<td colspan=5 class="fixed">
					<strong>주문한 상품이 없습니다.</strong>
			  	</td>
			  </tr>
	        </c:when>
	        <c:otherwise>
		      <c:forEach var="item" items="${myOrderList }" >
	            <tr>
		            <td>${item.orderId }</td>
				    <td><fmt:formatDate value="${item.payOrderTime }" pattern="yyyy-MM-dd"/></td>
					<td align="left">
					   <strong>
					     <a href="${contextPath}/mypage/myOrderDetail.do?orderId=${item.orderId }">${item.goodsTitle } &nbsp; / &nbsp; ${item.orderGoodsQty }개</a>
					   </strong>
					</td>
					<td>
						<c:choose>
							<c:when test="${item.deliveryState == 'deliveryPrepared' }">배송준비중</c:when>
							<c:when test="${item.deliveryState == 'delivering' }">배송중</c:when>
							<c:when test="${item.deliveryState == 'finishedDelivering' }">배송완료</c:when>
							<c:when test="${item.deliveryState == 'cancelOrder' }">주문취소</c:when>
							<c:when test="${item.deliveryState == 'returningGoods' }">반품완료</c:when>
						</c:choose>
					</td>
					<td>
					  <c:choose>
					   <c:when test="${item.deliveryState == 'deliveryPrepared'}">
					       <input type="button" onClick="fn_cancel_order('${item.orderId}')" class="btn btn-outline-primary btn-sm" value="취소"  />
					   </c:when>
					   <c:otherwise>
					      <input type="button" onClick="fn_cancel_order('${item.orderId}')" class="btn btn-outline-primary btn-sm" value="취소됨" disabled />
					   </c:otherwise>
					  </c:choose>
					</td>
				</tr>
		     </c:forEach>
		  </c:otherwise>
	    </c:choose> 	    
		</tbody>
	</table>

	<br><br><br>	
	<h1>나의 정보
	    <a href="#"> <img src="${contextPath}/resources/image/btn_more_see.jpg" onclick="location.href='${contextPath}/mypage/myDetailInfo.do'"/></a>
	</h1>
	<table class="list_view">
	  <tbody  align="center">
		  <tr>
		    <td>이메일</td>
		    <td><strong>${memberInfo.email1 }@${memberInfo.email2 }</strong></td>
		  </tr>
		  <tr>
		    <td>전화번호</td>
		    <td><strong>${memberInfo.hp1 }-${memberInfo.hp2}-${memberInfo.hp3 }</strong></td>
		  </tr>
		  <tr>
		    <td>주소</td>
		    <td>
				도로명:  &nbsp;&nbsp; <strong>${memberInfo.roadAddress }</strong>  <br>
				지번:   &nbsp;&nbsp; <strong>${memberInfo.jibunAddress }</strong> 
		   </td>
		  </tr>
	  </tbody>
	</table>
	
</body>
</html>
