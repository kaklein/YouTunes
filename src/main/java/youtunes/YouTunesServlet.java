package youtunes;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import youtunes.model.Album;
import youtunes.model.Artist;
import youtunes.model.JdbcAlbumDao;
import youtunes.model.JdbcArtistDao;

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
		String base = "/jsp/";
		String url = base + "index.jsp"; // define default url
		String action = request.getParameter("action"); // get value of 'action' parameter
		
		if (action != null) {
			switch (action) {
				// nav bar
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
				// artist pages/functions
				case "goToNewArtist":
					url = base + "artists/New.jsp";
					break;
				case "showArtistDetails":
					url = base + "artists/Details.jsp";
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
				// album pages/functions
				case "goToNewAlbum":
					url = base + "albums/New.jsp";
					break;
				case "showAlbumDetails":
					url = base + "albums/Details.jsp";
					break;	
				case "addAlbum":
					addAlbum(request, response);
					url = base + "index.jsp";
					break;
				case "updateAlbum":
					updateAlbum(request, response);
					url = base + "index.jsp";					
					break;
				case "removeAlbum":
					removeAlbum(request, response);
					url = base + "index.jsp";					
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
		String imgUrl = request.getParameter("img_url");
		
		JdbcArtistDao artistDao = new JdbcArtistDao();
		artistDao.add(new Artist(firstName, lastName, imgUrl));
	}
	
	private void updateArtist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String artistId = request.getParameter("artist_id");
		String imgUrl = request.getParameter("img_url");
		
		Artist artistToUpdate = new Artist(Integer.valueOf(artistId), firstName, lastName, imgUrl);
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
	
	private void addAlbum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		Float price = Float.valueOf(request.getParameter("price"));
		String genre = request.getParameter("genre");
		String imgUrl = request.getParameter("img_url");
		int artistId = Integer.valueOf(request.getParameter("artist_id"));
		int releaseYear = Integer.valueOf(request.getParameter("release_year"));
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao();
		albumDao.add(new Album(title, price, genre, imgUrl, artistId, releaseYear));
	}
	
	private void updateAlbum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int albumId = Integer.valueOf(request.getParameter("album_id"));
		String title = request.getParameter("title");
		Float price = Float.valueOf(request.getParameter("price"));
		String genre = request.getParameter("genre");
		String imgUrl = request.getParameter("img_url");
		int artistId = Integer.valueOf(request.getParameter("artist_id"));
		int releaseYear = Integer.valueOf(request.getParameter("release_year"));
		
		Album albumToUpdate = new Album(albumId, title, price, genre, imgUrl, artistId, releaseYear);
		System.out.println(albumToUpdate.toString());
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao();
		albumDao.update(albumToUpdate);
	}
	
	private void removeAlbum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long albumId = Long.valueOf(request.getParameter("album_id"));
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao();
		albumDao.remove(albumId);
	}
	
}
