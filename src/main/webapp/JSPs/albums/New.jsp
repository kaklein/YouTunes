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
		<%@page import="java.util.List" %>
		<%@page import="youtunes.Artist" %>
		<jsp:useBean id="albumDao" scope="application" class="youtunes.JdbcAlbumDao" />
		<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />
		
		
		<title>YouTunes | New Artist</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<!-- form to add a new album to the database -->
			<form>
				<h2 class="center-text">Add a new album</h2>
			
				<input type="hidden" name="action" value="addAlbum">
				
				<table>
				
					<tr class="form-field">
						<td><label for="title" class="inline-block">Album title:</label></td>
						<td><input type="text" class="inline-block" id="title" name="title"></td>
					</tr>
					
					<tr class="form-field">
						<td><label for="artist_id" class="inline-block">Artist:</label></td>
						<td>
							<select class="inline-block" id="artist_id" name="artist_id">
								<%
									// populate select options with artists from database
									List<Artist> artistOptions = artistDao.list();
									for (Artist artist : artistOptions) {
								%>
										<option value="<%=artist.getId() %>"><%=artist.getFirstName() + " " + artist.getLastName() %></option>
								<%
									} // end artist option loop
								%>
							</select>
						</td>
					</tr>
					
					<tr class="form-field">
						<td><label for="release_year" class="inline-block">Release year:</label></td>
						<td><input type="text" class="inline-block" id="release_year" name="release_year"></td>
					</tr>
					
					<tr class="form-field">
						<td><label for="genre" class="inline-block">Genre:</label></td>
						<td>
							<select id="genre" class="inline-block" name="genre">
								<%
									// populate select options with genres from database
									List<String> genreList = albumDao.getGenres();
									for (String genre : genreList) {
								%>
										<option value="<%=genre %>"><%=genre %></option>
								<%
									} // end genre option loop
								%>
							</select>
						</td>
					</tr>
					
					<tr class="form-field">
						<td><label for="price" class="inline-block">Price:</label></td>
						<td><input type="text" class="inline-block" id="price" name="price"></td>
					</tr>
					
					<tr class="form-field">
						<td><label for="img_url" class="inline-block">Image URL:</label></td>
						<td><input type="text" class="inline-block" id="img_url" name="img_url"></td>
					</tr>
				
				</table>
				
				<input type="submit" class="button submit-button" value="Add album"/>		
			</form>
			
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
	</body>
</html>