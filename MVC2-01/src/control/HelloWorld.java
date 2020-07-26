package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/HelloWorld") //HelloWorld 라고 url 에 표시해주어야 이 서블릿 클래스가 실행됨.
public class HelloWorld extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	//일괄처리 즉, doget 이던 dopost던 아래 reqPro 메소드가 실행되게 해줌.
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		
		String msg = "Hello World";
		Integer m = 12;
		
		request.setAttribute("msg", msg);
		request.setAttribute("m", m);
		
		RequestDispatcher dis = request.getRequestDispatcher("HelloWorld.jsp");
		dis.forward(request, response);
	}
}
