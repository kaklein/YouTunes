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
		<%@page import="youtunes.JdbcArtistDao, youtunes.Artist, youtunes.JdbcAlbumDao, youtunes.Album" %>
		<%@ page import="java.util.List, java.util.ArrayList" %>
		
		<title>YouTunes | Contact</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<div class="content-card">
				<h1>Contact</h1>
				<div class="left-div">
					<h3>Address</h3>
					<p>1500 Music Road</p>
					<p>Cityville, NE 68111</p>
				</div>
				<div class="right-div">
					<h3>Get in touch</h3>
					<p>support@youtunes.com</p>
					<p>1-800-555-5555</p>
				</div>
			</div>			
		
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
		
			<!-- script footer for JavaScript files -->
		<jsp:include page="ScriptFooter.jsp" flush="true"/>
	</body>
</html>