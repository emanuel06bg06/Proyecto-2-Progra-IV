<%@page import="Modelo.Emisor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Facturación</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_add_client.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <%
            Emisor emisor = (Emisor) request.getSession(false).getAttribute("emisor");
            if (emisor != null || request.getSession(false) != null) {
        %>
        <div id="div_main_addC" class="div_centrado">
            <div>    
                <h1>Agregar Cliente</h1>
            </div>
            <div id="div_form_add_cliente">
                <form action="" method="POST">
                    <div class="form-control">
                        <span>

                            <label for="input_dni" > Tipo de Cedula</label>
                            <select id="select_tipoId"  class="form-control" name="type_id" value="Tipo de identificación" >
                                <option value="1">Física</option>
                                <option value="2">Jurídica</option>
                            </select>
                        </span>
                        <span>
                            <label for="input_dni" >Número de cédula</label>
                            <input id="input_dni" class="form-control"  type="text" name="dni" placeholder="Ingrese el número de cédula">
                        </span>
                    </div>
                    <div>
                        <label for="input_nom" >Nombre completo</label>
                        <input id="input_nom" class="form-control"type="text" name="name" placeholder="Ingrese el nombre completo">
                        <label for="input_tel" >Número de teléfono</label>
                        <input id="input_tel" class="form-control" type="tel" name="num_tel" placeholder="Ingrese el número de teléfono">
                    </div>
                    <div>
                        <label for="input_email"  >Correo electrónico</label>
                        <input id="input_email" class="form-control"   type="email" name="mail" placeholder="Ingrese el correo electrónico">
                        <label for="input_province"  >Provincia</label>
                        <input id="input_province"class="form-control"  type="text" name="province" placeholder="Provincia">
                    </div>
                    <div>
                        <label for="input_canton"  >Cantón</label>
                        <input id="input_canton" class="form-control"  type="text" name="canton" placeholder="Cantón">
                        <label for="input_dist"  >Distrito</label>
                        <input id="input_dist" class="form-control"   type="text" name="district" placeholder="Distrito">	
                    </div>
                    <div>
                        <label for="input_dir"  >Dirección</label>
                        <input id="input_dir" class="form-control"   type="text" name="address" placeholder="Direccion (Opcional)">  
                    </div>
                    <div>
                        <input id="Agregar" type="button" class="btn btn-secondary" value="Agregar">                    
                        <a href="view_principal.jsp">Volver a la página principal</a>
                    </div>
                    <% } else {
                            response.sendRedirect(String.format("mensajes.jsp?msj=%s", "Perfil sin datos. No se pudo cargar su perfil"));
                        }
                    %>
                </form>
            </div>
        </div> <script src="js/principal.js"></script>

    </body>
</html>
