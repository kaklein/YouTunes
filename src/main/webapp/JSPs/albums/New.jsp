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
				<h3>Add a new album</h3>
			
				<input type="hidden" name="action" value="addAlbum">
				
				<label for="title">Album title:</label>
				<input type="text" id="title" name="title">
				
				<label for="artist_id">Artist:</label>
				<select id="artist_id" name="artist_id">
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
				
				<label for="release_year">Release year:</label>
				<input type="text" id="release_year" name="release_year">
				
				<label for="genre">Genre:</label>
				<select id="genre" name="genre">
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
				
				<label for="price">Price:</label>
				<input type="text" id="price" name="price">
				
				<label for="img_url">Image URL:</label>
				<input type="text" id="img_url" name="img_url">
				
				<input type="submit" class="button" value="Add album"/>		
			</form>
			
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
	</body>
</html>