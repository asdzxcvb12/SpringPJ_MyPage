<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${cate == null}"><c:set var="cate" value="${zeroTop}" /></c:if>
<c:if test="${subCate == null}"><c:set var="subCate" value="${cate}" /></c:if>

<c:choose>
	<c:when test="${subCate eq baseBoardName}">
		<%@ include file="../subpage/baseBoard.jsp" %>
	</c:when>

	<c:when test="${subCate ne baseBoardName}">
		<%@ include file="../subpage/others.jsp" %>
	</c:when>
</c:choose>