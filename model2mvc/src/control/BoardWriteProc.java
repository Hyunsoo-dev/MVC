package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardWriteProc.do")
public class BoardWriteProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}

	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		BoardBean dbean = new BoardBean();
		dbean.setWriter(request.getParameter("writer"));
		dbean.setEmail(request.getParameter("email"));
		dbean.setSubject(request.getParameter("subject"));
		dbean.setPassword(request.getParameter("password"));
		dbean.setContent(request.getParameter("content"));
		
		BoardDAO ddao = new BoardDAO();
		ddao.insertBoard(dbean);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
		dis.forward(request, response);
	}

}
