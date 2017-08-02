<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<input type="hidden" id="getMemberAttr" value="${memberAttr}">
<fieldset class="membership">
	<legend align="top" style="text-align: center;">membership page</legend>
	<div align="center">
	<form id="membershipForm">
	<span id="memTerms">Membership Terms ▷</span>  
	<span id="memInfo">Membership Info ▷ </span> 
	<span id="memComplete">Membership Complete</span>
		<c:choose>
			<c:when test="${memberAttr == 'terms'}">
				<%@ include file="./terms.jsp" %>
			</c:when>
			<c:when test="${memberAttr == 'info'}"> 
				<%@ include file="./info.jsp" %>
			</c:when>
			<c:when test="${memberAttr == 'result'}">
				<%@ include file="./result.jsp" %>
			</c:when>
		</c:choose>
	</form>
	</div>
</fieldset>