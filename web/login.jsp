<%-- 
    Document   : login
    Created on : 6/07/2020, 03:34:25 PM
    Author     : uriel
--%>

<%@page import="modelado.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <br><br>
        <form action="login.jsp" method="POST">
            Usuario:<input type="text" name="txtUsuario"><br><br>
            Contraseña:<input type="text" name="txtContra"><br><br>
            <input type="submit" value="Ingresar" name="btnIngresar">
        </form>
        
        <%
            Operaciones op=new Operaciones();
            if(request.getParameter("btnIngresar")!=null){
                String nombre=request.getParameter("txtUsuario");
                String contra=request.getParameter("txtContra");
                HttpSession sesion=request.getSession();
                
                switch(op.loguear(nombre, contra)){
                    
                    case 1:
                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "1");
                        response.sendRedirect("indexUser.jsp");
                        break;
                    case 2:
                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "2");
                        response.sendRedirect("indexEmp.jsp");
                        break;
                    case 3:
                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "3");
                        response.sendRedirect("indexMain.jsp");
                        break;
                    default:
                        out.write("Usuario o contraseña invalidos");
                        break;
                    
                }
            }
            
            if(request.getParameter("cerrar")!=null){
                session.invalidate();
            }

        %>
    </body>
</html>
