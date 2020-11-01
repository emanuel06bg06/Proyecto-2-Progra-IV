<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
        <title>Administracion</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
    <body>        
        <h1>Administrador</h1>
        <form action="Control_Admin" method="POST">
            <input type="submit" name="option" value="Ver Usuarios">
            <input type="submit" name="option" value="Logout">
        </form>
        <script src= "js/principal.js"></script>


    </body>
</html>
