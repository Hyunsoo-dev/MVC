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


@WebServlet("BoardReWriteProcCon.do")
public class BoardReWriteProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		BoardBean dbean = new BoardBean();
		dbean.setWriter(request.getParameter("writer"));
		dbean.setSubject(request.getParameter("subject"));
		dbean.setEmail(request.getParameter("email"));
		dbean.setPassword(request.getParameter("password"));
		dbean.setContent(request.getParameter("content"));
		dbean.setRef(Integer.parseInt(request.getParameter("ref")));
		dbean.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dbean.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		BoardDAO ddao = new BoardDAO();
		ddao.insertReBoard(dbean);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
		dis.forward(request, response);
	}
}
