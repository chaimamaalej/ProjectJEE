package com.Servlet;

import com.DAO.PostDAO;
import com.Db.DBConnect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NoteEditServlet", value = "/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            Integer noteid=Integer.parseInt(request.getParameter("noteid"));
            String Title=request.getParameter("title");
            String Content=request.getParameter("content");

            PostDAO dao=new PostDAO(DBConnect.getConn());
            boolean f=dao.PostUpdate(noteid,Title,Content);

            if(f){
                System.out.println("data update successfully.");
                HttpSession session=request.getSession();
                session.setAttribute("updateMsg","Notes Updated Successfully.");
                response.sendRedirect("showNotes.jsp");
            }
            else{
                System.out.println("data not updated.");

            }
        }catch(Exception e){
            e.printStackTrace();

        }

    }
}
