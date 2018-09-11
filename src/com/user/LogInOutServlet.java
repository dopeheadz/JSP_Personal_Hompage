package com.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "LogInOutServlet", urlPatterns = "/log")
public class LogInOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        String userID = request.getParameter("id");
        String userPwd = request.getParameter("pwd");
        String ck_id = request.getParameter("ck_id");

        //이전페이지 쿠키 불러오기
        Cookie[] locCk = request.getCookies();
        String location = "";
        if(locCk != null) {
            for(int i = 0; i < locCk.length; ++i) {
                String name = locCk[i].getName();
                if(name.equals("location")) {
                    location = locCk[i].getValue();
                    break;
                }
            }
        }else{
            location = "/index.jsp";
        }

        userDAO userDAO = new userDAO();
        int result = userDAO.login(userID, userPwd);
        if(result == 1){
            session.setAttribute("userID", userID);
            int userLevel = new userDAO().getUserLevel(userID);
//	        System.out.println(userLevel);
            session.setAttribute("userLevel", userLevel);
        } else if(result == 0){
            request.getSession().setAttribute("messageType", "오류 메세지");
            request.getSession().setAttribute("messageContent", "비밀번호를 확인해주세요.");
            response.sendRedirect(location);
            return;
        } else if(result == -1){
            request.getSession().setAttribute("messageType", "오류 메세지");
            request.getSession().setAttribute("messageContent", "아이디가 없습니다.");
            response.sendRedirect(location);
            return;
        } else if(result == -2){
            request.getSession().setAttribute("messageType", "오류 메세지");
            request.getSession().setAttribute("messageContent", "데이터베이스 오류가 발생했습니다.");
            response.sendRedirect(location);
            return;
        }

        // 쿠키 체크
        if(ck_id != null && ck_id.trim().equals("on")){
            Cookie ck = new Cookie("uid", userID);
            Cookie chk = new Cookie("chk", "checked");
            ck.setMaxAge(60 * 60 * 24 * 365);
            chk.setMaxAge(60 * 60 * 24 * 365);
            response.addCookie(ck);
            response.addCookie(chk);
        }else {
            Cookie uid = new Cookie("uid","");
            Cookie chk = new Cookie("chk","");
            uid.setMaxAge(0);
            chk.setMaxAge(0);
            response.addCookie(uid);
            response.addCookie(chk);
        }

//        RequestDispatcher rd = request.getRequestDispatcher("index_origin.jsp");
//        rd.forward(request,response);
        response.sendRedirect(location);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        if(session != null && session.getAttribute("userID") != null){
            session.invalidate();
            out.print("로그아웃 작업이 완료되었습니다.");
        }
        Cookie[] ck = request.getCookies();
        String location = "";
        if(ck != null) {
            for(int i = 0; i < ck.length; ++i) {
                String name = ck[i].getName();
                if(name.equals("location")) {
                    location = ck[i].getValue();
                    break;
                }
            }
        }else{
            location = "index.jsp";
        }

        response.sendRedirect(location);
    }
}
