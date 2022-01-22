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
		<jsp:useBean id="artistDao" scope="application" class="youtunes.JdbcArtistDao" />
		
		<title>YouTunes | New Artist</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//JSPs/TopNav.jsp" flush="true"/>
			
			<!-- form to add a new artist to the database -->
			<form>
				<h3>Add a new artist</h3>
				<p>For artists with only one name, or band names, leave the 'Last name' field blank</p>
			
				<input type="hidden" name="action" value="addArtist">
				
				<label for="first_name">First name:</label>
				<input type="text" id="first_name" name="first_name" placeholder="John"/>
				
				<label for="last_name">Last name:</label>
				<input type="text" id="last_name" name="last_name" placeholder="Lennon"/>
				
				<label for="img_url">Image URL:</label>
				<input type="text" id="img_url" name="img_url">
				
				<input type="submit" class="button" value="Add artist"/>		
			</form>
			
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//JSPs/Footer.jsp" flush="true"/>
	</body>
</html>