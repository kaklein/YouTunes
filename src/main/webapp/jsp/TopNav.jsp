<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Top Nav</title>
		<% String base = (String)application.getAttribute("base"); %>
	</head>
	
	<body>
		<div id="top-nav" class="nav-bar">
			<!-- Logo -->
			<div id="logo" class="nav-link inline">
				<a href=<%=base + "?action=goToIndex" %>><img src="/youtunes/Images/youtunes-logo-transparent.png" alt="YouTunes logo" width="150"></a>
			</div>
			
			<!-- Artists -->
			<div id="artists-tab" class="nav-link">
				<h2 class="inline"><a href=<%=base + "?action=goToArtists" %>>ARTISTS</a></h2>
			</div>
			
			<!-- Discover -->
			<div id="discover-tab" class="nav-link">
				<h2 class="inline"><a href=<%=base + "?action=goToDiscover" %>>DISCOVER</a></h2>
			</div>
			
			<!-- About -->
			<div id="about-tab" class="nav-link">
				<h2 class="inline"><a href=<%=base + "?action=goToAbout" %>>ABOUT</a></h2>
			</div>
			
			<!-- Contact -->
			<div id="contact-tab" class="nav-link">
				<h2 class="inline"><a href=<%=base + "?action=goToContact" %>>CONTACT</a></h2>
			</div>
	
		</div>
	</body>
</html>