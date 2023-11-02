package com.Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session=request.getSession();
            session.removeAttribute("userD");

            HttpSession session2=request.getSession();
            session.setAttribute("logoutMsg","Logout Successfully.");
            response.sendRedirect("login.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }

    }

}
