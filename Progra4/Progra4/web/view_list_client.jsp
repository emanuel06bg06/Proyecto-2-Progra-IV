<%@page import="java.util.List"%>
<%@page import="Modelo.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_list_client.css" rel="stylesheet" type="text/css"/>
        
        <title>Sistema de Facturación</title>
    </head>
    <body>
        <%@include file="encabezado.jsp" %>
        <%
            HttpSession s = request.getSession(false);
            if (s == null) {
                response.sendRedirect(String.format("mensajes.jsp?msj=%s", "No ha iniciado sesión"));
            }
        %>
        <div id="div_principal">
            <h1>Lista de clientes</h1>
            <div id="div_listC">  
                <form action="Control_Fac_C" method="GET">
                    <div id=div_table>
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Tipo de identificación</th>
                                    <th scope="col">Número de cédula</th>
                                    <th scope="col">Nombre completo</th>
                                    <th scope="col">Número de teléfono</th>
                                    <th scope="col">E-Mail</th>
                                    <th scope="col">Provincia</th>
                                    <th scope="col">Cantón</th>
                                    <th scope="col">Distrito</th>
                                    <th scope="col">Dirección</th>
                                    <th scope="row"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <jsp:useBean class="Model.List.List_Clients" id="list_clients" scope="session" ></jsp:useBean>
                                <%
                                    List<Person> l = list_clients.getClientes();
                                    for (int i = 0; i < l.size(); i++) {
                                %>
                                <tr>
                                    <%
                                        String type = "";
                                        if (l.get(i).getId_type() == 1) {
                                            type = "Físico";
                                        } else if (l.get(i).getId_type() == 2) {
                                            type = "Jurídico";
                                        }
                                    %>
                                    <td><%= type%></td>
                                    <td><%= l.get(i).getDni()%></td>
                                    <td><%= l.get(i).getName()%></td>
                                    <td><%= l.get(i).getTelephone()%></td>
                                    <td><%= l.get(i).getE_mail()%></td>
                                    <td><%= l.get(i).getLocation().getProvince()%></td>
                                    <td><%= l.get(i).getLocation().getCanton()%></td>
                                    <td><%= l.get(i).getLocation().getDistrito()%></td>
                                    <td><%= l.get(i).getLocation().getAddress()%></td>							 
                                    <td><input type="submit" name="btnAddC_<%= i%>" value="Agregar Cliente"></td>
                                </tr>						
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </form>
                <a class="boton4" href="view_principal.jsp">Volver al inicio</a>
            </div>
        </div>
    </body>
</html>
