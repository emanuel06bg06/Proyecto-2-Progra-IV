<%@page import="Modelo.Factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_list_facturas.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <title>Sistema de Facturacion</title>
    </head>
    <body>
        <%
            HttpSession s = request.getSession(false);
            if (s == null) {
                response.sendRedirect(String.format("mensajes.jsp?msj=%s", "No ha iniciado sesión"));
            }
        %>
        <%@include file="encabezado.jsp" %>
        <div id="div_main_listFac" class="div_centrado">
            <h1>Lista de facturas</h1>
            <div id="div_form">
                <jsp:useBean class="Model.List.ListFacturas" id="facturas" scope="session"></jsp:useBean>
                <div id="div_tabla">
                    <table class="table" >
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Numero de factura</th>
                                <th scope="col">Número de cédula</th>
                                <th scope="col">Nombre del cliente</th>
                                <th scope="col">PDF</th>
                                <th scope="col">XML</th>
                                

                            </tr>
                        </thead>
                        <tbody id="tabla_list_facturas" >
                            

                        </tbody>
                    </table>


                </div>
                <a href="view_principal.jsp">Volver a la página principal</a>
            </div>
        </div>
        <script src="js/principal.js"></script>   
    </body>
</html>
