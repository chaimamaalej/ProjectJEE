<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 10/12/2022
  Time: 20:06
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
    <title>Add Notes</title>
    <%@include file="all_component/allcss.jsp" %>
</head>
<body>
<div class="container-fluid">
    <%@include file="all_component/navbar.jsp" %>

    <h1 class="text-center">Add Your Notes</h1>

    <div class="container">
    <div class="row">
        <div class="col-md-12 ">
            <form action="AddNotesServlet" method="post">
                <div class="form-group">

                    <%
                      UserDetails us=(UserDetails)session.getAttribute("userD");
                      if(us!=null){%>
                    <input type="hidden" value="<%=us.getId()%>" name="uid">
                      <%}
                    %>

                    <label for="exampleInputEmail1">Enter Title</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required="required">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Enter Content</label>
                   <textarea rows="9" cols="" class="form-control" name="content" required="required"></textarea>

                </div>
                <div class="container text-center">
                <button type="submit" class="btn btn-primary">Add Notes</button>
                </div>
            </form>
        </div>
    </div>
    </div>

</div>
</body>
</html>
