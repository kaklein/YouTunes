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
		<%@page import="youtunes.model.Album" %>
		<% String base = (String)application.getAttribute("base"); %>
		<jsp:useBean id="albumDao" scope="application" class="youtunes.model.JdbcAlbumDao" />
		
		
		<title>YouTunes | Discover</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="TopNav.jsp" flush="true"/>
			
			<h1 class="center-text">Albums</h1>
			
			<!-- Add album button -->
			<div class="center-text">
				<a href=<%= base + "?action=goToNewAlbum"%> class="button">Add a new album</a>
			</div>
			
			
			<div class="grid-container">
				<!-- Album display -->
				<%
					List<Album> albumList = albumDao.list();
	
					// iterate through list of artists and create an artist card for each one
					for (Album album : albumList) {	
						// get artist name
						String artist_name = albumDao.getArtistName(Long.valueOf(album.getAlbumId()));			
				%>
						<!-- display album card, which links to album details-->
						
						<div class="album-card card small-album-card gray-background">		
							<a href=<%=base + "?action=showAlbumDetails&album_id=" + album.getAlbumId()%>>
							<div class="card-content">	
								<h1><%=album.getTitle() %></h1>	
								<h2 class="no-link-styling"><%=artist_name %></h2>						
								<img class="small-img" src=<%= "Images/albums/" + album.getImgUrl() + ".jpeg"%> alt=<%=album.getTitle() + " cover art" %>>
							</div>
							</a>
						</div>
				<%
					} // end album loop
				%>
			</div>
	
		</div>
		
		<!-- include footer  -->
		<jsp:include page="Footer.jsp" flush="true"/>
		
		<!-- script footer for JavaScript files -->
		<jsp:include page="ScriptFooter.jsp" flush="true"/>
	</body>
</html>