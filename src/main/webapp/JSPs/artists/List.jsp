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
		
		<title>YouTunes | Artists</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<!-- Add artist button -->
			<a href=<%= base + "?action=goToNewArtist"%>>Add a new artist</a>
			
			<!-- TO-DO: display list of artists -->
			<%
				// Make JdbcArtistDao object
				JdbcArtistDao artistDao = new JdbcArtistDao();
				
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
				<div class="artist-card">
					<form>
						<img class="artist-card-img" src="">
						<a href=<%=base + "?action=showArtistDetails&artist_id=" + id %>><%=name %></a>				
					</form>
				</div>
			
			<%
				}				
			%>
			
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
	</body>
	
</html>