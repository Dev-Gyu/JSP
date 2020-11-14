package guestbook.exception;

public class WriteServiceException extends RuntimeException {
		
		public WriteServiceException(String str, Exception e) {
			super(str, e);
		}
		
		public WriteServiceException(Exception e){
			super(e);
		}

}
