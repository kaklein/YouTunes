<h1 align="center">YouTunes</h1>

<p align="center"><img width="150" alt="youtunes-logo" src="https://user-images.githubusercontent.com/71147550/150875361-a06ad4e6-d604-4c9f-83b9-c51e84e9c342.png"></p>
<p align="center"><i>Capstone project for my BS in Software Development</i></p>
<br>

## Overview
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
<p>I began by creating a Technical Design Document including application features, user personas,
user stories and work estimations, and hand-drawn prototypes.</p>
<p>Development was completed over the course of three one-week sprints. In addition to development during each sprint, I performed
and documented functional tests and participated in virtual Scrum checkins to report on current progress and roadblocks.</p>

<b>Sprint 1:</b>
<ul>
   <li>Database design and initialization</li>
   <li>Creation of core classes (Artist and Album)</li>
   <li>Setup of basic JSPs</li>
  </ul>
  
<b>Sprint 2:</b>
<ul>
  <li>Creation of servlet class and database manager classes</li>
  <li>Completion of some functions including viewing, adding, and updating artists</li>
 </ul>

<b>Sprint 3:</b>
  <ul>
  <li>Completion of JSPs, including functions to view, add, and update albums</li>
  <li>Implementation of the Discover interface</li>
  <li>Finalizing CSS styling</li>
 </ul>

<hr>

## Screenshots

<b><h3>Homepage</h3></b>
<p>The homepage displays all albums in the database. <i>Pictured: desktop view</i></p>

<img width="800" alt="youtunes-homepage" src="https://user-images.githubusercontent.com/71147550/151681947-f7d1160f-d4a7-4154-b480-17cd1365b9e7.png">
<br>


<b><h3>Responsive Nav Bar</h3></b>

<p>Responsive design means that on smaller screens, the navigation bar links are replaced by a hamburger icon which toggles between displaying and collapsing the menu options.</p>
<p float="left">
  <img width="400" alt="youtunes-artists-expanded-menu" src="https://user-images.githubusercontent.com/71147550/151681955-e6ddc734-e1e2-40a5-8f05-187486de9f46.png">
  <img width="400" alt="youtunes-artists-collapsed-menu" src="https://user-images.githubusercontent.com/71147550/151682069-7c81fb6e-75a1-4504-8836-f59a0685324b.png">
</p>

<br>


<b><h3>Discover tool</h3></b>

<b><p>:arrow_right: Form</p></b>
<p>Users select genre(s) and decade(s) to get suggestions of artists they may like.</p>
<img width="700" alt="youtunes-discover" src="https://user-images.githubusercontent.com/71147550/151682019-dafe2944-bff7-4f97-97bf-a6590462525a.png">

<b><p>:arrow_right: Results</p></b>
<p>The database is queried via the servlet to get artists that match some or all of the user's selections.</p>
<p>Results are displayed and users can click on an artist to go to their details page.</p>
<img width="700" alt="youtunes-discover-results" src="https://user-images.githubusercontent.com/71147550/151682024-b78b39fc-e819-4241-99b4-74d46677f1b2.png">

<b><p>:arrow_right: Email Option</p></b>
<p>At the bottom of the page, there's an "Email my results" button which opens the user's email client with a pre-populated email so that they can easily send themselves/anyone else their artist suggestions.</p>

<hr>

<p><i>Parts of this project's implementation are based on the course example at https://github.com/buwebdev/youtunes</i></p>
 
