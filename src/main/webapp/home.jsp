<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    UserDetails user2=(UserDetails)session.getAttribute("userD");

    if(user2==null){
        response.sendRedirect("login.jsp");
        session.setAttribute("Login-error","Please Login!");

    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
    <%@include file="all_component/allcss.jsp"%>
</head>
<body>

<div class="container-fluid">
    <%@include file="all_component/navbar.jsp"%>
<div class="card py-3">
    <div class="card-body text-center">
        <img alt="" src="img/pen.png" class="img-fluid mx-auto" style="max-width: 300px;">
        <h1>Start taking your notes</h1>
        <a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>

    </div>
</div>
</div>
</body>
</html>