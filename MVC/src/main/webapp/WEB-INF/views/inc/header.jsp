<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav id="topMenu">
		<ul>
		<c:forEach items="${top}" var="menu" varStatus="status">
			<li class="topMenuLi">
				<a class="menuLink" href="?cate=${menu}">${menu}</a>
					<ul class="submenu">
					<c:forEach items="${side}" var="sideMenu" varStatus="sideStatus">
					<c:if test="${sideMenu.get(menu) != null}">
					<li><a class="submenuLink longLink" href="#">${sideMenu.get(menu)}</a></li>
					</c:if>
					<c:forEach items="${sub}" var="subMenu">
					<c:choose>
						<c:when test="${subMenu.get(menu).getClass().getSimpleName() eq 'HashMap'}">
						<c:set value="${subMenu.get(menu)}" var="sideSubMenu"/>
									<c:if test="${sideSubMenu.get(sideMenu.get(menu)) != null}">
									<li><a class="submenuLink longLink" href="?cate=${menu}&subCate=${sideSubMenu.get(sideMenu.get(menu))}">
										${sideSubMenu.get(sideMenu.get(menu))}
									</a></li>
									</c:if>
						</c:when>
						
						<c:when test="${subMenuaaaa.get(menu).getClass().getSimpleName() ne 'HashMap'}">
						<c:if test="${sideStatus.first}">
							<c:if test="${subMenu.get(menu) != null}">
							<li><a class="submenuLink longLink" href="?cate=${menu}&subCate=${subMenu.get(menu)}">${subMenu.get(menu)}</a></li>
							</c:if>
						</c:if>
						</c:when>
					</c:choose>
					</c:forEach>
					</c:forEach>					
					</ul>
			</li>
			<c:if test="${not status.last}"><li>|</li></c:if>
		</c:forEach>
		</ul>
</nav>
<!-- 3409 css 관계도 참고 -->