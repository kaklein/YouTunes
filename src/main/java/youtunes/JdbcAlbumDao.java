package youtunes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 * JdbcAlbumDao.java. This class implements the AlbumDao.java interface.

Variables: JdbcManager db;

Constructor: In the body of the classes constructor instantiate a new JdbcManager() object.
	For example, db = new JdbcManager();

@Override add(Album entity): using the JdbcManager variable, write an SQL
statement to insert a new Album record. For assistance, refer to the course’s textbook from CSD430.

@Override list(): using the JdbcManager variable,
write an SQL statement to select all album rows.

@Override find(Long key): using the JdbcManager variable,
write an SQL statement to select an album by album_id.

@Override update(Album entity): using the JdbcManager variable,
write an SQL statement to update an album record.

@Override remove(Long key): using the JdbcManager variable,
write an SQL statement to remove an album record.

 */

public class JdbcAlbumDao implements AlbumDao {
	JdbcManager db;
	
	//Constructor
	public JdbcAlbumDao() {
		db = new JdbcManager();
	}
	
	@Override
	public void add(Album album) {
		// connect to database
		Connection conn = db.getConn();
		
		// insert Album into database
		if (conn != null) {
			try { 
				Statement stmt = conn.createStatement();		
				stmt.executeUpdate("INSERT INTO albums(title, price, " +
						"genre, img_url, artist_id, release_year)" +
						"VALUES ('" + album.getTitle() + "', " + album.getPrice() +
						", '" + album.getGenre() + "', '" + album.getImgUrl() + "', " + album.getArtistId() +
						", " + album.getReleaseYear() + ")");
				stmt.close();
			} catch (SQLException e) { System.out.println("Exception: " + e);
			} finally {
				db.closeConn(conn); // close connection
			}
		}
		
	}
	
	@Override
	public List<Album> list() {
		// connect to database
		Connection conn = db.getConn();
		
		// get list of all albums in database
		List<Album> albumList = new ArrayList<>(); // create empty ArrayList to hold albums
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT * FROM albums ORDER BY title";
				try {
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) { //iterate through ResultSet
						// create Album object
						Album currentAlbum = new Album(rs.getInt("album_id"), rs.getString("title"), rs.getInt("price"),
								rs.getString("genre"), rs.getString("img_url"), rs.getInt("artist_id"), rs.getInt("release_year")
							);
						albumList.add(currentAlbum); // add Album object to list
					}
					rs.close();
					stmt.close();
				} catch (SQLException e) {
					System.out.println("Exception retrieving album records: " + e);
				}
			} catch (SQLException e) {
				System.out.println("Exception: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
		return albumList;
	}
	
	@Override
	public Album find(Long album_id) {
		Album searchResult = null;
		
		// connect to database
		Connection conn = db.getConn();
		
		// SQL query to find album by id
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT * FROM albums WHERE album_id = " + album_id;
				try {
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next() ) {
						searchResult = new Album(rs.getInt("album_id"), rs.getString("title"), rs.getFloat("price"),
								rs.getString("genre"), rs.getString("img_url"), rs.getInt("artist_id"), rs.getInt("release_year")
							);
					}
				} catch (SQLException e) {
					System.out.println("Exception finding album by id: " + e);
				}
			} catch (SQLException e) {
				System.out.println("Exception: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
		return searchResult;
	}
	
	@Override
	public void update(Album album) {
		// connect to database
		Connection conn = db.getConn();
		
		// SQL statement
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "UPDATE albums SET title = " + album.getTitle()+ " price = " + album.getPrice() + 
						"genre = " + album.getGenre() + " img_url = " + album.getImgUrl() + " release_year = " + album.getReleaseYear() +
					" WHERE album_id = " + album.getAlbumId();
				stmt.executeUpdate(sql);
				stmt.close();
			} catch (SQLException e) {
				System.out.println("Exception updating album: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
	}
	
	@Override
	public void remove(Long album_id) {
		// connect to database
		Connection conn = db.getConn();
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "DELETE FROM albums WHERE album_id = " + album_id;
				stmt.executeUpdate(sql);
				stmt.close();
			} catch (SQLException e) {
				System.out.println("Exception deleting album record: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
	}
	
	/* method to find album by artist id */
	public List<Album> findByArtistId(Long artist_id) {
		List<Album> searchResult = new ArrayList<>();
		
		// connect to database
		Connection conn = db.getConn();
		
		// SQL query to find album by id
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT * FROM albums WHERE artist_id = " + artist_id + " ORDER BY release_year DESC";
				try {
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next() ) { //iterate through ResultSet
						// create Album object
						Album currentAlbum = new Album(rs.getInt("album_id"), rs.getString("title"), rs.getInt("price"),
								rs.getString("genre"), rs.getString("img_url"), rs.getInt("artist_id"), rs.getInt("release_year")
							);
						searchResult.add(currentAlbum); // add Album object to list
					}
				} catch (SQLException e) {
					System.out.println("Exception finding album by id: " + e);
				}
			} catch (SQLException e) {
				System.out.println("Exception: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
		return searchResult;
	}
	
	/* method to get name of artist */
	public String getArtistName(Long album_id) {
		String name = "";
		
		// connect to database
		Connection conn = db.getConn();
		
		// SQL query to find artist name associated with album
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT first_name, last_name FROM artists WHERE artist_id = (SELECT artist_id FROM albums WHERE album_id = " + album_id + ")";
				try {
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next() ) {
						String first_name = rs.getString("first_name");
						String last_name = rs.getString("last_name");
						
						name += first_name;
						if (last_name != null && last_name != "") {
							name += " " + last_name;
						}
					}
				} catch (SQLException e) {
					System.out.println("Exception: " + e);
				}
			} catch (SQLException e) {
				System.out.println("Exception getting artist name: " + e);
			}
		}
		
		return name;
	}
	
	/* method to get list of genres as listed on albums */
	public List<String> getGenres(){
		List<String> genreList = new ArrayList<>();
		
		// connect to database
		Connection conn = db.getConn();
		
		// SQL query to get all genres in database
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT DISTINCT genre FROM albums ORDER BY genre";
				ResultSet rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
					// add each genre to list
					genreList.add(rs.getString("genre"));
				}
			} catch (SQLException e) {
				System.out.println("Exception getting genres: " + e);
			}
		}
		
		return genreList;
	}
	
	/* method to get list of individual genres */
	public List<String> getSubGenres() {
		List<String> genreList = new ArrayList<>();
		
		// connect to database
		Connection conn = db.getConn();
		
		// SQL query to get non-duplicate list of genres in database
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT DISTINCT genre FROM albums";
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) { // iterate through ResultSet
					// split genre into multiple items by spaces (e.g. "pop rock" becomes ['pop', 'rock'])
					String[] splitStrings = rs.getString("genre").split(" ");
					for (String word : splitStrings) {
						if (!genreList.contains(word)) {
							genreList.add(word);
						}
					}
				}
				
			} catch (SQLException e) {
				System.out.println("Exception getting genres: " + e);
			}
		}
		
		return genreList;
	}
	
}
