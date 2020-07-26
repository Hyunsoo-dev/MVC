package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;


@WebServlet("/Mproc2")
public class MemberJoinProc2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}
	
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberBean rbean = new MemberBean();
		rbean.setId(request.getParameter("id"));
		rbean.setPassword(request.getParameter("password"));
		rbean.setEmail(request.getParameter("email"));
		rbean.setTel(request.getParameter("tel"));
		rbean.setAddress(request.getParameter("address"));
		
		request.setAttribute("rbean", rbean);
		
		RequestDispatcher dis = request.getRequestDispatcher("MemberView.jsp");
		dis.forward(request, response);
		
	}
}
