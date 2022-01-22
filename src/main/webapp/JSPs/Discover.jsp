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
		<%@page import="java.util.ArrayList, java.util.List, java.util.Arrays" %>
		<%@page import="youtunes.Artist" %>
		<% String base = (String)application.getAttribute("base"); %>
		<jsp:useBean id="albumDao" scope="application" class="youtunes.JdbcAlbumDao" />
		<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />
		
		
		<title>YouTunes | Discover</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="TopNav.jsp" flush="true"/>
			
			
			<!-- Discover questionnaire form -->
			<div class="form section">
				<form action="" method="POST" id="discover-form">
					<fieldset>
						<legend>What kind of music do you like?</legend>
						
						<div class="form-field" id="genre-select">
							<label for="genre">Genre(s):</label>
							<!-- select control for sub-genres -->
							<select id="genre" name="genre[]" multiple>
								<%
									// get sub genre options from database
									List<String> subGenreList = albumDao.getSubGenres();
									for (String genre : subGenreList) {
								%>
										<option value=<%=genre %>><%=genre %></option>
								<%
									}
								%>
							</select>
						</div>
						
						<div class="form-field" id="year-select">
							<label for="year">Year(s):</label>
							<!-- Genre select -->						
							<select id="year" name="year[]" multiple>
								<%
									// get decade options from database
									List<String> yearsList = albumDao.getYears();
									for (String yearBase : yearsList) {
										String yearOption = yearBase + "0s";
								%>
										<option value=<%=yearBase %>><%=yearOption %></option>
								<%	
									}
								%>
							</select>
						</div>		
						
						<div class="form-field">
							<input type="submit" class="button" id="submit-button" value="Get artist suggestions">
						</div>		
					</fieldset>
				</form>
			</div>
			
			<!-- Display questionnaire results on form submission -->
			<% 
				// on doPost
				if (request.getMethod().equals("POST")) {
			%>
					<div class="section" id="results">
						<div class="section-header">
							<h2>We think you'll like:</h2>
						</div>
			
						<!-- query database for suggestions and display artist cards -->
						<%
							// get list of matching artist_ids
							List<String> selectedGenreList = Arrays.asList(request.getParameter("genre[]"));
							List<String> selectedYearsList = Arrays.asList(request.getParameter("year[]"));
							List<Integer> artistSuggestionIds = albumDao.getArtistSuggestions(selectedGenreList, selectedYearsList);
							
							// iterate through list of artist ids and get artist objects
							for (int artist_id : artistSuggestionIds) {
								// get Artist object
								Artist currentArtist = artistDao.find(Long.valueOf(artist_id));
								String id = String.valueOf(currentArtist.getId()); // get artist Id
								
								String name = currentArtist.getFirstName(); // get artist name
								if (currentArtist.getLastName() != null) { // (only include last name if not null)
									name += " " + currentArtist.getLastName();
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
			<% } //end doPost%>
		</div>
	
		<!-- include footer  -->
		<jsp:include page="Footer.jsp" flush="true"/>
		
		<!-- script footer for JavaScript files -->
		<jsp:include page="ScriptFooter.jsp" flush="true"/>
	</body>
</html>