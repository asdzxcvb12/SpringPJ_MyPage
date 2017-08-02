<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="confirmEmail">
<fieldset class="terms" style="margin-right: 100px;margin-left: 100px;margin-top: 10px;margin-bottom: 20px">
	<legend align="left">terms one</legend>
		content<br>
		content<br>
		content<br>
		content<br>
		content<br>
</fieldset>

<div align="right" style="margin-right: 100px">
	<input type="checkbox" value="agree" name="chkTermsOne" id="agreeOne">agree
	<input type="checkbox" value="disagree" name="chkTermsOne" checked="checked" id="disagreeTwo">disagree
</div>

<fieldset class="terms" style="margin-right: 100px;margin-left: 100px;margin-top: 10px;margin-bottom: 20px">
	<legend align="left">terms two</legend>
		content<br>
		content<br>
		content<br>
		content<br>
		content<br>
</fieldset>

<div align="right" style="margin-right: 100px">
	<input type="checkbox" value="agree" name="chkTermsTwo" id="agreeTwo">agree
	<input type="checkbox" value="disagree" name="chkTermsTwo" checked="checked" id="disagreeTwo">disagree
</div>


<div id="inputEmail" style="display: none;">
<hr>
Confirm the E-Mail
<table>
	<tr>
		<td>E-mail</td>
		<td><input type="text" id="frontEmail" name="frontEmail"
			size="15px" placeholder="xxxxxx" style="text-align: center">
			@ <input type="text" id="backEmail" name="backEmail" size="10px"
			disabled="disabled" placeholder="xxxxx.xxx"
			style="text-align: center"> <select id="emailBack"
			onchange="javascript:chEmail(this.value)">
				<option id="0" value="">select Email</option>
				<option id="1" value="gmail.com">gamil.com</option>
				<option id="2" value="naver.com">naver.com</option>
				<option id="3" value="daum.net">daum.net</option>
				<option id="4" value="self">self</option>
		</select> <input type="button" value="SendE-mail" id="sendE_mail" onclick="onclick_mail()"></td>
	</tr>
	<tr>
		<td>E-mail Check</td>
		<td><c:choose>
				<c:when test="${code == null}">
					<input type="text" size="20px">
				</c:when>
				<c:when test="${code != null}">
					<input type="text" size="20px" value="${code}">
				</c:when>
			</c:choose></td>
	</tr>
</table>
</div>
<div id="cancle_next" style="display: none;">
	<p id="testTr" style="width: 30%; display: inline; maring-right: 30%;">CANCLE...</p>	
	<p id="termsNext" style="width: 30%; display: inline; margin-left: 30%;">NEXT...</p>
</div>
</form>

<div class="mask"></div>
<div class="window">
    <div class="close" style="height: 50%;"></div>
    <div align="center" style="height: 50%;">
   		Code
   		<input type="text" size="15px"><input type="button" id="code_submit" value="submit">
   	</div>    	
</div>
