<%@page import="Modelo.ListProduct"%>
<%@page import="Model.List.List_category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_fact_prod.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Sistema de Facturación</title>

    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <div class="div_centrado">
            <h1>Facturacion de producto</h1>
            <div id="div_principal">
                <div id=div_table>
                    <form action="Control_Fac_P" method="POST">
                      <jsp:useBean class="Modelo.ListProduct" id="productos" scope="session"></jsp:useBean>              
                        <table class="table" id="tablaProductos">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Categoria</th>
                                    <th scope="col">Descripción</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">I.V.A.</th>
                                    <th scope="col">Cantidad(unidades)</th>
                                    <th scope="col"></th>									
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </form>
                </div>
                <form action="Control_Facturar" method="GET">
                    <input type="submit" class="btn btn-secondary" name="btn_next" value="Total">
                </form>
                <a href="view_principal.jsp">Volver al inicio</a>
            </div>
        </div>
        <script src="js/principal.js"></script>
    </body>
</html>
