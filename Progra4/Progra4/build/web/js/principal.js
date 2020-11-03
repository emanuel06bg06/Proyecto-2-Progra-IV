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
                console.log(Emisor);
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

            var categoria = $("#categoria").val();
            //numeroCategoria=5;
            Categoria = {descripcion: "", iva: 0};
            Producto = {id: 5, detail: $("#txt_detail").val(), price: $("#txt_price").val(), Categoria};


            $.ajax({type: "POST", url: "Control_AddProduct", data: JSON.stringify(Producto),
                // lo que devuelve el servlet
                contentType: "application/json"}).then((producto) =>
            {
                Producto = JSON.parse(JSON.stringify(producto));
                alert(Producto.detail);
                // validacionesEspacios en blanco;


            },
                    (error) => {
                alert(errorMessage(error.status));
            });
        }
);
function validacionesLogin(Emisor)
{
    let u = $("#input_idUser").val();
    let p = $("#input_password").val();
    let d = Emisor.dni;
    if (u === null || u === "" || p === null || p === "" || Emisor === null || d === undefined)
    {
        alert("Usuario o contraseña incorrectos");
    } else
    if (u === "adm" && p === "adm")
    {
        alert("Usuario :" + u);
        $(window).attr('location', 'view_admin.jsp');
    } else
    if (d !== undefined)
    {
        alert(d);
        $(window).attr('location', 'view_principal.jsp');
    }
}

$("#logout").click(
        function logout() {
          X = {descripcion: "OK", iva: 0};
          
            $.ajax({type: "POST", url:"Control_Admin",
                data: JSON.stringify(X),
                // lo que devuelve el servlet
                contentType: "application/json"}
               ).then((c) =>
            {
                X  = JSON.parse(JSON.stringify(c));
                console.log(X);
                $(window).attr('location', 'index.jsp');
           }
                 );
        }
);

$("#UsuariosAdm").click(
        function verUsuarios() {
          X = {descripcion: "OK", iva: 0};
          
            $.ajax({type: "POST", url:"Control_Admin_Ver_Usuarios",
                data: JSON.stringify(X),
                // lo que devuelve el servlet
                contentType: "application/json"}
               ).then((c) =>
            {
                console.log(X);
                X  = JSON.parse(JSON.stringify(c));
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
function cargarProductos()
{
    //retorna la lista seleccionable con los productos cargados desde la base
}