package uuu.es.controller;

import java.io.IOException;
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
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/member/update.do") //http://電腦名稱localhost:8080/es
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		request.setCharacterEncoding("utf-8"); //name address會用到中文
		HttpSession session = request.getSession();//加上session才能用
		
		Customer member = (Customer)session.getAttribute("member");
		
		// 1.讀取request中的form data:id email phone name birthday password gender captcha
		//							address subscribed
		String id = request.getParameter("id"); //使用者不可修改
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		String changePwd = request.getParameter("changePwd");
		String newPassword = request.getParameter("newPassword");
		
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String subscribed = request.getParameter("subscribed");
		
		//檢查必要欄位是否輸入
		if(member == null) {
			errors.add("會員資料不正確，請重新登入!");
			response.sendRedirect("../");
			return;
		}else {
			if(!member.getId().equals(id)) errors.add("不得修改id!"); //***不得從前端修改
			
			if(!member.getPassword().equals(password)) errors.add("原密碼不正確!");
			
			if(changePwd!=null) {
				if(newPassword==null || newPassword.length()==0) {
					if(!member.getPassword().equals(password)) errors.add("新密碼不正確!");
				}
			}else {
				newPassword = password;
			}		
			
			if(email==null || (email=email.trim()).length()==0) errors.add("必須輸入email.");
			if(phone==null || (phone=phone.trim()).length()==0) errors.add("必須輸入手機.");
			if(name==null || (name=name.trim()).length()==0) errors.add("必須輸入姓名.");
			if(birthday==null || birthday.length()==0) errors.add("必須輸入生日.");
			if(gender==null || gender.length()!=1) errors.add("必須選擇性別");
			
		}
		
		// 2.呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c = null;
			try {
				c = member.getClass().newInstance();
			} catch (InstantiationException|IllegalAccessException e) {
				c = new Customer(); 
			}
			try{
				c.setId(member.getId());
				c.setEmail(email);
				c.setPhone(phone);
				c.setPassword(changePwd!=null?newPassword:password);
				c.setName(name);
				c.setBirthday(birthday); //選擇String
				c.setGender(gender.charAt(0));
				
				c.setAddress(address);
				c.setSubscribed(subscribed!=null);
				
//				if(c instanceof VIP) {
//					((VIP)c).setDiscount(((VIP)member).getDiscount());
//				}
				
				CustomerService service = new CustomerService();
				service.update(c);//加入catch
				//取代session中的舊會員資料
				session.setAttribute("member", c);//MVC架構專屬語法 將c藏在member裡面 **要用session蓋掉登入的舊資料
				//3.1 外部轉交update_ok.jsp
				response.sendRedirect("update_ok.jsp");
				return;
				
			} catch(ESDataInvalidException e) {
				errors.add(e.getMessage());
			} catch (ESException e) {
				errors.add(e.getMessage() + ",請聯絡admin"); //for user
				this.log(e.getMessage(), e);//for admin
			} catch(Exception e) {
				errors.add("系統發生錯誤:" + e.getMessage() + ",請聯絡admin"); //for user
				this.log("會員修改，系統發生錯誤", e);//for admin
			}
		}
		// 3.2內部轉交(forward)失敗畫面給 update.jsp
		request.setAttribute("errors", errors);//將錯誤藏在"errors"裡面
		RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");//使用派遣器 轉交
		dispatcher.forward(request, response);
	}
	
	
}
