package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/HelloWorld") //HelloWorld ��� url �� ǥ�����־�� �� ���� Ŭ������ �����.
public class HelloWorld extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	//�ϰ�ó�� ��, doget �̴� dopost�� �Ʒ� reqPro �޼ҵ尡 ����ǰ� ����.
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		
		String msg = "Hello World";
		Integer m = 12;
		
		request.setAttribute("msg", msg);
		request.setAttribute("m", m);
		
		RequestDispatcher dis = request.getRequestDispatcher("HelloWorld.jsp");
		dis.forward(request, response);
	}
}
