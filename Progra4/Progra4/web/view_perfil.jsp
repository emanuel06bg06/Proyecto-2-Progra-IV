<%@page import="Modelo.Emisor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Facturación</title>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_perfil.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Bad Script' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet'> 
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <div class="div_centrado">
            <h1>Perfil</h1>
            <div id="div_principal_perfil">
                <form action="" method="POST">
                    <%
                        Emisor emisor = (Emisor) request.getSession(false).getAttribute("emisor");
                        if (emisor != null) {
                    %>

                    <label for="input_dni">Cédula</label>                
                    <input id="Perfilinput_dni" type="text" name="dni"  value="" readonly>
                    <label for="input_nom">Nombre</label>
                    <input id="Perfilinput_nom" type="text" name="name" placeholder="Ingrese su nombre completo" value="">
                    <br>
                    <label for="input_tel">Teléfono</label>
                    <input id="Perfilinput_tel" type="tel" name="num_tel" placeholder="Ingrese su número de teléfono" value="">
                    <label for="input_email">E-Mail</label>                
                    <input id="Perfilinput_email" type="email" name="mail" placeholder="Ingrese su correo electrónico" value="">
                    <br>
                    <label for="input_negocio">Nombre del negocio</label>
                    <input id="Perfilinput_negocio" type="text"  name="tradename" placeholder="Ingrese el nombre de su negocio" value="">
                    <label for="input_province">Provincia</label>
                    <input id="Perfilinput_province" type="text" name="province" placeholder="Provincia" value="">
                    <br>
                    <label for="input_canton">Cantón</label>
                    <input id="Perfilinput_canton" type="text" name="canton" placeholder="Cantón" value="">
                    <label for="input_dist">Distrito</label>
                    <input id="Perfilinput_dist" type="text" name="district" placeholder="Distrito" value="">
                    <br>
                    <label for="input_dir">Dirección</label>                    
                    <input id="Perfilinput_dir" type="text" name="address" placeholder="Dirección" >                
                    <input  id="bnt_editPerfil"type="button" name="btn_updtPerfil" value="Actualizar Datos">
                    <% } else {
                            response.sendRedirect(String.format("mensajes.jsp?msj=%s", "Perfil sin datos. No se pudo cargar su perfil"));
                        }
                    %>
                </form>
                <a id="link_principal" href="view_principal.jsp">Ir a la ventana principal</a>
            </div>
        </div>
                <script src="js/principal.js"></script>
    </body>
</html>
