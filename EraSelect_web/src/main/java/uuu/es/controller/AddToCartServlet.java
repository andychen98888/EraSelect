package uuu.es.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.es.entity.Product;
import uuu.es.entity.ShoppingCart;
import uuu.es.entity.Spec;
import uuu.es.exception.ESException;
import uuu.es.service.ProductService;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add_to_cart.do")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		HttpSession session = request.getSession();
		
		//1.取得request的form data productId,color,spec,quantity
		String productId = request.getParameter("productId");
		String colorName = request.getParameter("color");
		String specName = request.getParameter("spec");
		String quantity = request.getParameter("quantity");
		
		//2.呼叫商業邏輯
		if(productId!=null) {
			ProductService pService = new ProductService();
			try {
				Product p = pService.getProductById(productId);
				if(p!=null) {
					Spec theSpec = null;
					if(p.getSpecCount()>0) {
						theSpec = pService.getTheSpec(productId, colorName, specName);
					}
					if(quantity!=null && quantity.matches("\\d+")) { //正整數(\\\\d+)
						ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
						if(cart==null) {
							cart = new ShoppingCart();
							session.setAttribute("cart", cart);
						}
						cart.addToCart(p, colorName, theSpec, Integer.parseInt(quantity));
					}else {
						errors.add("加入購物車失敗，購買數量資料不正確:" + quantity);
					}
				}else {
					errors.add("加入購物車失敗，查無["+productId+"]產品");
				}
			} catch (ESException e) {
				this.log("加入購物車失敗",e);
			}
			
		}else {
			errors.add("加入購物車失敗，productId不得為null");
		}
		if(errors.size()>0) this.log("加入購物車發生錯誤:"+errors);
		
		String submit = request.getParameter("submit");
		if(submit!=null) {
			//3.外部轉只到cart.jsp 原同步請求
			response.sendRedirect("member/cart.jsp");	
		}else {
//		response.sendRedirect("product_detail.jsp?productId="+productId);	//用騙的同步請求回原網址
			//非同步請求 內部轉交給small_cart.jsp
			request.getRequestDispatcher("small_cart.jsp").forward(request, response);
		}
	}

}
