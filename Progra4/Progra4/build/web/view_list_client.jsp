
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_list_client.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Sistema de Facturación</title>
        <style>
            #container{
                margin:0 auto;
                width:80%;
                overflow:auto;
            }
            table.gridtable {
                font-weight: bold ;
                margin:0 auto;
                width:95%;
                overflow:auto;
                font-family: helvetica,arial,sans-serif;
                font-size:14px;
                color:#634437;
                border-width: 1px;
                border-color: #666666;
                border-collapse: collapse;
                text-align: center;
            } 
            table.gridtable th {
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                border-color: #666666;
                color:black;
                background: #EAEAEA;
            }
            table.gridtable td {
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                border-color: #666666;
                background-color: rgba(234, 234, 234, 0.6);
            }
            tr:hover {background-color: #cc0000; color:black;font-weight: bold }

        </style>
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <div class="container" id="container">
            <form action="Control_Fac_C" method="GET">
            <table class="gridtable" id="tableMain" class="display" style="width:100%">
                <thead>
                    <tr class="tableheader">
                        <th scope="col">Tipo de identificación</th>
                        <th scope="col">Número de cédula</th>
                        <th scope="col">Nombre completo</th>
                        <th scope="col">Número de teléfono</th>
                        <th scope="col">Correo electrónico</th>
                        <th scope="col">Provincia</th>
                        <th scope="col">Cantón</th>
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