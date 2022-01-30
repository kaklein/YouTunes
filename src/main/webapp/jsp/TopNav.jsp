<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	Responsive hamburger menu code comes from Web Dev Simplified tutorial:
	https://www.youtube.com/watch?v=At4B7A4GOPg 
-->

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
				<a href=<%=base + "?action=goToIndex" %>><img src="/youtunes/Images/youtunes-logo-transparent.png" alt="YouTunes logo" width="120"></a>
			</div>
			
			<a href="#" class="toggle-button">
				<span class="bar"></span>
				<span class="bar"></span>
				<span class="bar"></span>
			</a>
			
			<div class="nav-links">
				<ul>
					<li><h2><a href=<%=base + "?action=goToArtists" %>>ARTISTS</a></h2></li>
					<li><h2><a href=<%=base + "?action=goToDiscover" %>>DISCOVER</a></h2></li>
					<li><h2><a href=<%=base + "?action=goToAbout" %>>ABOUT</a></h2></li>
					<li><h2><a href=<%=base + "?action=goToContact" %>>CONTACT</a></h2></li>
				</ul>
			</div>
	
		</div>
	</body>
</html>