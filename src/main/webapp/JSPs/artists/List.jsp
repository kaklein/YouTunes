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
		<%@page import="youtunes.JdbcArtistDao, youtunes.Artist, java.util.List" %>
		<% String base = (String)application.getAttribute("base"); %>
		<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />
		
		<title>YouTunes | Artists</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<h1 class="center-text">Artists</h1>
			
			<!-- Add artist button -->
			<div class="center-text">
				<a href=<%= base + "?action=goToNewArtist"%> class="button">Add a new artist</a>
			</div>		
			
			<div class="grid-container">
				<!-- display list of artists -->
				<%		
					// get list of all artists
					List<Artist> artistList = artistDao.list();
							
					// iterate through list of artists and create an artist card for each one
					for (Artist artist : artistList) {	
						String id = String.valueOf(artist.getId()); // get artist Id
						
						String name = artist.getFirstName(); // get artist name
						if (artist.getLastName() != null) { // (only include last name if not null)
							name += " " + artist.getLastName();
						}
				%>
					
						<div class="card small-artist-card gray-background">
							<a href=<%=base + "?action=showArtistDetails&artist_id=" + id %>>
							<div class="card-content">
								<h1><%=name %></h1>
								<img class="small-img" src=<%= "Images/artists/" + artist.getImgUrl() + ".jpeg" %> alt=<%=name + " photo" %>>		
							</div>
							</a>
						</div>
				<%
					}				
				%>
			</div>
			
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
	</body>
	
</html>