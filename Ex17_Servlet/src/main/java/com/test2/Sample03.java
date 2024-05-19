package com.test2;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  ● init() vs service() 메서드
 *  		init() => 초기화 등을 담당, 서버가 실행(스타트) 되면서 한 번 동작
 * 		service() => 서블릿 호출 시 매번 동작, 브라우저 등을 통해 서블릿 요청이 있어야 동작
 * 
 */

@WebServlet("/Sample03")
public class Sample03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Sample03() {
        super();
      
    }

	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Sample03.init() - 초기화 담당 / 서버 실행 시 한 번 돟작");
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Sample03.service() - 서블릿 호출 시 매번 동작");
	}

}
