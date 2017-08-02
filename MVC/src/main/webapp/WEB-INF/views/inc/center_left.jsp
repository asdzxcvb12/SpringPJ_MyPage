<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- membership table -->
<div class="table_attribute">
	<form id="login_form">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" name="id"><input type="hidden" id="id_hidden" value="idvalue"></td>
				<td rowspan="2">
					<input type="button" value="login" style="height: 65px">
				</td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" name="password"></td>

			</tr>
			<tr>
				<td colspan="1" class="side_membership_left">
					<span id="membership_page">회원가입</span>
					<input type="hidden" id="membership" name="membership">
				</td>
				<td colspan="2" class="side_membership_right"><a href="#">아이디</a>/<a
					href="#">비밀번호</a> 찾기</td>
			</tr>
		</table>
	</form>
</div>
<br>

<!-- sub menu -->
<div class="side_menu">
		<fieldset class="side_menu_inner">
		
			<c:if test="${cate == null}"><c:set var="cate" value="${zeroTop}" /></c:if>
				<legend align="top" style="font-size: 20px; font-style: bold; text-align: center"><b>${cate}</b></legend>

				<c:forEach items="${side}" var="sideMenu" varStatus="sideStatus">
					<c:if test="${sideMenu.get(cate) != null}">
						<span style="text-align: center">${sideMenu.get(cate)}</span>
					</c:if>
					<nav>
					<c:forEach items="${sub}" var="subMenu">
						<c:choose>
							<c:when
								test="${subMenu.get(cate).getClass().getSimpleName() eq 'HashMap'}">
								<c:set value="${subMenu.get(cate)}" var="sideSubMenu" />
								<c:if test="${sideSubMenu.get(sideMenu.get(cate)) != null}">
									<li style="margin-left: 30px"><a href="?cate=${cate}&subCate=${sideSubMenu.get(sideMenu.get(cate))}">
											${sideSubMenu.get(sideMenu.get(cate))} </a></li>
								</c:if>
							</c:when>

							<c:when
								test="${subMenu.get(cate).getClass().getSimpleName() ne 'HashMap'}">
								<c:if test="${sideStatus.first}">
									<c:if test="${subMenu.get(cate) != null}">
										<li><a style="text-align: center" href="?cate=${menu}&subCate=${subMenu.get(cate)}">${subMenu.get(cate)}</a></li>
									</c:if>
								</c:if>
							</c:when>
						</c:choose>
					</c:forEach>
					</nav>
				</c:forEach>

	</fieldset>
</div>
<br>

<!-- time -->
<div align="center">
	<table>
		<tr>
			<td><span id="ymd"></span></td>
		</tr>
		<tr>
			<td><span id="time"></span></td>
		</tr>
	</table>
</div>

<!-- calendar -->
<div align="center">
	<table border="1">
	<tr>
		<td colspan="7">what?</td>
	</tr>
		<%for(int i=0; i<7; i++) {%>
		<tr>
			<%for(int j=0; j<7; j++) {%>
				<td>sun</td>
			<%}%>
		</tr>
		<%}%>
	</table>
</div>