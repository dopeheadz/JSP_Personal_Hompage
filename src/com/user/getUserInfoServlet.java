package com.user;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "getUserInfoServlet", urlPatterns = "/getUserInfo")
public class getUserInfoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userID");
//		response.getWriter().write(new userDAO().userInfo(userID)+"");
		userDTO dto = new userDAO().userInfo(userID);
		Gson gson = new Gson();
		String data = gson.toJson(dto);
		response.getWriter().write(data);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
