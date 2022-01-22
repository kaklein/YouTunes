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
		<%@page import="java.net.URLEncoder" %>
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
						<p>Please select at least one genre and at least one decade.</p>
						
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
							<label for="year">Decade(s):</label>
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
							<input type="submit" class="button" id="discover-submit-button" value="Get artist suggestions">
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
						<!-- query database for suggestions and display artist cards -->
						<%
							// get list of genre selection(s)
							List<String> selectedGenresList = new ArrayList<>();
							List<String> selectedYearsList = new ArrayList<>();
							if(request.getParameterValues("genre[]") != null && request.getParameterValues("year[]") !=null) {
								selectedGenresList = Arrays.asList(request.getParameterValues("genre[]"));
								selectedYearsList = Arrays.asList(request.getParameterValues("year[]"));
							} else {
						%>
								<!-- message if submitted with making selections -->
								<div class="section-header">
									<h3>Please select at least one genre and at least one decade.</h3>
								</div>
						<%
							}
							
							if (!selectedGenresList.isEmpty() && !selectedYearsList.isEmpty()) {
								// get list of suggestions based on selections
								List<Integer> artistSuggestionIds = albumDao.getArtistSuggestions(selectedGenresList, selectedYearsList);
								
								// if there are matching suggesions
								if (!artistSuggestionIds.isEmpty()) {
						%>
									<!-- display selections -->
									<div class="section-header">
										<table>
											<tr>
												<th rowspan="2">Because you selected:</th>
												<th>Genres(s)</th>
												<th>Decade(s)</th>
											</tr>
											<tr>
												<td>
												<%
													String genresFormatted = selectedGenresList.get(0);
													for (int i = 1; i < selectedGenresList.size(); i++) {
														genresFormatted += ", " + selectedGenresList.get(i);
													}		
													out.print(genresFormatted);
												%>
												</td>
												<td>
												<%
													String decadesFormatted = selectedYearsList.get(0) + "0s";
													for (int i = 1; i < selectedYearsList.size(); i++) {
														decadesFormatted += ", " + selectedYearsList.get(i) + "0s";
													}
													out.print(decadesFormatted);
												%>
												</td>
											</tr>
										
										</table>
									</div>
									
									<!-- display suggestion header -->
									<div class="section-header">
										<h2>We think you'll like:</h2>
									</div>
								<%	
									// iterate through list of artist ids and get artist objects
									String suggestionsFormatted = "";
									for (int artist_id : artistSuggestionIds) {
										// get Artist object
										Artist currentArtist = artistDao.find(Long.valueOf(artist_id));
										String id = String.valueOf(currentArtist.getId()); // get artist Id
										
										String name = currentArtist.getFirstName(); // get artist name
										if (currentArtist.getLastName() != null) { // (only include last name if not null)
											name += " " + currentArtist.getLastName();
										}
										suggestionsFormatted += name + "\n";
								%>
											<!-- display artist card for each suggestion -->
											<div class="artist-card">
												<form>
													<img class="artist-card-img" src=<%= "Images/artists/" + currentArtist.getImgUrl() + ".jpeg" %> alt=<%=name + " photo" %>>
													<a href=<%=base + "?action=showArtistDetails&artist_id=" + id %>><%=name %></a>				
												</form>
											</div>								
								<%
									} // end artist suggestion loop
									
									// create email template from results
									String msgSubject = "My YouTunes Discover Results"; // subject
									String msgSubjectEncoded = URLEncoder.encode(msgSubject, "UTF-8"); // encode subject
									String msgBody = "SELECTED GENRE(S):\n" + genresFormatted + "\n\nSELECTED DECADE(S):\n" + decadesFormatted +
										"\n\nSUGGESTED ARTIST(S):\n" + suggestionsFormatted; // body
									String msgBodyEncoded = URLEncoder.encode(msgBody, "UTF-8"); // encode body
									
									String href = "mailto:?subject=" + msgSubjectEncoded + "&body=" + msgBodyEncoded;
								%>
									<!-- form to email results -->
									<form>
										<a href=<%=href %> target="_blank">Email my results</a>
									</form>
								<%
								} else { // else if artistSuggestionIds IS empty
								%>
										<!-- display no suggestions header -->
										<div class="section-header">
											<h2>Sorry, we couldn't find any suggestions for you.</h2>
											<h3>Please make new selections and we'll try again.</h3>
										</div>
								<%	
								} // end of else
							} // end if selected lists not empty
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