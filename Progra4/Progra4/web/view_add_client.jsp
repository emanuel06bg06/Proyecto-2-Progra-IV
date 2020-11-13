<%@page import="Modelo.Emisor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Facturación</title>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_add_client.css" rel="stylesheet" type="text/css"/>
        <script src="sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
                    <div class="form-group">
                        <span>

                            <label for="select_tipoId" Tipo de identificación</label>
                            <select id="select_tipoId"  class="form-control" name="type_id" value="Tipo de identificación" required>
                                <option value="1">Física</option>
                                <option value="2">Jurídica</option>
                            </select>
                        </span>
                        <span>
                            <label for="input_dni" >Número de cédula</label>
                            <input id="input_dni" class="form-control" type="text" name="dni" placeholder="Ingrese el número de cédula" required>
                        </span>
                    </div>
                    <div>
                        <label for="input_nom" >Nombre completo</label>
                        <input id="input_nom" class="form-control" type="text" name="name" placeholder="Ingrese el nombre completo" required>
                        <label for="input_tel">Número de teléfono</label>
                        <input id="input_tel" class="form-control" type="tel" name="num_tel" placeholder="Ingrese el número de teléfono" required>
                    </div>
                    <div>
                        <label for="input_email" >Correo electrónico</label>
                        <input id="input_email" class="form-control"  type="email" name="mail" placeholder="Ingrese el correo electrónico" required>
                        <label for="input_province" >Provincia</label>
                        <input id="input_province" class="form-control" type="text" name="province" placeholder="Provincia" required>
                    </div>
                    <div>
                        <label for="input_canton"  >Cantón</label>
                        <input id="input_canton"class="form-control"  type="text" name="canton" placeholder="Cantón" required>
                        <label for="input_dist"  >Distrito</label>
                        <input id="input_dist" class="form-control"  type="text" name="district" placeholder="Distrito" required>	
                    </div>
                    <div>
                        <label for="input_dir"  >Dirección</label>
                        <input id="input_dir" class="form-control"  type="text" name="address" placeholder="Direccion (Opcional)" required>  
                    </div>
                    <div>
                        <input type="submit" class="btn btn-secondary" value="Agregar" id="btn-add-client" >                    
                        <a href="view_principal.jsp">Volver a la página principal</a>
                    </div>
                    <% } else {
                            response.sendRedirect(String.format("mensajes.jsp?msj=%s", "Perfil sin datos. No se pudo cargar su perfil"));
                        }
                    %>
                </form>
            </div>
        </div>
        <script src="js/principal.js"></script>   
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 

    </body>
</html>
