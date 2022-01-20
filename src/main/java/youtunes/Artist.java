package youtunes;

public class Artist {
	private int id;
	private String firstName;
	private String lastName;
	
	// constructors
	
	public Artist(int id, String firstName, String lastName) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	public Artist(String firstName, String lastName) {
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
	
	@Override
	public String toString() {
		return "Artist{artistId=" + this.id + ", firstName=" + this.firstName +
				", lastName=" + this.lastName + "}";
	}
	
}
