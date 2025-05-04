package uuu.es.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.login.LoginException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.es.entity.Customer;
import uuu.es.exception.ESException;
import uuu.es.exception.LoginFailedException;
import uuu.es.service.CustomerService;

/**
 * Servlet implementation class loginservletpartice
 */
@WebServlet("/loginservlet.do")
public class loginservletpartice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservletpartice() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");

		if(id==null || (id=id.trim()).length()==0) errors.add("必須輸入id/email/手機");
		if(password==null || password.length()==0) errors.add("必須輸入密碼");
		if(captcha==null || (captcha=captcha.trim()).length()==0) errors.add("必須輸入驗證碼");
		
		if(errors.isEmpty()) {
			CustomerService service = new CustomerService();
			try {
				Customer c = service.login(id, password);
				request.setAttribute("member", c);
				RequestDispatcher dispatcher = request.getRequestDispatcher("login_ok.jsp");
				dispatcher.forward(request, response);
				return;
			} catch(LoginFailedException e) {
				errors.add(e.getMessage());
			} catch (ESException e) {
				this.log(e.getMessage(),e);
				errors.add(e.getMessage()+",請聯絡admin");
			} catch(Exception e) {
				this.log("會員登入時，系統發生錯誤", e);//for admin
				errors.add("系統發生錯誤:" + e + ",請聯絡admin");
			}
		}
			request.setAttribute("errors", errors);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);

	}

}
