/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

console.log("activo!!!!!");
//LOGIN
$("#boton").click(
        function login() {
            Ubication = {idUbication: 0, province: "", canton: "", distrito: "", address: ""};
            User = {user: $("#input_idUser").val(), pass: $("#input_password").val(), status: 1, rol: 1};
            Emisor = {tradename: "", User, products: "", dni: "", name: "", telephone: ""
                , e_mail: "", id_type: "", Ubication};
            $.ajax({type: "POST", url: "Control_Login", data: JSON.stringify(User),
                contentType: "application/json"}).then((emisor) =>
            {
                Emisor = JSON.parse(JSON.stringify(emisor));
                validacionesLogin(Emisor);
            },
                    (error) => {
                alert(errorMessage(error.status));
            });
        }
);

//REGISTRAR PRODUCTO
$("#bnt_addProduct").click(
        function agregarProducto() {

            d = $("#selectProductos option:selected").text();
            x = $("#selectProductos option:selected").val();
            Auxiliar = {id: 0, detail: $("#txt_detail").val(), price: $("#txt_price").val(), iva: x, descripcion: d};
            console.log(Auxiliar);
            $.ajax({type: "POST", url: "Control_AddProduct", data: JSON.stringify(Auxiliar),
                contentType: "application/json"}).then((p) =>
            {
                //Auxiliar = JSON.parse(JSON.stringify(a));
                console.log(p);

            },
                    (error) => {
                alert(errorMessage(error.status));
            });

        }
);
function validacionesLogin(Emisor)
{
    var s, r, u, p = 0;


    u = $("#input_idUser").val();
    p = $("#input_password").val();

    if (u === "" || p === "")
    {
        alert("rellene los campos");
    } else
    //usuario inexistente
    if (Emisor.user === undefined)
    {
        alert("El usuario solicitado no existe verifique su clave o contraseña");
    } else
    if (Emisor !== undefined)
    {
        if (Emisor.user.user === "adm" && Emisor.dni === "adm")
        {
            Emisor.user.rol = 0;
            Emisor.user.status = 1;

        }
        r = Emisor.user.rol;
        s = Emisor.user.status;
        //caso usuario administrador
        if (s === 1 && r === 0)
        {
            $(window).attr('location', 'view_admin.jsp');
        } else
        //caso usuario normal
        // verificar que sea adm


        if (r === 1)
        {//caso usuario normal sin habilitar
            if (s === 0)
            {
                alert("El usuario solicitado debe ser habilitado");
            } else
            {
                $(window).attr('location', 'view_principal.jsp');
            }
        }
    }
}

$("#logout").click(
        function logout() {


            $.ajax({type: "POST", url: "Control_Admin"}).then(() =>
            {
                $(window).attr('location', 'index.jsp');
            }
            );
        }
);

$("#UsuariosAdm").click(
        function verUsuarios() {
            X = {descripcion: "OK", iva: 0};

            $.ajax({type: "POST", url: "Control_Admin_Ver_Usuarios",
                data: JSON.stringify(X),
                // lo que devuelve el servlet
                contentType: "application/json"}
            ).then((c) =>
            {
                console.log(X);
                X = JSON.parse(JSON.stringify(c));
                console.log(X);
                $(window).attr('location', 'view_users.jsp');
            }
            );
        }
);

function errorMessage(status) {
    switch (status) {
        case 404:
            return "Registro no encontrado";
        case 403:
        case 405:
            return "Usuario no autorizado";
        case 406:
            return "Registro duplicado";
        default:
            return "Error: " + status;
    }
}

var cargarListaProductos = (function () {
    lista_productos = {descripcion: "",
        iva: 0.13};
    $.ajax({type: "POST", url: "Control_Productos"}).then((lista) =>
    {
        lista_productos = JSON.parse(JSON.stringify(lista));

        for (var item in lista_productos) {
            optionText = lista_productos[item].descripcion;
            optionValue = lista_productos[item].iva;
            //console.log(optionValue);
            $('#selectProductos').append($('<option>').val(optionValue).text(optionText));
        }
    },
            (error) => {
        alert(errorMessage(error.status));
    });
}());
