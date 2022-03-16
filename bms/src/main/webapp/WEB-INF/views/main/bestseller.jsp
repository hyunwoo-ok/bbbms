<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<body>

	<div class="main_book">
		<h3>베스트셀러</h3>
		<c:forEach var="item" items="${bestseller }">
			<div class="book">
				<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"></a> 
				<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
				<div class="title">${item.goodsTitle }</div>
				<div class="price"><fmt:formatNumber value="${item.goodsSalesPrice}" type="number" var="goodsPrice" />${item.goodsSalesPrice}원</div>
			</div>
	  	</c:forEach>
	</div>
	
	<div class="clear"></div>
</body>
</html>