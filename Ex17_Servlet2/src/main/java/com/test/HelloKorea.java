package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description="헬로우코리아",urlPatterns= {"/hello","/korea.do"})
public class HelloKorea extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		System.out.println("Hello, Korea~ !!");
	}

}
