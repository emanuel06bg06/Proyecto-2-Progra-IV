<%@page import="Modelo.ListProduct"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_fact_total.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Sistema de Facturación</title>
    </head>
    <body>
        <%
            HttpSession s = request.getSession(false);
            if (s == null) {
                response.sendRedirect(String.format("mensajes.jsp?msj=%s", "No ha iniciado sesión"));
            }
        %>
        <%@include file="encabezado.jsp" %>
        <div id="div_main_factTotal" class="div_centrado">
            <h1>Total</h1>
            <jsp:useBean class="Modelo.Factura" id="factura" scope="session" ></jsp:useBean>
                <div id="div_facT">
                    <form action="Control_Fac_T" method="POST">                    
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Tipo de identificación</th> &nbsp
                                    <th scope="col">Número de cédula</th> &nbsp
                                    <th scope="col">Nombre completo</th> &nbsp
                                    <th scope="col">Número de teléfono</th> &nbsp
                                    <th scope="col">E-Mail</th> &nbsp
                                    <th scope="col">Provincia</th> &nbsp
                                    <th scope="col">Cantón</th> &nbsp
                                    <th scope="col">Distrito</th> &nbsp
                                    <th scope="col">Dirección</th> &nbsp									
                                </tr>
                            </thead>
                            <tbody>						
                                <tr>
                                <%
                                    String type = "";
                                    if (factura.getCliente().getId_type() == 1) {
                                        type = "Físico";
                                    } else if (factura.getCliente().getId_type() == 2) {
                                        type = "Jurídico";
                                    }
                                %>
                                <td><%= type%></td>
                                <td><%= factura.getCliente().getDni()%></td> &nbsp
                                <td><%= factura.getCliente().getName()%></td> &nbsp
                                <td><%= factura.getCliente().getTelephone()%></td> &nbsp
                                <td><%= factura.getCliente().getE_mail()%></td> &nbsp
                                <td><%= factura.getCliente().getLocation().getProvince()%></td> &nbsp
                                <td><%= factura.getCliente().getLocation().getCanton()%></td> &nbsp
                                <td><%= factura.getCliente().getLocation().getDistrito()%></td> &nbsp
                                <td><%= factura.getCliente().getLocation().getAddress()%></td>	 &nbsp						 							 
                            </tr>												
                        </tbody>
                    </table>
                    <table class="table">
                        <%
                            ListProduct productos = factura.getProductos();
                        %>
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Categoria</th> &nbsp
                                <th scope="col">Detalle</th> &nbsp
                                <th scope="col">Precio</th> &nbsp							 
                                <th scope="col">I.V.A.</th> &nbsp
                                <th scope="col">Cantidad</th> &nbsp
                                <th scope="col">Total</th> &nbsp
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < productos.size(); i++) {
                            %>
                            <tr>
                                <td><%= productos.get(i).getCategory().getDescripcion()%></td>
                                <td><%= productos.get(i).getDetail()%></td>
                                <td><%= productos.get(i).getPrice()%></td>													 
                                <td><%= productos.get(i).getCategory().getIva() * 100%>%</td>
                                <td><%= productos.get(i).getCantidad()%></td>
                                <%
                                    float t = productos.get(i).getCantidad() * productos.get(i).getPrice();
                                    float iva = productos.get(i).getCategory().getIva() * t;
                                %>
                                <td><%= productos.get(i).getTotal()%></td>
                                <td>
                                    <input type="submit" class="btn btn-secondary"  name="delete_<%= i%>" value="Eliminar">
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td colspan="6" id="td_total">Total de la factura</td> &nbsp
                                <td><%= factura.getTotal()%></td> &nbsp
                            </tr>
                        </tbody>
                    </table>
                </form>

                <form action="Control_Facturar" method="GET">
                    <input type="submit" class="btn btn-secondary" name="btn_next" value="Ingresar otro producto">
                    <input type="submit" class="btn btn-secondary" name="btn_next" value="Ver PDF">
                    <input type="submit" class="btn btn-secondary" name="btn_next" value="Guardar Factura">
                </form>            
                <a href="view_principal.jsp">Volver al inicio</a>			
            </div>
        </div>
    </body>
</html>
