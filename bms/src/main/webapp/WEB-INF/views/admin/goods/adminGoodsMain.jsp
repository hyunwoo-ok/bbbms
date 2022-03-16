<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script>

	function search_goods_list(fixedSearchPeriod){
	    location.href = "${contextPath}/admin/goods/adminGoodsMain.do?fixedSearchPeriod=" + fixedSearchPeriod; 
	}
	
	
	function fn_enable_detail_search(r_search) {
		
		var frm_delivery_list= document.frm_delivery_list;
		
		t_beginYear   = frm_delivery_list.beginYear;
		t_beginMonth  = frm_delivery_list.beginMonth;
		t_beginDay    = frm_delivery_list.beginDay;
		t_endYear     = frm_delivery_list.endYear;
		t_endMonth    = frm_delivery_list.endMonth;
		t_endDay      = frm_delivery_list.endDay;
		s_search_type = frm_delivery_list.s_search_type;
		t_search_word = frm_delivery_list.t_search_word;
		btn_search    = frm_delivery_list.btn_search;
		
		if (r_search.value == 'detail_search'){
			t_beginYear.disabled   = false;
			t_beginMonth.disabled  = false;
			t_beginDay.disabled    = false;
			t_endYear.disabled     = false;
			t_endMonth.disabled    = false;
			t_endDay.disabled      = false;
			s_search_type.disabled = false;
			t_search_word.disabled = false;
			btn_search.disabled    = false;
			
		} 
		else {
			t_beginYear.disabled   = true;
			t_beginMonth.disabled  = true;
			t_beginDay.disabled    = true;
			t_endYear.disabled     = true;
			t_endMonth.disabled    = true;
			t_endDay.disabled      = true;
			s_search_type.disabled = true;
			t_search_word.disabled = true;
			btn_search.disabled    = true;
		}
		
	}
	
	function fn_detail_search() {
	
		var frm_delivery_list = document.frm_delivery_list;
		
		beginYear   = frm_delivery_list.beginYear.value;
		beginMonth  = frm_delivery_list.beginMonth.value;
		beginDay    = frm_delivery_list.beginDay.value;
		endYear     = frm_delivery_list.endYear.value;
		endMonth    = frm_delivery_list.endMonth.value;
		endDay      = frm_delivery_list.endDay.value;
		search_type = frm_delivery_list.s_search_type.value;
		search_word = frm_delivery_list.t_search_word.value;
	
		if (beginYear < 10) 	beginYear = "0" + beginYear; 
		if (beginMonth < 10) 	beginMonth = "0" + beginMonth; 
		if (beginDay < 10) 		beginDay = "0" + beginDay; 
		if (endYear < 10) 		endYear = "0" + endYear; 
		if (endMonth < 10) 		endMonth = "0" + endMonth; 
		if (endDay < 10) 		endDay = "0" + endDay; 
		
		var url = "${contextPath}/admin/goods/adminGoodsMain.do?";
			url += "beginDate="+ beginYear + "-" + beginMonth + "-" + beginDay;
			url += "&endDate=" + endYear + "-" + endMonth + "-" + endDay;
			url += "&searchType=" + search_type;
			url += "&searchWord=" + search_word;
			
		location.href = url;

	}
	
