<%@ page import="com.DAO.PostDAO" %>
<%@ page import="com.Db.DBConnect" %>
<%@ page import="com.User.Post" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/12/2022
  Time: 01:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDetails user1=(UserDetails)session.getAttribute("userD");

    if(user1==null){
        response.sendRedirect("login.jsp");
        session.setAttribute("Login-error","Please Login!");

    }
%>
<html>
<head>
    <title>Edit Notes</title>
    <%@include file="all_component/allcss.jsp" %>
</head>
<body>

<%
   Integer noteid=Integer.parseInt(request.getParameter("note_id")) ;
   PostDAO post=new PostDAO(DBConnect.getConn());
   Post p=post.getDataById(noteid);
%>
<div class="container-fluid">
    <%@include file="all_component/navbar.jsp" %>

    <h1 class="text-center">Edit Your Notes</h1>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form action="NoteEditServlet" method="post">
                    <input type="hidden" value="<%=noteid %>" name="noteid">


                    <div class="form-group">



                        <label for="exampleInputEmail1">Enter Title</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle() %>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Enter Content</label>
                        <textarea rows="9" cols="" class="form-control" name="content" required="required"><%= p.getContent()%></textarea>

                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary">Add Notes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
