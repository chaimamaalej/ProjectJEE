package com.Servlet;

import com.DAO.PostDAO;
import com.Db.DBConnect;
import com.User.Post;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.User.UserDetails;
import com.Db.DBConnect;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddNotesServlet", value = "/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       String title=request.getParameter("title");
       String content=request.getParameter("content");
       int uid = Integer.parseInt(request.getParameter("uid"));


       PostDAO dao=new PostDAO(DBConnect.getConn());
       boolean f=dao.AddNotes(title,content,uid);

       if(f){
           System.out.println("data insert successfully");
           response.sendRedirect("showNotes.jsp");
       }else{
           System.out.println("data not inserted");
       }




    }
}