</script>
</head>
<body>
	<h3>상품 조회</h3>
	<form name="frm_delivery_list" method="post" >	
		<table>
			<tbody>
				<tr>
					<td>
						<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> 간단조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> 상세조회 &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						오늘 일자 &nbsp;&nbsp;
						<select name="curYear" disabled>
						    <c:forEach var="i" begin="0" end="5">
						      <c:choose>
						        <c:when test="${endYear==endYear-i}">
						          <option value="${endYear}" selected>${endYear}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${endYear-i }">${endYear-i }</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>
						</select>년 
						<select name="curMonth" disabled>
							 <c:forEach var="i" begin="1" end="12">
						      <c:choose>
						        <c:when test="${endMonth==i}">
						          <option value="${i}"  selected>${i}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${i}">${i}</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>					
						</select>월
					 	<select name="curDay" disabled>
						  	<c:forEach var="i" begin="1" end="31">
						      <c:choose>
						        <c:when test="${endDay==i}">
						          <option value="${i}" selected>${i}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${i}">${i}</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>	
						</select>일 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<input type="button" value="당일"  onclick="search_goods_list('today')">
						<input type="button" value="1주"   onclick="search_goods_list('one_week')">
						<input type="button" value="2주"   onclick="search_goods_list('two_week')">
						<input type="button" value="1개월" onclick="search_goods_list('one_month')">
						<input type="button" value="2개월" onclick="search_goods_list('two_month')">
						<input type="button" value="3개월" onclick="search_goods_list('three_month')">
						<input type="button" value="4개월" onclick="search_goods_list('four_month')">
					</td>
				</tr>
				<tr>
				  <td>
					조회 기간 &nbsp;&nbsp;
					<select name="beginYear" disabled>
					 <c:forEach var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${beginYear == beginYear-i}">
					          <option value="${beginYear-i}" selected>${beginYear-i}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${beginYear-i}">${beginYear-i}</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="beginMonth" disabled >
						 <c:forEach var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${beginMonth == i}">
					          <option value="${i }" selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10}">
					              <option value="${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					              <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="beginDay" disabled >
					  <c:forEach var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${beginDay==i }">
					          <option value="${i}" selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10}">
					              <option value="${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					              <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp; ~ &nbsp;
					
					<select name="endYear" disabled >
					 <c:forEach var="i" begin="0" end="6">
					      <c:choose>
					        <c:when test="${endYear==endYear-i }">
					          <option value="${2022-i}" selected>${2022-i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2022-i}">${2022-i}</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="endMonth" disabled >
						 <c:forEach var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i}">
					          <option value="${i}"selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10}">
					              <option value="${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					             <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="endDay" disabled >
					  <c:forEach var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i}">
					          <option value="${i}" selected>${i}</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i<10}">
					              <option value="${i}">0${i}</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i}">${i}</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일
				  </td>
				</tr>
				<tr>
				  <td>
				    <select id="s_search_type" name="s_search_type" disabled>
						<option value="all" selected>전체</option>
						<option value="goodsId">상품번호</option>
						<option value="goodsTitle">상품이름</option>
						<option value="goodsWriter">저자</option>
						<option value="goodsPublisher">출판사</option>
					</select>
					<input type="text" size="30" id="t_search_word" disabled/>  
					<input type="button" value="조회" id="btn_search" onclick="fn_detail_search()"  disabled />
				  </td>
				</tr>
			</tbody>
		</table>
		<div class="clear"></div>
	</form>	
	<div align="right">
		<input type="button" class="btn btn-Light btn-sm" value="Excel Export" onclick="location.href='${contextPath}/admin/goods/goodsExcelExport.do'" />
	</div>
	<table class="list_view">
		<tbody align="center">
			<tr style="background:blue; color:#fff; height: 50px;">
				<td>상품번호</td>
				<td>상품이름</td>
				<td>저자</td>
				<td>출판사</td>
				<td>상품가격</td>
				<td>입고일자</td>
				<td>출판일</td>
			</tr>
  				<c:choose>
    				<c:when test="${empty newGoodsList }">			
					<tr>
				       <td colspan="8" class="fixed"><strong>조회된 상품이 없습니다.</strong></td>
				    </tr>
			 	</c:when>
			 	<c:otherwise>
     				<c:forEach var="goods" items="${newGoodsList}">
						<tr>       
							<td><strong>${goods.goodsId}</strong></td>
							<td>
								<a href="${contextPath}/admin/goods/modifyGoodsForm.do?goodsId=${goods.goodsId}">
								    <strong>${goods.goodsTitle} </strong>
								</a> 
							</td>
							<td><strong>${goods.goodsWriter}</strong></td>
							<td><strong>${goods.goodsPublisher}</strong></td>
							<td><strong>${goods.goodsPrice}</strong></td>
							<td><strong><fmt:formatDate value="${goods.goodsCredate}" pattern="yyyy-MM-dd"/></strong></td>
							<td><strong><fmt:formatDate value="${goods.goodsPublishedDate}" pattern="yyyy-MM-dd"/> </strong></td>
						</tr>
					</c:forEach>
				</c:otherwise>
  			</c:choose>	        
		</tbody>
	</table>
	<br>
	<div align="right">
		<input class="btn btn-primary btn-sm" type="button" onclick="location.href='${contextPath}/admin/goods/addNewGoodsForm.do'" value="상품 등록">
	</div>
</body>
</html>