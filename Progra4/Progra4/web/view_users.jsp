<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
           <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>   
        <title>Sistema de Facturacion</title>
    </head>
    <body>
        <div>
            <h1>Lista de Proveedores</h1>
            <a href="view_admin.jsp" class="label label-default">Página Principal</a>
        </div>
        <jsp:useBean class="Model.List.List_Users" id="usuarios" scope="session"></jsp:useBean>
            <form action="Control_Admin_User" method="GET">
                <table class="table" >
                   <thead class="thead-dark">
                        <tr>
                            <th scope="col">Nombre de Usuario</th>
                            <th scope="col">Estado</th>
                            <th scope="col" ></th>
                            <th scope="col"></th>									
                        </tr>
                    </thead>
                <%
                    for (int i = 0; i < usuarios.getUsuarios().size(); i++) {
                %>												
                <tbody>
                    <tr>
                        <%
                            String status = null;
                            if (usuarios.getUsuarios().get(i).getStatus() == 1) {
                                status = "Habilitado";
                            } else {
                                status = "Deshabilitado";
                            }
                        %>
                        <td><%= usuarios.getUsuarios().get(i).getUser()%></td>
                        <td><%= status%></td>
                        <td><input type="submit" class="btn btn-secondary" name="btnUser_<%= i%>" value="Habilitar"></td>
                        <td><input type="submit" class="btn btn-secondary" name="btnUser_<%= i%>" value="Deshabilitar"></td>									
                    </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
