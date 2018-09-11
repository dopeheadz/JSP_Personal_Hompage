<%@ page import="com.user.userDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="userDTO" scope="request" class="com.user.userDTO"></jsp:useBean>
<jsp:setProperty name="userDTO" property="*"></jsp:setProperty>

<%
	RequestDispatcher rd = request.getRequestDispatcher("complete.jsp");

	if (userDTO.getUserID() == null || userDTO.getUserID().equals("") || userDTO.getUserPwd() == null || userDTO.getUserPwd().equals("") || userDTO.getUserPwd2() == null || userDTO.getUserPwd2().equals("") || userDTO.getUserName() == null || userDTO.getUserName().equals("") || userDTO.getUserNickName() == null || userDTO.getUserNickName().equals("")) {
		request.getSession().setAttribute("messageType", "오류 메세지");
		request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
		response.sendRedirect("register.jsp");
		return;
	} else if (!userDTO.getUserPwd().equals(userDTO.getUserPwd2())) {
		request.getSession().setAttribute("messageType", "오류 메세지");
		request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
		response.sendRedirect("register.jsp");
		return;
	}
%>
<%
	int result = new userDAO().register(userDTO.getUserID(), userDTO.getUserPwd(), userDTO.getUserName(), userDTO.getUserNickName());
//	System.out.println(userDTO.getUserID());
//	System.out.println(userDTO.getUserName());
//	System.out.println(userDTO.getUserNickName());
//	System.out.println(userDTO.getUserPwd());
	if (result == 1) {
		request.getSession().setAttribute("messageType", "성공 메세지");
		request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
		session = request.getSession(false);
		session.setAttribute("id", userDTO.getUserID());
		rd.forward(request, response);
	} else {
		request.getSession().setAttribute("messageType", "오류 메세지");
		request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
		response.sendRedirect("register.jsp");
		return;
	}
%>


<!DOCTYPE html>
<html>
<head>
	<title>Title</title>
</head>
<body>
${userDTO.userID}<br>
${userDTO.userName}<br>
${userDTO.userNickName}<br>
${userDTO.userPwd}<br>
${userDTO.userPwd2}
</body>
</html>
