<%-- 
    Document   : indexEmp
    Created on : 6/07/2020, 03:33:24 PM
    Author     : uriel
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario;
            String nivel;
            
            if (sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null) {
                usuario=sesion.getAttribute("user").toString();
                nivel=sesion.getAttribute("nivel").toString();
                out.print("<a href='login.jsp?cerrar=true'><h5>Cerrar Sesion "+usuario+"</h5></a>");
            

        %>
        <h1>Bienvenido empleado <%=usuario%></h1>
        <%
            }else{
                out.print("<script>location.replace('login.jsp');</script>");
            }
        %>
    </body>
</html>
