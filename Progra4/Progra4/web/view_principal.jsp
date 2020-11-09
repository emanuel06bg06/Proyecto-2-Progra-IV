<%@page import="Modelo.Emisor"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
    <head>     
          <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_principal.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <title>Sistema de Facturación</title>
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <%
            Emisor emisor = (Emisor) request.getSession(false).getAttribute("emisor");
            if (emisor != null) {
        %>

        <h1 id="Bienvenido">Bienvenido </h1>
        <% } else {
                response.sendRedirect(String.format("mensajes.jsp?msj=%s", "No ha iniciado sesión"));
            }%>
          <script src="js/principal.js"></script>
                  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 
   
    </body>
</html >
