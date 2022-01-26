package youtunes.model;

public class Album {
	// properties
	private int albumId;
	private String title;
	private float price;
	private String genre;
	private String imgUrl;
	private int artistId;
	private int releaseYear;
		
	// constructors
	public Album(int id, String title, float price, String genre, String imgUrl, int artistId, int releaseYear) {
		this.albumId = id;
		this.title = title;
		this.price = price;
		this.genre = genre;
		this.imgUrl = imgUrl;
		this.artistId = artistId;
		this.releaseYear = releaseYear;
	}
	
	public Album(String title, float price, String genre, String imgUrl, int artistId, int releaseYear) {
		this.title = title;
		this.price = price;
		this.genre = genre;
		this.imgUrl = imgUrl;
		this.artistId = artistId;
		this.releaseYear = releaseYear;
	}
	
	// getters and setters
	public int getAlbumId() {
		return this.albumId;
	}
	public void setAlbumId(int id) {
		this.albumId = id;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public float getPrice() {
		return this.price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	public String getGenre() {
		return this.genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public String getImgUrl() {
		return this.imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public int getArtistId() {
		return this.artistId;
	}
	public void setArtistId(int id) {
		this.artistId = id;
	}
	
	public int getReleaseYear() {
		return this.releaseYear;
	}
	public void setReleaseYear(int releaseYear) {
		this.releaseYear= releaseYear;
	}
		
		
	@Override
	public String toString() {
		return "Album{album_id=" + this.albumId + ", title=" + this.title +
			", price=" + this.price + ", genre=" + this.genre + ", img_url=" + this.imgUrl +
			", artist_id=" + this.artistId + ", release_year=" + this.releaseYear + "}";
		}
}
