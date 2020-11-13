
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_list_client.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Sistema de Facturaci�n</title>
        <style>
       
            tr:hover {background-color: #6c757d; color:black;font-weight: bold }

        </style>
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <div class="container" id="container">
            <form action="Control_Fac_C" method="GET">
                <table class="table" id="tableMain"  >
                    <thead  class="thead-dark" >
                        <tr >
                            <th scope="col">Tipo de identificaci�n</th>
                            <th scope="col">N�mero de c�dula</th>
                            <th scope="col">Nombre completo</th>
                            <th scope="col">N�mero de tel�fono</th>
                            <th scope="col">Correo electr�nico</th>
                            <th scope="col">Provincia</th>
                            <th scope="col">Cant�n</th>
                            <th scope="col">Distrito</th>
                            <th scope="col">Direccion</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </form>
        </div>
        <script src="js/principal.js"></script>
    </body>
</html>