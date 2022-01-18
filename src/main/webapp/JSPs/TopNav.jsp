<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Top Nav</title>
	</head>
	
	<body>
		<div id="top-nav" class="nav-bar">
			<!-- Logo -->
			<div id="logo" class="nav-link">
				<a href="/youtunes/JSPs/index.jsp"><img src="/youtunes/Images/youtunes-logo-transparent.png" alt="YouTunes logo" width="100"></a>
			</div>
			
			<!-- Artists -->
			<div id="artists-tab" class="nav-link">
				<a href="/youtunes/JSPs/artists/List.jsp">ARTISTS</a>
			</div>
			
			<!-- Discover -->
			<div id="discover-tab" class="nav-link">
				<a href="/youtunes/JSPs/Discover.jsp">DISCOVER</a>
			</div>
			
			<!-- About -->
			<div id="about-tab" class="nav-link">
				<a href="/youtunes/JSPs/About.jsp">ABOUT</a>
			</div>
			
			<!-- Contact -->
			<div id="contact-tab" class="nav-link">
				<a href="/youtunes/JSPs/Contact.jsp">CONTACT</a>
			</div>
	
		</div>
	</body>
</html>