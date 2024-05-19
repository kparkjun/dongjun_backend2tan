package com.test2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * ● URL Mapping 방법
 * 		1. @WebServlet 사용
 * 		2. web.xml 사용
 *	 - 둘 중 사용은 한 가지만 사용 => 에너테이션 사용을 권장하나 xml 방식도 알고는 있어야 한다.
 *  - 같은 패턴으로 모두 셋팅하면 충돌 발생 => 둘 중 하나로만 맵핑하여 요청 처리
 *  
 *   - @WebServlet("/*") => 사용자가 어떻게 입력하든지간에 모두 실행
 *   - @WebServlet(urlPatterns="/*") => 한 개만 지정하더라도 이렇게 사용하는게 가능
 *   - @WebServlet(urlPatterns="*.do") => 확장자가 반드시 do로 끝나야 하고, 중간에는 어떤 요청이 들어와도 상관 X
 *   - loadStartup=1
 *   		이 숫자가 0보다 크면 서버가 스타트되면서 서블릿을 바로 초기화(보다 빠르게 초기화하는데 목적)
 *   		숫자(앙의 정수)가 작은 것부터 먼저 로딩 => 1
 *   
 *   
 */
@WebServlet(urlPatterns="*.go")
public class Sample01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
      public Sample01() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// out.println("Sample01.doGet() - 서블릿 호출");
		System.out.println("Sample01.doGet() - 서블릿 호출");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
