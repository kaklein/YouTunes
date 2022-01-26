package youtunes.model;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/*
 * JdbcArtistDao.java. This class implements the ArtistDao.java interface.
 * For example, “JdbcArtistDao implements ArtistDao {}.”
Variables: JdbcManager db;

Constructor: In the body of the classes constructor instantiate a new JdbcManager() object.
	For example, db = new JdbcManager();

@Override add(Artist entity): using the JdbcManager variable, write an SQL
statement to insert a new Artist record. For assistance, refer to the course’s textbook from CSD430.

@Override list(): using the JdbcManager variable,
write an SQL statement to select all artist rows.

@Override find(Long key): using the JdbcManager variable,
write an SQL statement to select an artist by artist_id.

@Override update(Artist entity): using the JdbcManager variable,
write an SQL statement to update an artist record.

@Override remove(Long key): using the JdbcManager variable,
write an SQL statement to remove an artist record.

 */


public class JdbcArtistDao implements ArtistDao {
	JdbcManager db;
	
	// Constructor
	public JdbcArtistDao() {
		db = new JdbcManager();
	}
	
	@Override
	public void add(Artist artist) {
		// connect to database
		Connection conn = db.getConn();
		
		// insert Artist into database
		if (conn != null) {
			try { 
				Statement stmt = conn.createStatement();
				stmt.executeUpdate("INSERT INTO artists(first_name, last_name, img_url)"
						+ "VALUES ('" + artist.getFirstName() + "', '" + artist.getLastName() + "', '" + artist.getImgUrl() + "')");
				stmt.close();
			} catch (SQLException e) { System.out.println("Exception: " + e);
			} finally {
				db.closeConn(conn); // close connection
			}
		}
		
	}
	
	@Override
	public List<Artist> list() {
		// connect to database
		Connection conn = db.getConn();
		
		// get list of all artists in database
		List<Artist> artistList = new ArrayList<>(); // create empty ArrayList to hold artists
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT artist_id, first_name, last_name, img_url FROM artists ORDER BY first_name";
				try {
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) { //iterate through ResultSet
						// create Artist object
						Artist currentArtist = new Artist(rs.getInt("artist_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("img_url"));
						artistList.add(currentArtist); // add Artist object to list
					}
					rs.close();
					stmt.close();
				} catch (SQLException e) {
					System.out.println("Exception retrieving artist records: " + e);
				}
			} catch (SQLException e) {
				System.out.println("Exception: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
		return artistList;
	}
	
	@Override
	public Artist find(Long artist_id) {
		Artist searchResult = null;
		
		// connect to database
		Connection conn = db.getConn();
		
		// SQL query to find artist by id
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT artist_id, first_name, last_name, img_url FROM artists WHERE artist_id = " + artist_id;
				try {
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next() ) {
						searchResult = new Artist(rs.getInt("artist_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("img_url"));
					}
				} catch (SQLException e) {
					System.out.println("Exception finding artist by id: " + e);
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
	public void update(Artist artist) {
		// connect to database
		Connection conn = db.getConn();
		
		// SQL statement
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "UPDATE artists SET first_name = '" + artist.getFirstName()+ "', last_name = '" + artist.getLastName() + 
						"', img_url = '" + artist.getImgUrl() + "' WHERE artist_id = " + artist.getId();
				stmt.executeUpdate(sql);
				stmt.close();
			} catch (SQLException e) {
				System.out.println("Exception updating artist: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
	}
	
	@Override
	public void remove(Long artist_id) {
		// connect to database
		Connection conn = db.getConn();
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "DELETE FROM artists WHERE artist_id = " + artist_id;
				stmt.executeUpdate(sql);
				stmt.close();
				System.out.println("artist_id " + artist_id + " successfully deleted.");
			} catch (SQLException e) {
				System.out.println("Exception deleting artist record: " + e);
			} finally {
				db.closeConn(conn);
			}
		}
	}
}
