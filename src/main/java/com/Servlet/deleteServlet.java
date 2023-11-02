package com.Servlet;

import com.DAO.PostDAO;
import com.Db.DBConnect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "deleteServlet", value = "/deleteServlet")
public class deleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer noteid=Integer.parseInt(request.getParameter("note_id"));
        PostDAO dao=new PostDAO(DBConnect.getConn());

        boolean f=dao.DeleteNotes(noteid);
        HttpSession session=null;

        if(f){
            session=request.getSession();
            session.setAttribute("updateMsg","Notes Deleted Successfully.");
            response.sendRedirect("showNotes.jsp");

        }
        else{
            session=request.getSession();
            session.setAttribute("wrongMsg","Something went wrong on server");
            response.sendRedirect("showNotes.jsp");

        }

    }
}
