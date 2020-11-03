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

        <title>Sistema d +e Facturación</title>
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <%
            Emisor emisor = (Emisor) request.getSession(false).getAttribute("emisor");
            if (emisor != null) {
        %>

        <h1>Bienvenido <%= emisor.getName()%> </h1>
        <% } else {
                response.sendRedirect(String.format("mensajes.jsp?msj=%s", "No ha iniciado sesión"));
            }%>
            <script src="js/principal.js"></script>
    </body>
</html >
