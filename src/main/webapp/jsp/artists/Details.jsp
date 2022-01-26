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
		<%@page import="youtunes.model.JdbcArtistDao, youtunes.model.Artist, youtunes.model.JdbcAlbumDao, youtunes.model.Album" %>
		<%@ page import="java.util.List, java.util.ArrayList" %>
		<jsp:useBean id="artistDao" scope="application" class="youtunes.model.JdbcArtistDao" />
			<% String base = (String)application.getAttribute("base"); %>
		
		
		<title>YouTunes | Artist Details</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//jsp/TopNav.jsp" flush="true"/>
			
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
					<div class="artist-card card center-text">
						<h1 class="center-text"><%=name %></h1>
						<img class="large-img" src=<%= "Images/artists/" + artist.getImgUrl() + ".jpeg" %> alt=<%=name + " photo" %>>
					</div>
					
					<!-- display artists' albums -->
					<h2 class="center-text">Albums</h2>
			
			<div class="small-grid-container">
				<%					
						// get list of artist's albums from database
						JdbcAlbumDao albumDao = new JdbcAlbumDao();
						List<Album> albumList = albumDao.findByArtistId(artist_id);
						
						// iterate through list of albums and create an album card for each one
						for (Album album : albumList) {
							String album_id = String.valueOf(album.getAlbumId()); // get album Id					
				%>
							<!-- display album card -->
							<div class="small-album-card card gray-background">
								<a class="block" href=<%=base + "?action=showAlbumDetails&album_id=" + album_id + "&artist_name=" + name%>>						
									<div class="card-content">
										<h1><%=album.getTitle() %></h1>
										<h2 class="no-link-styling"><%=album.getReleaseYear() %></h2>
										<img class="small-img" src=<%= "Images/albums/" + album.getImgUrl() + ".jpeg"%> alt=<%=album.getTitle() + " cover art" %>>				
									</div>
								</a>
							</div>
				<%
						} // end album for loop
				%>
				</div>
				
				<!-- form to update Artist details -->
				<form class="border">
					<h2 class="center-text">Edit Artist</h2>
					<input type="hidden" name="action" value="updateArtist"/>
					<input type="hidden" id="artist_id" name="artist_id" value="<%=artist_id_param%>"/>
					
					<table>
						<tr class="form-field">
							<td><label for="first_name" class="inline-block">First name:</label></td>
							<td><input type="text" class="inline-block" id="first_name" name="first_name" value="<%=artist.getFirstName() %>"/></td>
						</tr>
						<tr class="form-field">
							<td><label for="last_name" class="inline-block">Last name:</label></td>
							<td><input type="text" class="inline-block" id="last_name" name="last_name" value="<%=artist.getLastName() %>"/></td>
						</tr>
						<tr class="form-field">
							<td><label for="img_url" class="inline-block">Image URL:</label></td>
							<td><input type="text" class="inline-block" id="img_url" name="img_url" value="<%=artist.getImgUrl() %>"></td>
						</tr>
					</table>
					
					<input type="submit" class="button submit-button" value="Save changes"/>
				</form>
				
				<!-- delete button -->
				<form>
					<input type="hidden" name="action" value="removeArtist">
					<input type="hidden" name="artist_id" value="<%=artist_id %>">
					<input type="submit" class="button important-button" value="Delete artist">
				</form>
			<%					
				
				} else {
					System.out.println("artist_id is null");
				}									
			%>
		
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//jsp/Footer.jsp" flush="true"/>
		
			<!-- script footer for JavaScript files -->
		<jsp:include page="../ScriptFooter.jsp" flush="true"/>
	</body>
</html>