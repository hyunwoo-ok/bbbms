<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="logo">
		<a href="${contextPath}/main/main.do">
			<img width="176" height="80" alt="bms_logo" src="${contextPath}/resources/image/bms_logo2.PNG">
		</a>
	</div>
	<div id="head_link">
		<ul>
		    <c:choose>
			    <c:when test="${isLogOn == true and memberInfo.memberId =='admin' }">  
				   <li><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자 화면</a></li>
				   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
				</c:when>
			     <c:when test="${isLogOn == true and not empty memberInfo }">
				   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
				   <li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
				 </c:when>
				 <c:otherwise>
				   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
				   <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li> 
				 </c:otherwise>
			</c:choose>
		</ul>
	</div>
	<br>
	<div id="search" >
		<form name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
			<input name="searchWord" class="main_input" type="text" > 
			<input type="submit" name="search" class="btn1" value="검 색" >
		</form>
	</div>

</body>
</html>