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
		<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />
		
		<% String base = (String)application.getAttribute("base"); %>
		
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
					<div class="album-details-card card">
						<div class="inline align-top">
							<img class="album-card-img" src=<%= "Images/albums/" + album.getImgUrl() + ".jpeg"%> alt=<%=album.getTitle() + " cover art" %>>					
						</div>
						
						<div class="inline align-top">
							<h1><%=album.getTitle() %></h1>
							<h2><a href=<%=base + "?action=showArtistDetails&artist_id=" + album.getArtistId()%>><%=artist_name %></a></h2>
							<h3><%=album.getReleaseYear() %></h3>
							<h3><%=album.getGenre() %></h3>
							<div>
								<h3 class="inline"><%=album.getPrice() %></h3>
								<button type="button" class="button inline">Purchase</button>
							</div>
						</div>
					</div>
					
					<!--  TO-DO: link back to albums page -->
					
					
					<!-- form to update album information -->
					<form>
						<h2 class="center-text">Edit Album</h2>
						
						<input type="hidden" name="action" value="updateAlbum">
						<input type="hidden" name="album_id" value="<%=album.getAlbumId() %>">
						
						<table>
							
							<tr class="form-field">
								<td><label for="title" class="inline">Title:</label></td>
								<td><input type="text" class="inline" id="title" name="title" value="<%=album.getTitle() %>"></td>
							</tr>
							
							<tr class="form-field">
								<td><label for="artist_id" class="inline">Artist:</label></td>
								<td>
									<select class="inline" id="artist_id" name="artist_id">
									<%
										// populate select options with artists from database
										List<Artist> artistOptions = artistDao.list();
										for (Artist artist : artistOptions) {
									%>
											<option value="<%=artist.getId() %>" <%if (artist.getId() == album.getArtistId()) {%> selected <%} %>><%=artist.getFirstName() + " " + artist.getLastName() %></option>
									<%
										} // end artist option loop
									%>
									</select>
								</td>
							</tr>
							
							<tr class="form-field">
								<td><label for="release_year" class="inline">Release year:</label></td>
								<td><input type="number" class="inline" id="release_year" name="release_year" value="<%=album.getReleaseYear() %>"></td>
							</tr>
							
							<tr class="form-field">
								<td><label for="genre" class="inline">Genre:</label></td>
								<td>
									<select class="inline" id="genre" name="genre">
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
								</td>
							</tr>
							
							<tr class="form-field">
								<td><label for="price" class="inline">Price:</label></td>
								<td><input type="text" class="inline" id="price" name="price" value="<%=album.getPrice() %>"></td>
							</tr>
							
							<tr class="form-field">
								<td><label for="img_url" class="inline">Image URL:</label></td>
								<td><input type="text" class="inline" id="img_url" name="img_url" value="<%=album.getImgUrl() %>"></td>
							</tr>
					
						</table>
												
						<input type="submit" class="button submit-button" value="Save changes">
					</form>
					
					<!-- delete button -->
					<form>
						<input type="hidden" name="action" value="removeAlbum">
						<input type="hidden" name="album_id" value="<%=album_id %>">
						<input type="submit" class="button important-button" value="Delete album">
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