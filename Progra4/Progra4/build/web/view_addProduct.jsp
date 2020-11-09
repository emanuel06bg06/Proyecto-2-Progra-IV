<%@page import="Model.List.List_category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_addProduct.css" rel="stylesheet" type="text/css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

         <script src="sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 
       
        <title>Sistema de Facturación</title>
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <div class="div_centrado">
            <h1>Agregar Producto</h1>
            <div id="div_main_addP">
                <form action="" method="POST">

                    <select id="selectProductos" class="form-control">
                        <option id="option">Seleccione una categoría</option>

                    </select>
                    <label for="txt_detail"> <br>Detalle del producto:                   
                        <input type="text" id="txt_detail" class="form-control" name="detail"></label>  
                    <br>
                    <label for="txt_price">Precio: </label>
                    <input type="number" id="txt_price" class="form-control" min="1" name="price">
                    <br>
                    <input type="button" class="btn btn-secondary" id="bnt_addProduct" name="bnt_addProduct" value="Agregar Producto">
                    <a href="view_principal.jsp">Volver a la página principal</a>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/principal.js"></script>          
    </body>
</html>
