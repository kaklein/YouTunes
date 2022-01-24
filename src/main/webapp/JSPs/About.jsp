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
		
		<title>YouTunes | About</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<div class="content-card">
				<h1 class="center-text">About</h1>
				<p class="center-text">YouTunes is the new big thing in music.</p>
				<p class="center-text">
					Browse, discover, download, and stream from our wide selection of albums.
					We are proud to have an artist-owned purchasing model, so you know you're
					directly supporting the artists you love.
				</p>
				<div class="sub-section gray-background">
					<h3>Browse</h3>
					<p>Find the music you're looking for by artist, album, or other search criteria.</p>
				</div>
				<div class="sub-section gray-background">
					<h3>Discover</h3>
					<p>Use our Discover tool to get tailored suggestions for music that suits your personal taste.</p>
				</div>
				<div class="sub-section gray-background">
					<h3>Purchase</h3>
					<p>Purchase your favorite albums so you can listen any time on the cloud or downloaded to your device.</p>
				</div>
				<div class="sub-section gray-background">
					<h3>Stay in the loop</h3>
					<p>Check out our News & Announcements regularly and subscribe to our custom newsletters so
					you don't miss out on what's happening in the world of your favorite artists.</p>
				</div>

			</div>
			
		
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
		
			<!-- script footer for JavaScript files -->
		<jsp:include page="ScriptFooter.jsp" flush="true"/>
	</body>
</html>