<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<link href="/youtunes/CSS/styles.css" rel="stylesheet" type="text/css"/>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,400&family=Source+Sans+3:wght@400;700&family=VT323&display=swap" rel="stylesheet">
		<%@page import="java.util.ArrayList, java.util.List" %>
		<%@page import="youtunes.Album" %>
		<% String base = (String)application.getAttribute("base"); %>
		<jsp:useBean id="albumDao" scope="application" class="youtunes.JdbcAlbumDao" />
		
		
		<title>YouTunes | Discover</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="TopNav.jsp" flush="true"/>
			
			<!-- Add album button -->
			<a href=<%= base + "?action=goToNewAlbum"%> class="button">Add a new album</a>			
			
			<!-- Album display -->
			<%
				List<Album> albumList = albumDao.list();

				// iterate through list of artists and create an artist card for each one
				for (Album album : albumList) {	
					// get artist name
					String artist_name = albumDao.getArtistName(Long.valueOf(album.getAlbumId()));			
			%>
					<!-- display album card, which links to album details-->
					<a href=<%=base + "?action=showAlbumDetails&album_id=" + album.getAlbumId()%>>
					<div class="album-card card">				
						<!-- album title -->
						<h1><%=album.getTitle() %></h1>
						
						<!-- album cover image -->
						<img class="small-img" src=<%= "Images/albums/" + album.getImgUrl() + ".jpeg"%> alt=<%=album.getTitle() + " cover art" %>>
						
						<!-- artist name -->
						<h2><%=artist_name %></h2>
					</div>
					</a>
			<%
				} // end album loop
			%>
	
		</div>
		
		<!-- include footer  -->
		<jsp:include page="Footer.jsp" flush="true"/>
		
		<!-- script footer for JavaScript files -->
		<jsp:include page="ScriptFooter.jsp" flush="true"/>
	</body>
</html>