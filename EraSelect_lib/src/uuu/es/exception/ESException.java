package uuu.es.exception;

public class ESException extends Exception { //Exception為父類別
//	自訂Exception (重大錯誤Exception 微小錯誤RuntimeException可用程式避免解決)
	
	public ESException() {
		super();
		
	}

	public ESException(String message, Throwable cause) {
		super(message, cause);
	
	}

	public ESException(String message) {
		super(message);
	
	}

}
