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
		<jsp:useBean id="albumDao" scope="application" class="youtunes.JdbcAlbumDao" />
		<title>YouTunes | Album Details</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<%
				// check that album_id is not null
				String album_id_param = request.getParameter("album_id");
				if (album_id_param != null && album_id_param != "") {
					
					// get album_id and artist name from form in artist/Details.jsp			
					Long album_id = Long.valueOf(album_id_param);
					String artist_name = albumDao.getArtistName(album_id);
					
					// get album info from database				
					Album album = albumDao.find(album_id); // call find method
										
			%>
					<!-- display album details -->
					<div class=album-details>
						<h1 class=album-title><%=album.getTitle() %></h1>
						<h2 class="album-artist"><%=artist_name %></h2>
						<h3 class="year-genre"><%=album.getReleaseYear() %> | <%=album.getGenre() %></h3>
						<img class="album-img" src="">
						<div class="album-purchase">
							<h3 class="inline">$<%=String.format("%.2f", album.getPrice()) %></h3>
							<button type="button" class="button">Purchase</button>
						</div>
					</div>
					
					<!--  TO-DO: link back to artist page -->
					
					<!-- TO-DO: make this work with servlet - form to update album information -->
					<div class="form">
						<form id="album-update-form" action="" method="POST">
							<h3>Update Album</h3>
							<label for="title">Title:</label>
							<input type="text" id="title" name="title" value="<%=album.getTitle() %>">
							
							<label for="artist">Artist:</label>
							<select id="artist" name="artist">
								<%
									// populate select options with artists from database
									JdbcArtistDao artistDao = new JdbcArtistDao();
									List<Artist> artistOptions = artistDao.list();
									for (Artist artist : artistOptions) {
								%>
										<option value="<%=artist.getId() %>" <%if (artist.getId() == album.getArtistId()) {%> selected <%} %>><%=artist.getFirstName() + " " + artist.getLastName() %></option>
								<%
									} // end artist option loop
								%>
							</select>
							
							<label for="release_year">Release year:</label>
							<input type="number" id="release_year" name="release_year" value="<%=album.getReleaseYear() %>">
							
							<label for="genre">Genre:</label>
							<select id="genre" name="genre">
								<%
									// populate select options with genres from database
									List<String> genreList = albumDao.getGenres();
									for (String genre : genreList) {
								%>
										<option value="<%=genre %>" <% if (album.getGenre().equals(genre)) {%> selected <% } %>><%=genre %></option>
								<%
									} // end genre option loop
								%>
							</select>
							
							<label for="price">Price:</label>
							<input type="text" id="price" name="price" value="<%=album.getPrice() %>">
							
							<label for="img_url">Image URL:</label>
							<input type="text" id="img_url" name="img_url" value="<%=album.getImgUrl() %>">
													
							<input type="submit" class="button" value="Update album">
						</form>
					</div>
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