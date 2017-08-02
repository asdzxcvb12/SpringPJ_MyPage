<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="height: 90%;">
	<fieldset style="border: medium solid black; border-radius : 2em; height: 100%; padding-top: 30px; padding-left: 30px; padding-right: 30px;">
		<legend style="padding-left: 10px; padding-right: 10px; size: 100px;">${subCate}</legend>
		
		<table style="width: 100%;">
			<thead>
			<tr>
				<td style="width: 5%; text-align: center">번호</td>
				<td style="width: 50%; text-align: center">제목</td>
				<td style="width: 15%; text-align: center">작성자</td>
				<td style="width: 10%; text-align: center">등록일</td>
				<td style="width: 10%; text-align: center">수정일</td>
				<td style="width: 5%; text-align: center">조회</td>
				<td style="width: 5%; text-align: center">추천</td>
			</tr>
			</thead>
		<c:if test="${baseBoard != null}">
			<tbody>
			<c:forEach items="${baseBoard}" var="baseItem" varStatus="baseItemStatus">
				<tr>
					<td style="width: 5%; text-align: center">${baseItemStatus.count}</td>
					<td style="width: 50%; text-align: center">${baseItem.title}</td>
					<td style="width: 15%; text-align: center">${baseItem.writer}</td>
					<td style="width: 10%; text-align: center">${baseItem.write_date}</td>
					<td style="width: 10%; text-align: center">${baseItem.update_date}</td>
					<td style="width: 5%; text-align: center">${baseItem.lookup}</td>
					<td style="width: 5%; text-align: center">${baseItem.recommendation}</td>
				</tr>
			</c:forEach>
		</c:if>
			<tr>
				<td colspan="7"><marquee behavior="alternate" width="100%">≪  [1][2][3][2][5][6]... ≫</marquee></td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">정렬 : 
					<select style="height: 10%">
						<option style="text-align: center">기본값</option>
						<option style="text-align: center">추천수</option>
						<option style="text-align: center">조회수</option>
						<option style="text-align: center">최신일자</option>
					</select>
				</td>
				<td colspan="5">
				<h1 align="right">
					<select style="height: 10%">
						<option>번호</option>
						<option>제목</option>
						<option>작성자</option>
						<option>등록일</option>
						<option>수정일</option>
						<option>조회</option>
						<option>추천</option>
					</select>
					<input type="text" size="20%" style="height: 10%">
					<input type="button" value="search" height="10%">
					<input type="button" value="글쓰기" height="10%">
				</h1>
				</td>
			</tr>
			</tfoot>
		</table>
	</fieldset>
</div>