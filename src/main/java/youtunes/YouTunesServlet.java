package youtunes;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;


import youtunes.Album;
import youtunes.Artist;
import youtunes.JdbcAlbumDao;
import youtunes.JdbcArtistDao;

@WebServlet(name = "YouTunesServlet", urlPatterns="/yt/*")
public class YouTunesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public YouTunesServlet() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("*** initializing controller servlet");
		super.init(config);
		
		// get config parameter from web.xml
		ServletContext context = config.getServletContext();
		context.setAttribute("base", config.getInitParameter("base"));
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response)	;	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String base = "/JSPs/";
		String url = base + "index.jsp"; // define default url
		String action = request.getParameter("action"); // get value of 'action' parameter
		
		if (action != null) {
			switch (action) {
				case "goToIndex":
					break;
				case "goToArtists":
					url = base + "artists/List.jsp";
					break;
				case "goToDiscover":
					url = base + "Discover.jsp";
					break;
				case "goToAbout":
					url = base + "About.jsp";
					break;
				case "goToContact":
					url = base + "Contact.jsp";
					break;
				case "goToNewArtist":
					url = base + "artists/New.jsp";
					break;
				case "showArtistDetails":
					url = base + "artists/Details.jsp";
					break;
				case "showAlbumDetails":
					url = base + "albums/Details.jsp";
					break;	
				case "addArtist":
					addArtist(request, response);					
					url = base + "artists/List.jsp";
					break;
				case "updateArtist":
					updateArtist(request, response);
					url = base + "artists/List.jsp";
					break;
				case "removeArtist":
					removeArtist(request, response);
					url = base + "artists/List.jsp";
					break;
				case "addAlbum":
					// TO-DO: call add album function
					
					break;
				case "updateAlbum":
					// TO-DO: call update album function
					
					break;
				case "removeAlbum":
					// TO-DO: call remove album function
					
					break;
			}
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response); // redirect to the url
	}
	
	/* functions */
	private void addArtist(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		
		JdbcArtistDao artistDao = new JdbcArtistDao();
		artistDao.add(new Artist(firstName, lastName));
	}
	
	private void updateArtist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String artistId = request.getParameter("artist_id");
		
		Artist artistToUpdate = new Artist(Integer.valueOf(artistId), firstName, lastName);
		System.out.println(artistToUpdate.toString());
		
		JdbcArtistDao artistDao = new JdbcArtistDao();
		artistDao.update(artistToUpdate);
	}
	
	private void removeArtist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long artistId = Long.valueOf(request.getParameter("artist_id"));
		
		JdbcArtistDao artistDao = new JdbcArtistDao();
		artistDao.remove(artistId);
	}
	
}
