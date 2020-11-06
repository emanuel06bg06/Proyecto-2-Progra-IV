<%@page import="Model.List.List_category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_addProduct.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bad Script' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet'>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <title>Sistema de Facturación</title>
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <div class="div_centrado">
            <h1>Agregar Producto</h1>
            <div id="div_main_addP">
                <form action="" method="POST">
                 
                   <select id="selectProductos">
                       <option id="option">Seleccione una categoría</option>
                       
                   </select>
                    <label for="txt_detail"> <br>Detalle del producto:                   
                    <input type="text" id="txt_detail" name="detail"></label>  
                    <br>
                    <label for="txt_price">Precio: </label>
                    <input type="number" id="txt_price" min="1" name="price">
                    <br>
                    <input type="button" id="bnt_addProduct" name="bnt_addProduct" value="Agregar Producto">
                    <a href="view_principal.jsp">Volver a la página principal</a>
                </form>
            </div>
        </div>
                    <script src="js/principal.js"></script>          
    </body>
</html>
