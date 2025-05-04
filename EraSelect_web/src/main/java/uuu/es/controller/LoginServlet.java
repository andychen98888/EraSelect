package uuu.es.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.login.LoginException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.es.entity.Customer;
import uuu.es.exception.ESException;
import uuu.es.exception.LoginFailedException;
import uuu.es.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = "/login.do",loadOnStartup = 1)  //創建伺服器上的假網址，最左邊一定要有/，html的actoin不需要有;http://localhost:8080/es/login.do
public class LoginServlet extends HttpServlet { //Servlet類別上宣告的假網址 最左邊一定要加/
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>(); //建立errors串列
//		request.setCharacterEncoding("utf-8"); //使用者輸入用到中文需要加這行
		HttpSession session = request.getSession();//***加上session才能用
		// 1.讀取request中的form data:id password captcha
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		
		//檢查必要欄位是否輸入
		if(id==null || (id=id.trim()).length()==0) {
			errors.add("必須輸入id/email/手機");
		}
		if(password==null || password.length()==0) {
			errors.add("必須輸入password");	
		}
		//驗證碼
		if(captcha==null || (captcha=captcha.trim()).length()==0) {
			errors.add("必須輸入captcha");
		}else {
			String captchaString = (String)session.getAttribute("captchaString");
			if(!captcha.equals(captchaString)) { //不相等 在前面加!;equalsIgnoreCase不分大小寫
				errors.add("驗證碼不正確");
			}
		}
		session.removeAttribute("captchaString"); //清除驗證碼
		
		String prevURI = (String)session.getAttribute("previous_uri");	
		String queryString = (String)session.getAttribute("previous_queryString");
		session.removeAttribute("previous_uri");
		session.removeAttribute("previous_queryString");
		
		// 2.呼叫商業邏輯 CustomerService.login
		if(errors.isEmpty()) { //沒有錯
			CustomerService service = new CustomerService();
			try {
				Customer c = service.login(id, password);
	
				//3.1 內部轉交(forward)成功畫面給login_ok.jsp
				session.setAttribute("member", c);//MVC架構專屬語法 將c藏在member裡面
				if(prevURI!=null) {
					if(queryString!=null) prevURI+="?"+queryString;
					request.setAttribute("previous_uri", prevURI);					
				}				
				System.out.println(session.getId());
				
//				session.setMaxInactiveInterval(20); //秒 自動登出 timeout 幾分鐘*60 不要亂加
				RequestDispatcher dispatcher = request.getRequestDispatcher("login_ok.jsp");//使用派遣器 轉交
				dispatcher.forward(request, response);//把控制權轉交出去
				return; //一定要return*********
			} catch(LoginFailedException e) {
				errors.add(e.getMessage());
			} catch (ESException e) {
				this.log(e.getMessage(), e);//for admin
				errors.add(e.getMessage() + ",請聯絡admin");
			} catch(Exception e) { //RuntimeException
				this.log("會員登入時，系統發生錯誤", e);//for admin
				errors.add("系統發生錯誤:" + e + ",請聯絡admin");
			}
		}
		//不好用
//		response.setContentType("text/html"); //response.setContentType("text/html;charset=utf-8");舊版寫法
//		response.setCharacterEncoding("utf-8");
//		try(PrintWriter out = response.getWriter();){
//			out.println("<!DOCTYPE html>");
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>登入失敗</title>");
//			out.println("</head>");
//			out.println("<body>");
//			out.println("	<h2>"+ errors +"</h2>");
//			out.println("</body>");
//			out.println("</html>");
//		}
		// 3.2內部轉交(forward)失敗畫面給 login.jsp
		request.setAttribute("errors", errors);//將錯誤藏在"errors"裡面
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");//使用派遣器 轉交
		dispatcher.forward(request, response);//把控制權轉交出去
	
		
		
		
		
	}

}
