<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Facturación</title>        
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
          <link rel="shortcut icon" href="#">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div id="div_index">
            <form method="POST" action="" >
                <div class="div_inputs"> 
                    <label for="input_idUser" id="label_user"> Usuario</label>
                    <input id="input_idUser" name="input_idUser"type="text"placeholder="Digite su usuario">
                </div>
                <div class="div_inputs">
                    <label for="input_password"> Contraseña</label>
                    <input id="input_password" name="input_password"type="password" placeholder="Digite su contraseña">
                </div>
                <div class="div_inputs">                    
                    <input id="boton" type="button" value="Aceptar" style="margin-bottom: 15px">
                    <a href="view_singin.jsp">Registrarse</a>    
                   
                </div>          
            </form>
        </div>
         <script src= "js/principal.js"></script>
    </body>
</html>