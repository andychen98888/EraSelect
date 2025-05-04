package uuu.es.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.es.entity.Customer;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter("/member/*") //member底下的檔案都會先過來這個filter
public class LoginCheckFilter implements Filter {
       
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		HttpSession session = httpRequest.getSession();
		Customer member = (Customer)session.getAttribute("member");
		
		if(member==null) {
			String uri = httpRequest.getRequestURI();
			String queryString = httpRequest.getQueryString();
			
			session.setAttribute("previous_uri", uri);
			session.setAttribute("previous_queryString", queryString);
			httpResponse.sendRedirect("../login.jsp");
			return;
		}
		
		// 交給下一棒
		chain.doFilter(request, response);
	}

	

}
