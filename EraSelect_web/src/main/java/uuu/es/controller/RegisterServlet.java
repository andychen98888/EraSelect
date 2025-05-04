package uuu.es.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.es.entity.Customer;
import uuu.es.exception.ESDataInvalidException;
import uuu.es.exception.ESException;
import uuu.es.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register.do")//urlPatterns = 可省略
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		request.setCharacterEncoding("utf-8"); //name address會用到中文
		HttpSession session = request.getSession();//加上session才能用
		// 1.讀取request中的form data:id email phone name birthday password gender captcha
		//							address subscribed
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password1");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
//		String captcha = request.getParameter("captcha");
		String address = request.getParameter("address");
		String subscribed = request.getParameter("subscribed");
		
		//檢查必要欄位是否輸入
		if(id==null || (id=id.trim()).length()==0) errors.add("必須輸入id");
		if(email==null || (email=email.trim()).length()==0) errors.add("必須輸入email");
		if(phone==null ||(phone=phone.trim()).length()==0) errors.add("必須輸入phone");
		if(password==null || password.length()==0) errors.add("必須輸入password");
		if(name==null || (name=name.trim()).length()==0) errors.add("必須輸入name");
		if(birthday==null || birthday.length()==0) errors.add("必須輸入birthday");
		if(gender==null || gender.length()!=1) errors.add("必須選擇性別");
		//驗證碼
//		if(captcha==null || (captcha=captcha.trim()).length()==0){
//			errors.add("必須輸入captcha");
//		}else {
//			String captchaString = (String)session.getAttribute("captchaString");
//			if(!captcha.equals(captchaString)) { //不相等 在前面加!;equalsIgnoreCase不分大小寫
//				errors.add("驗證碼不正確");
//			}
//		}
//		session.removeAttribute("captchaString"); //清除驗證碼
		
		// 2.呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c = new Customer();
			try{
				c.setId(id);
				c.setEmail(email);
				c.setPhone(phone);
				c.setPassword(password);
				c.setName(name);
				c.setBirthday(birthday); //選擇String
				c.setGender(gender.charAt(0));
				
				c.setAddress(address);
				c.setSubscribed(subscribed!=null);
				
				CustomerService service = new CustomerService();
				service.register(c);//加入catch
				
				//3.1 內部轉交(forward)成功畫面給register.jsp
				request.setAttribute("member", c);//MVC架構專屬語法 將c藏在member裡面
				RequestDispatcher dispatcher = request.getRequestDispatcher("register_ok.jsp");//使用派遣器 轉交
				dispatcher.forward(request, response);
				return;
				
			} catch(ESDataInvalidException e) {
				errors.add(e.getMessage());
			} catch (ESException e) {
				errors.add(e.getMessage() + ",請聯絡admin"); //for user
				this.log(e.getMessage(), e);
			} catch(Exception e) {
				errors.add("系統發生錯誤:" + e.getMessage() + ",請聯絡admin"); //for user
				this.log("會員註冊，系統發生錯誤", e);
			}
			
		}
		// 3.2內部轉交(forward)失敗畫面給 register.jsp
		request.setAttribute("errors", errors);//將錯誤藏在"errors"裡面
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");//使用派遣器 轉交
		dispatcher.forward(request, response);
		
		
		
	}

}
