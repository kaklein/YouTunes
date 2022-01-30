/**
 Script to enable hamburger icon to toggle between showing/not showing
 top nav options

	Code comes from Web Dev Simplified tutorial:
	https://www.youtube.com/watch?v=At4B7A4GOPg
 */

const toggleButton = document.getElementsByClassName('toggle-button')[0]
const navLinks = document.getElementsByClassName('nav-links')[0]

toggleButton.addEventListener('click', () => {
  navLinks.classList.toggle('active')
})