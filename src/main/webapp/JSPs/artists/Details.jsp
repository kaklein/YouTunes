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
		<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />
			<% String base = (String)application.getAttribute("base"); %>
		
		
		<title>YouTunes | Artist Details</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<!-- display artist details -->
			<%
				// check that artist_id is not null
				String artist_id_param = request.getParameter("artist_id");
				if (artist_id_param != null && artist_id_param != "") {
					
					// get artist_id from selection in List.jsp			
					Long artist_id = Long.valueOf(artist_id_param);
					
					// get artist info from database					
					Artist artist = artistDao.find(artist_id); // call find method
					
					// get fields from artist object
					String name = artist.getFirstName(); // get artist name
					if (artist.getLastName() != null) { // (only include last name if not null)
						name += " " + artist.getLastName();
					}
			%>
					<!-- display artist details -->
					<div class=artist-details>
						<h1 class=artist-details-name><%=name %></h1>
					</div>
			<%					
					// TO-DO: get list of artist's albums from database
					JdbcAlbumDao albumDao = new JdbcAlbumDao();
					List<Album> albumList = albumDao.findByArtistId(artist_id);
					
					// iterate through list of albums and create an album card for each one
					for (Album album : albumList) {
						String album_id = String.valueOf(album.getAlbumId()); // get album Id					
			%>
						<!-- display album card -->
						<div class="album-card">
							<form>
								<a href=<%=base + "?action=showAlbumDetails&album_id=" + album_id + 
								"&artist_name=" + name%>><%=album.getTitle() %></a>
								<img class="album-card-img" src="">
								<p class="album-card-year"><%=album.getReleaseYear() %></p>
							</form>
						</div>
			<%
					} // end album for loop
			%>
		
					<!-- form to update Artist details -->
					<form>
						<h3>Update Artist</h3>
						<input type="hidden" name="action" value="updateArtist"/>
						<input type="hidden" id="artist_id" name="artist_id" value="<%=artist_id_param%>"/>
						
						<label for="first_name">First name:</label>
						<input type="text" id="first_name" name="first_name" value="<%=artist.getFirstName() %>"/>
						
						<label for="last_name">Last name:</label>
						<input type="text" id="last_name" name="last_name" value="<%=artist.getLastName() %>"/>
						
						<input type="submit" class="button" value="Update artist"/>
					</form>
					
					<!-- delete button -->
					<form>
						<input type="hidden" name="action" value="removeArtist">
						<input type="hidden" name="artist_id" value="<%=artist_id %>">
						<input type="submit" class="button important-button" value="Delete artist from database">
					</form>
			<%					
				
				} else {
					System.out.println("artist_id is null");
				}									
			%>
		
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
		
			<!-- script footer for JavaScript files -->
		<jsp:include page="../ScriptFooter.jsp" flush="true"/>
	</body>
</html>