package youtunes;

public class Artist {
	private int id;
	private String firstName;
	private String lastName;
	private String imgUrl;
	
	// constructors
	
	public Artist(int id, String firstName, String lastName, String imgUrl) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.imgUrl = imgUrl;
	}
	
	public Artist(String firstName, String lastName, String imgUrl) {
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	
	// getters and setters
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return this.firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		if (this.lastName != null) {
			return this.lastName;
		}
		else {
			return "";
		}
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getImgUrl() {
		return this.imgUrl;
	}
	
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
	@Override
	public String toString() {
		return "Artist{artistId=" + this.id + ", firstName=" + this.firstName +
				", lastName=" + this.lastName + ", imgUrl=" + this.imgUrl + "}";
	}
	
}
