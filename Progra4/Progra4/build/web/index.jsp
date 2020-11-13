<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Facturación</title>        
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
      
        <link rel="stylesheet" href="sweetalert2.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>      
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
          <script src="sweetalert2.min.js"></script>
    </head>
    <body>
        <div class="header">
            <a  class="logo">Sistema de Facturacion</a>

        </div>
        <div id="div_index">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="Control_Login" method="post">
                                <h3 class="text-center" style=color:#555;>Inicio de Sesion</h3>
                                <div class="form-group">
                                    <label for="input_idUser">Nombre de Usuario:</label><br>
                                    <input type="text" name="input_idUser" id="input_idUser" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="input_password">Contraseña:</label><br>
                                    <input type="password" name="input_password" id="input_password" class="form-control">
                                </div>

                                <div class="form-group">                    
                                    <input id="boton" class="btn btn-secondary"  type="button" value="Aceptar" style="margin-bottom: 15px">
                                    <a href="view_singin.jsp">Registrarse</a>    

                                </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        <script src= "js/principal.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </body>

</html>
