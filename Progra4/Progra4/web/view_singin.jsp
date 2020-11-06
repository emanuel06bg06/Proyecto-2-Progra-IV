<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Registro al Sistema</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/view_singin.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="div_centrado">
            <h1>Registro</h1>
            <div class="form-group">
                <form action="Control_Signin" method="POST">                                                            
                    <label for="select_tipoId" >Tipo de identificación</label>
                    <select id="select_tipoId" name="type_id" value="Tipo de identificación" class="form-control">
                        <option value="1">Física</option>
                        <option value="2">Jurídica</option>
                    </select>
                    <label for="input_dni" >Número de cédula</label>
                    <input id="input_dni" class="form-control" type="text" name="dni" placeholder="Ingrese el número de cédula">                        

                    <label for="input_nom" >Nombre completo</label>
                    <input id="input_nom" class="form-control" type="text" name="name" placeholder="Ingrese el nombre completo">
                    <label for="input_tel" >Número de teléfono</label>
                    <input id="input_tel" class="form-control" type="tel" name="num_tel" placeholder="Ingrese el número de teléfono">

                    <label for="input_email"  >Correo electrónico</label>
                    <input id="input_email" class="form-control"  type="email" name="mail" placeholder="Ingrese el correo electrónico">
                    <label for="input_province"  >Provincia</label>
                    <input id="input_province" class="form-control" type="text" name="province" placeholder="Provincia">

                    <label for="input_canton"  >Cantón</label>
                    <input id="input_canton" class="form-control"  type="text" name="canton" placeholder="Cantón">
                    <label for="input_dist"  >Distrito</label>
                    <input id="input_dist" class="form-control"  type="text" name="district" placeholder="Distrito">	                   
                    <label for="input_dir" >Dirección</label>
                    <input id="input_dir" class="form-control"  type="text" name="address" placeholder="Direccion (Opcional)">  
                    <label for="tradename"  >Nombre del negocio</label>
                    <input type="text" id="tradename" class="form-control"  name="tradename" placeholder="Ingrese el nombre de su negocio">
                    <label for="user"  >Nombre de usuario</label>
                    <input type="text" id="user" name="user" class="form-control"  placeholder="Ingrese un nombre de usuario">
                    <label for="pass"  >Contraseña</label>
                    <input type="text" class="form-control"  name="pass" placeholder="Ingrese una contraseña">
                    <input type="submit" class="btn btn-primary" value="Registrarse">
                    <a class="btn btn-link"  href="index.jsp">Volver al inicio</a>                    
            </div>


        </form>
    </div>

</body>
</html>

