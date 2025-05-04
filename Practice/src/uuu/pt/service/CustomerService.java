package uuu.pt.service;

import uuu.pt.entity.Customer;
import uuu.pt.exception.ESException;
import uuu.pt.exception.LoginFailedException;

public class CustomerService {

	private CustomerDAO dao = new CustomerDAO();
	
	public Customer login(String email,String password) throws ESException {
		
		if(email ==  null || email.length()==0 || password == null || password.length()==0) {
			throw new IllegalArgumentException("登入會員必須輸入帳號,密碼");
		}
		Customer c = dao.selectByEmail(email);
		if(c != null && password != null && password.equals(c.getPassword())) {
			return c;
		}
		throw new LoginFailedException("登入失敗,帳號或密碼部正確");
	}
	
	public void register(Customer c) throws ESException{
		if(c==null) {
			throw new IllegalArgumentException("註冊會員客戶物件不得為null");
		}
		dao.insert(c);
	}
	
}
