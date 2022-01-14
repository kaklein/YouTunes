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
		<%@page import="java.util.ArrayList, java.util.Arrays" %>
		
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
							<!-- TO-DO: replace hard-coded options with generation of genres from database -->
							<select id="genre" name="genre[]" multiple>
								<option value="pop">pop</option>
								<option value="rock">rock</option>
								<option value="hip hop">hip hop</option>
								<option value="indie">indie</option>
							</select>
						</div>
						
						<div class="form-field" id="year-select">
							<label for="year">Year(s):</label>
							<!-- TO-DO: replace hard-coded options with generation of years from database -->						
							<select id="year" name="year[]" multiple>
								<option value="1950">1950s</option>
								<option value="1960">1960s</option>
								<option value="1970">1970s</option>
								<option value="1980">1980s</option>
								<option value="1990">1990s</option>
								<option value="2000">2000s</option>
								<option value="2010">2010s</option>
								<option value="2020">2020 - present</option>
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
			
						<!-- TO-DO: query database for suggestions and display artist cards -->
						<%
							// get lists of selected genres and years
							ArrayList<String> genreList = new ArrayList<>(Arrays.asList(request.getParameter("genre[]")));
							ArrayList<String> yearList = new ArrayList<>(Arrays.asList(request.getParameter("year[]")));
								
							if (genreList.contains("pop")) {
								out.println("<p>Michael Jackson</p>");
							}
							if (genreList.contains("rock")) {
								out.println("<p>Muse</p>");
							}
							if (yearList.contains("1960")){
								out.println("<p>The Mamas and the Papas</p>");
							}
							if (yearList.contains("2020")) {
								out.println("<p>Phoebe Bridgers</p>");
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