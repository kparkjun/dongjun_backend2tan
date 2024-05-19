package com.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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

		public void init(ServletConfig config) throws ServletException {
			memberService=new MemberService();
			memberVO=new MemberVO();
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			doHandle(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doHandle(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// doGet(), doPost() 요청 모두 여기에서 처리
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, NamingException{
		// 뷰페이지 템플릿
		String viewPage="";
		
		// 기본 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 사용자 입력 URL 요청에서 액션 값만 분리하기
		String uri=request.getRequestURI(); // => /EX19_MVC/memberList.do
		String conPath=request.getContextPath(); // => Ex19_MVC
		String action=uri.substring(conPath.length()); // => /memberList.do
		
		// Pagination ----------------------------------------------------------- Start
		// 넘어온 페이지 값이 없으면 => 1
		String _page=request.getParameter("page");
		
		// 일단 처음에 접속하면 1페이지로 셋팅
		int cPage=1;
		
		// 페이지 값이 널이 아니면 해당 페이지로 값을 셋팅
		if(_page!=null) {
			cPage=Integer.parseInt(_page);
		}
		//System.out.println(cPage);
		
		// LIMIT ?,? => 이 값을 여기에서 계산해서 전달
		int cPosition=0; // 해당 페이지에서 보여져야 하는 레코드의 시작 위치
		int limitValue=2; // 한 페이지당 보여지는 레코드의 갯수
		
		//레코드 시작 위치 계산
		cPosition=(cPage-1)*limitValue;
		
		// 총 레코드 수 구하기
		int tCount=memberService.tCount();
		// 총 페이지 수 구하기
		int totalRecord=tCount;
		int totalPage=(int) Math.ceil(totalRecord/Math.floor(limitValue));
		int prev=cPage-1;
		int next=cPage+1;
		int pageGroup=2;
		//System.out.println(totalPage);
		// Pagination ----------------------------------------------------------- End		
		response.getWriter().write(action);
		
		// 액션 값에 따른 분기 처리
		try {
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			if(action.equals("/memberList.do")) {
				// MemberService.list() 메서드 호출
				List<MemberVO> dataList=memberService.list(cPosition,limitValue);
				
				// 뷰페이지 지정
				viewPage="template/tpl_memberList.jsp";
				
				// 뷰페이지로 전달해야하는 값이 있다면 셋팅
				request.setAttribute("dataList", dataList);
				request.setAttribute("cPage", cPage);
				request.setAttribute("totalRecord", totalRecord);
				request.setAttribute("totalPage", totalPage);
				request.setAttribute("prev", prev);
				request.setAttribute("next", next);
				request.setAttribute("pageGroup", pageGroup);
							
			}
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
			else if(action.equals("/memberInsertForm.do")) {
				// 뷰페이지 지정
				viewPage="template/tpl_memberInsertForm.jsp";
			}
			else if(action.equals("/memberInsert.do")) {
				// 전달된 값 받아서 객체 셋팅
				memberVO.setId(request.getParameter("id"));
				memberVO.setPw(request.getParameter("pw"));
				memberVO.setName(request.getParameter("name"));
				memberVO.setEmail(request.getParameter("email"));
				memberVO.setPhone(request.getParameter("phone"));
				
				// 서비스 인서트 호출 => memberService.insert()
				 memberService.insert(memberVO);
				
				
				// 뷰페이지 지정
				viewPage="/index.jsp";
			}
			else if(action.equals("/memberDelete.do")){
				// 넘어온 아이디 값 받기
				String id=request.getParameter("id");
				// 서비스 딜리트 호출 => memberService.delete()
				boolean flag=memberService.delete(id);
				// 출력 메세지
				if(flag) {
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('삭제가 성공적으로 되었습니다.');");
					out.println("location.href='/Ex19_MVC/index.jsp';");
					out.println("</script>");
					out.flush();
				}
				// 뷰페이지 지정 => alert 창 사용 시에는 주석 처리
				//viewPage="/index.jsp";
				return;
			}
			else if(action.equals("/memberUpdateForm.do")) {
				// 넘어온 아이디 값 받기
				String id=request.getParameter("id");
				// 아이디에 해당하는 수정할 레코드 한 개 가져오기 => memberService.getSelectRecord() => ~.getSelectRecordDB()
				 MemberVO record=memberService.getSelectRecord(id);
				// 뷰페이지로 전달해야 하는 값 셋팅
				request.setAttribute("record", record);
				// 뷰페이지 지정
				viewPage="template/tpl_memberUpdateForm.jsp";
			}
			else if(action.equals("/memberUpdate.do")) {
				System.out.println(memberVO); //null
				
				// 전달된 값 받아서 객체 셋팅
				memberVO.setId(request.getParameter("id"));
				memberVO.setPw(request.getParameter("pw"));
				memberVO.setName(request.getParameter("name"));
				memberVO.setEmail(request.getParameter("email"));
				memberVO.setPhone(request.getParameter("phone"));
				
				System.out.println(memberVO); //수정한 내용으로 객체 출력
				
				// 서비스 업데이트 호출 => memberService.update();
				 memberService.update(memberVO);
				
				// 뷰페이지 지정
				viewPage="/index.jsp";
			}
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
			else {
				response.getWriter().write("<h2>"+uri+"</h2> (uri 값을 확인해주세요!)");
				response.getWriter().write("<h2>"+conPath+"</h2> (conpath 값을 확인해주세요!)");
				response.getWriter().write("<h2>"+action+"</h2> (action 값을 확인해주세요!)");
			}
			
			// 뷰페이지 요청
			RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
