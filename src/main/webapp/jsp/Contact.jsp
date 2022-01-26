<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<link href="/youtunes/CSS/styles.css" rel="stylesheet" type="text/css"/>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,400&family=Source+Sans+3:wght@400;700&family=VT323&display=swap" rel="stylesheet">
		
		<title>YouTunes | Contact</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//jsp/TopNav.jsp" flush="true"/>
			
			<h1 class="center-text">Contact</h1>
			
			<div class="address center-text">
				<div class="content-card inline-block address-content">
					<h2>Address</h2>
					<p>1500 Music Road</p>
					<p>Cityville, NE 68111</p>
				</div>
			
				<div class="content-card inline-block address-content">
					<h2>Get in touch</h2>
					<p><a href="mailto:support@youtunes.com" target="_blank">support@youtunes.com</a></p>
					<p>1-800-555-5555</p>
				</div>	
			</div>
			
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//jsp/Footer.jsp" flush="true"/>
		
			<!-- script footer for JavaScript files -->
		<jsp:include page="ScriptFooter.jsp" flush="true"/>
	</body>
</html>