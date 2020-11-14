package guestbook.dao;

public class DAOException extends RuntimeException {
	
	public DAOException(String str, Exception e) {
		super(str, e);
	}
	
	public DAOException(Exception e){
		super(e);
	}

}
