package mvc.vo;

public class VOClass {
	
	private int id;
	private String password;
	private String name;
	private String message;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setNull() {
		this.id = 0;
		this.password = null;
		this.name = null;
		this.message = null;
	}
	
	

}
