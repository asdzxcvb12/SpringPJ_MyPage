<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/common_top.css?ver=26">
<link rel="stylesheet" type="text/css" href="resources/css/common_center.css?ver=26">
<link rel="stylesheet" type="text/css" href="resources/css/membership.css?ver=1">

<!-- bottom css <link rel="stylesheet" type="text/css" href="resources/css/common_bottom.css?ver=26">-->
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister">

<!-- javascript / jquery -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/rsa/jsbn.js?ver=1"></script> 
<script type="text/javascript" src="resources/js/rsa/prng4.js?ver=1"></script> 
<script type="text/javascript" src="resources/js/rsa/rng.js?ver=1"></script> 
<script type="text/javascript" src="resources/js/rsa/rsa.js?ver=1"></script> 
<script type="text/javascript" src="resources/js/membershipAction.js?ver=92"></script>
<script type="text/javascript" src="resources/js/leftsideAction.js?ver=36"></script>

<!-- meta -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- font style -->
<style type="text/css">
	#language_font {
		font-family : "Love Ya Like A Sister", cursive;
	}
</style>

		<title>my code storage site</title>

</head>

<body id="language_font" onload="javascript:go_time()">

<div id="top_main">
		Sub`s... Code Storage
</div>

<div id="container">
	<div id="topMenu">	
		<%@ include file="./inc/header.jsp"%>
	</div>
	
	<div id="center">
	<c:choose>
	
		<c:when test = "${membership eq 'membership'}">
			<div>
				<%@ include file="./member/membership.jsp" %>
			</div>
		</c:when>
		
		<c:when test = "${membership eq 'main'}">
			<div class="left_side">
				<%@ include file="./inc/center_left.jsp"%>
			</div>
			<div class="right_side">
				<%@ include file="./inc/center_right.jsp"%>
			</div>
		</c:when>
	</c:choose>
	</div>	
</div>

<!--bottom line<p id="bottom_main"> made by gubbagidd </p>-->

</body>
</html>