package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    MemberService memberService;
    MemberVO memberVO;
	
    public MemberController() {
        super();
        
    }

	
	public void init() throws ServletException {
		memberService=new MemberService();
		//memberVO=new MemberVO();
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request,response);	
	}
	
	// doGet(), doPost() 요청 모두 여기에서 칠
protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 뷰페이지 템플릿
		String viewPage="";
		
		// 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 사용자 입력 URL 요청에서 액션 값만 분리하기
	//	String action="/memberInsert.do";
	//	String uri=request.getRequestURI();							// => /Ex18_controller/memberList.do
	//	String conPath=request.getContextPath();			// => /Ex18_controller
		
	//	String action=uri.substring(conPath.length());		// => /memberList.do
		
		// 출력
		PrintWriter out=response.getWriter();
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Full URL
		String fullUrl=request.getRequestURL().toString();
		out.println("fullUrl :"+fullUrl+"<br>");
		
		// URI (수동)
		// http://localhost/Ex18_controller/memberInsert.do
		int index=fullUrl.indexOf("/",9); //16
		out.println("index : "+index+"<br>");
		String uri=fullUrl.substring(index);
		out.println("uri : "+uri+"<br>"); // => /Ex18_controller/memberInsert.do
		
		// conPath(Context Path)
		String conPath=uri.substring(0,uri.indexOf("/",1));
		out.println("conPath : "+conPath+"<br>");
		
		//Action
		String action=uri.substring(conPath.length()); // => /memberInsert.do
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		// 액션 값에 따른 분기 처리
		try {
			if(action.equals("/memberList.do")) {
				// MemberService.list() 메서드 호출
				List<MemberVO> dataList=memberService.list();
			
				// 1. 뷰페이지 지정
				// 뷰페이지 템플릿(JSP 파일) 파일을 선택 => template/tpl_memberList.jsp
				viewPage="template/tpl_memberList.jsp";
				
				// 2. 뷰페이지 요청전 전달해야하는 값이 있다면 셋팅
				request.setAttribute("dataList", dataList);
				
				// 3. 뷰페이지 요청
				// 뷰페이지 출력 => RequestDispatcher forward() 메서드가 담당
				// 출력의 의미는 뷰페이지로 필요한 속성이나 값들을 셋팅하여 보내는 개념으로 생각
				// 단순 뷰페이지 호출하는 개념이 아니고 속성이나 값을 같이 전달하는 개념 => 전용 객체 필요 => dispatcher
				// forward(req,res) 같이 전달 => "보낸다" 이렇게 생각하자!
				// dispatcher 객체 생성 => getRequestDispatcher(viewPage) 뷰페이지 변수를 인자로 전달
				RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
				dispatcher.forward(request,response);
			}
			else if(action.equals("/memberInsertForm.do")) {
				// 1. 뷰페이지 지정
				viewPage="template/tpl_memberInsertForm.jsp";
				
				// 2. 뷰페이지 요청전 전달해야 하는 값
				// ...
				
				// 3. 뷰페이지 요청
				RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			else if(action.equals("/memberInsert.do")) {
				MemberVO vo=new MemberVO();
				// 전달되는 값 받기
				String id=request.getParameter("id");
				String pw=request.getParameter("pw");
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String phone=request.getParameter("phone");
				
				// 맴버 객체 셋팅
				vo.setId(id);
				vo.setPw(pw);
				vo.setName(name);
				vo.setEmail(email);
				vo.setPhone(phone);
				
				// 추가
				memberService.add(vo);
				
				// 페이지 이동
				response.sendRedirect("/Ex18_Controller/memberList.do");
			}
			else if(action.equals("/memberDelete.do")) {
				// 뷰페이지 템플릿
				viewPage+="<!DOCTYPE html>";
				viewPage+="<html lang=\"ko\">";
				viewPage+="<head><meta charset=\"UTF-8\"><title>삭제 페이지</title></head>";
				viewPage+="<body>";
				viewPage+="<h2>MemberController.doHandle() => /memberDelete.do 삭제 페이지 호출</h2>";
				viewPage+="<button onclick='location.href=\"/Ex18_Controller/memberList.do\"'>리스트</button>";
				viewPage+="</body>";
				viewPage+="</html>";
							
				// 삭제
				memberService.delete();
				// 뷰페이지 출력
				response.getWriter().write(viewPage);
			}
			else {
				response.getWriter().write("<h2>"+uri+"</h2> (uri 값을 체크해주세요!)");
				response.getWriter().write("<h2>"+conPath+"</h2> (conPath 값을 체크해주세요!)");
				response.getWriter().write("<h2>"+action+"</h2> (action 값을 체크해주세요!)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
