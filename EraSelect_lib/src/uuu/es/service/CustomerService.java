package uuu.es.service;

import uuu.es.entity.Customer;
import uuu.es.exception.ESException;
import uuu.es.exception.LoginFailedException;

public class CustomerService { //前端網頁

	private CustomerDAO dao = new CustomerDAO(); // 屬性
	
//	會員登入
	public Customer login(String id, String password) throws ESException { // 建立login方法
		
		if(id == null || id.length()==0 || password == null || password.length()==0)
			throw new IllegalArgumentException("登入會員必須輸入帳號,密碼"); //
		
		Customer c = dao.selectById(id); // selectById(id);

		if (c != null && password != null && password.equals(c.getPassword())) {
//			sendLoginOkEmail(c.getEmail());
			return c;
		}//else if(c != null) {
//			sendLoginFailedEmail(c.getEmail());
//		}
		//太詳細會有漏洞
//		else if(c == null) {
//			throw new LoginFailedException("帳號不正確");
//		}else {
//			throw new LoginFailedException("密碼不正確");
//		}
		
		throw new LoginFailedException("登入失敗，帳號或密碼不正確");
	}
	
	
//	會員註冊
	public void register(Customer c) throws ESException{ 
		
		if(c==null) {
			throw new IllegalArgumentException("註冊會員客戶物件不得為null");
		}
		dao.insert(c);
	}
	
	
//	會員修改
	public void update(Customer c) throws ESException{ 
		
		if(c==null) {
			throw new IllegalArgumentException("修改會員客戶物件不得為null");
		}
		dao.update(c);
	}
}
