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
		<jsp:useBean id="artistDao" scope="application" class="youtunes.model.JdbcArtistDao" />
		
		<title>YouTunes | New Artist</title>
	</head>
	
	<body>
		<div class="main-content">
			<!-- include top nav menu -->
			<jsp:include page="//jsp/TopNav.jsp" flush="true"/>
			
			<!-- form to add a new artist to the database -->
			<form>
				<h2 class="center-text">Add a new artist</h2>
				<p class="form-instructions center-text">For artists with only one name, or band names, leave the 'Last name' field blank</p>
			
				<input type="hidden" name="action" value="addArtist">
				
				<table>
					
					<tr class="form-field">
						<td><label for="first_name" class="inline-block">First name:</label></td>
						<td><input type="text" class="inline-block" id="first_name" name="first_name"/></td>
					</tr>
					
					<tr class="form-field">
						<td><label for="last_name" class="inline-block">Last name:</label></td>
						<td><input type="text" class="inline-block" id="last_name" name="last_name"/></td>
					</tr>
					
					<tr class="form-field">
						<td><label for="img_url" class="inline-block">Image URL:</label></td>
						<td><input type="text" class="inline-block" id="img_url" name="img_url"></td>
					</tr>

					
				</table>
				
				<input type="submit" class="button submit-button" value="Add artist"/>		
			</form>
			
		</div>
		
		<!-- include footer  -->
		<jsp:include page="//jsp/Footer.jsp" flush="true"/>
	</body>
</html>