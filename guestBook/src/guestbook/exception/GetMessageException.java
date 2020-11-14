package guestbook.exception;

public class GetMessageException extends RuntimeException {
	
	public GetMessageException(String str, Exception e) {
		super(str, e);
	}
	
	public GetMessageException(Exception e){
		super(e);
	}
}
