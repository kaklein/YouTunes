# YouTunes

<img width="150" alt="youtunes-logo" src="https://user-images.githubusercontent.com/71147550/150875361-a06ad4e6-d604-4c9f-83b9-c51e84e9c342.png">
<p><i>Capstone project for my BS in Software Development.</i></p>

<p><b>YouTunes is a dynamic web application which allows users to:</b></p>
<ul>
  <li>Browse artists and albums</li>
  <li>Add or delete artists and albums</li>
  <li>Get artist recommendations based on their preferences via the Discover interface</li>
 </ul>
 
 ## Tech Stack
 JakartaEE
<p>:small_blue_diamond: Model: Java classes which manage a MySQL database</p>
<p>:small_blue_diamond: View: JSPs with CSS styling</p>
<p>:small_blue_diamond: Controller: Java servlet</p>

<hr>

## Process
<p>I began by creating a technical design document including application features, user personas,
user stories and work estimations, and hand-drawn prototypes.</p>
<p>Development is being completed over the course of three one-week 'sprints'. During each sprint, functional tests are performed
and documented, and virtual Scrum checkins are done every two days to report on current progress and any roadblocks.</p>

<p><b>Sprint 1:</b> Database design and initialization; creation of core classes (Artist and Album); setup of basic JSPs</p>
<p><b>Sprint 2:</b> Creation of servlet class and database manager classes; completion of some functions including viewing, adding, and updating artists</p>
<p><b>Sprint 3:</b> Completion of JSPs, including functions to view, add, and update albums; finalizing CSS styling</p>

<hr>

# Screenshots

<b><p>Homepage (album display)</p></b>
<img width="800" alt="youtunes-homepage" src="https://user-images.githubusercontent.com/71147550/150874167-86cde4a1-f8e0-4394-80a8-610d777d80a5.png">
<br>

<b><p>Artists</p></b>
<img width="800" alt="youtunes-artists" src="https://user-images.githubusercontent.com/71147550/150874242-d4987378-052b-42f6-8597-92e06f42a2a6.png">
<br>

<b><p>Discover tool</p></b>
<p>Users select genre(s) and decade(s) to get suggestions of artists they may like</p>
<img width="500" alt="youtunes-discover-form" src="https://user-images.githubusercontent.com/71147550/150874449-68c6006f-e3a2-4d51-8f8b-3cf86a6e49d1.png">
<p>The database is queried via the servlet to get artists that match some or all of the user's selections.</p>
<p>Results are displayed and users can click on an artist to go to their details page.</p>
<img width="700" alt="youtunes-discover-results" src="https://user-images.githubusercontent.com/71147550/150874435-a4e3839d-aec4-4195-beb0-8e8e12eda345.png">
<p>At the bottom of the page, there's an "Email my results" button which opens the user's email client with a pre-populated email so that they can easily send themselves/anyone else their artist suggestions.</p>

<hr>
<p><i>Parts of this project's implementation are based on the course example at https://github.com/buwebdev/youtunes</i></p>
 
