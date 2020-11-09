/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

console.log("activo!!!!!");
var Emisor = JSON.parse(localStorage.getItem('user'));
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
                localStorage.setItem('user', JSON.stringify(emisor));

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

            $.ajax({type: "POST", url: "Control_AddProduct", data: JSON.stringify(Auxiliar),
                contentType: "application/json"}).then((p) =>
            {
                Auxiliar = JSON.parse(JSON.stringify(p));

                //alert("Agregado el producto : " + Auxiliar.detail);
                Swal.fire({

                    icon: 'success',
                    title: '"Agregado el producto :  ' + Auxiliar.detail,

                    timer: 2500
                })
            },
                    (error) => {
                alert(errorMessage(error.status));
            });

        }
);

$("#bnt_editPerfil").click(
        function editarPerfil() {
            d = $("#selectProductos option:selected").text();
            x = $("#selectProductos option:selected").val();
            console.log(Emisor);
            dni = $('#Perfilinput_dni').val();
            name = $('#Perfilinput_nom').val();
            tel = $('#Perfilinput_tel').val();
            email = $('#Perfilinput_email').val();
            trade = $('#Perfilinput_negocio').val();
            province = $('#Perfilinput_province').val();
            canton = $('#Perfilinput_canton').val();
            distrito = $('#Perfilinput_dist').val();
            address = $('#Perfilinput_dir').val();
            us = Emisor.user.user;
            AuxiliarEmisor = {
                type_id: 1,
                num_id: dni,
                name_full: name,
                num_tel: tel,
                mail: email,
                tradename: trade,
                user: us,
                pass: "",
                prov: province,
                cant: canton,
                dist: distrito,
                ad: address
            };
            console.log(AuxiliarEmisor);

              $.ajax({type: "POST", url: "Control_Perfil", data: JSON.stringify(AuxiliarEmisor),
             contentType: "application/json"}).then((emisor) =>
             {
            AuxiliarEmisor = JSON.parse(JSON.stringify(emisor));
            localStorage.setItem('user', JSON.stringify(emisor));
            Emisor = JSON.parse(localStorage.getItem('user'));
             console.log(emisor);
             alert("Modificaciones guardadas con exito");
            
             
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
        //alert("El usuario solicitado no existe verifique su clave o contraseña");

        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'El usuario solicitado no existe verifique su clave o contraseña',

        })
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
                // alert("El usuario solicitado debe ser habilitado");
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'El usuario solicitado debe ser habilitado',

                })
            } else
            {
                Swal.fire({
                    icon: 'success',
                    title: 'Logueo',
                    text: 'existo',
                    timer: 1500
                })


                $(window).attr('location', 'view_principal.jsp');
                $

            }
        }
    }
}

$("#logout").click(
        function logout() {


            $.ajax({type: "POST", url: "Control_Admin"}).then(() =>
            {
                localStorage.clear();
                $(window).attr('location', 'index.jsp');
            }
            );
        }
);

$("#UsuariosAdm").click(
        function verUsuarios() {
            X = {descripcion: "", iva: 0};

            $.ajax({type: "POST", url: "Control_Admin_Ver_Usuarios",
                data: JSON.stringify(X),
                // lo que devuelve el servlet
                contentType: "application/json"}
            ).then((c) =>
            {

                X = JSON.parse(JSON.stringify(c));

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

            $('#selectProductos').append($('<option>').val(optionValue).text(optionText));
        }
    },
            (error) => {
        alert(errorMessage(error.status));
    });
}());

$("#Registrarse").click(
        function registrarse() {
            t = $("#select_tipoId option:selected").val();
            nid = $("#input_dni").val();
            nfull = $("#input_nom").val();
            ntel = $("#input_tel").val();
            m = $("#input_email").val();
            tname = $("#tradename").val();
            u = $("#user").val();
            ps = $("#password").val();
            pnce = $("#input_province").val();
            cntn = $("#input_canton").val();
            dct = $("#input_dist").val();
            ads = $("#input_dir").val();
            AuxiliarEmisor = {
                type_id: t,
                num_id: nid,
                name_full: nfull,
                num_tel: ntel,
                mail: m,
                tradename: tname,
                user: u,
                pass: ps,
                province: pnce,
                canton: cntn,
                district: dct,
                address: ads
            };

            $.ajax({type: "POST", url: "Control_Signin",
                data: JSON.stringify(AuxiliarEmisor),
                contentType: "application/json"}
            ).then((a) =>
            {
                AuxiliarEmisor = JSON.parse(JSON.stringify(a));

                alert("Registro Exitoso de " + AuxiliarEmisor.name_full + ". Gracias por preferirnos");

            }
            );

        }
);

//btn-add-client
$("#btn-add-client").click(
        function addClient() {
            t = $("#select_tipoId option:selected").val();
            nid = $("#input_dni").val();
            nfull = $("#input_nom").val();
            ntel = $("#input_tel").val();
            m = $("#input_email").val();
            tname = $("#tradename").val();
            u = $("#user").val();
            ps = $("#password").val();
            pnce = $("#input_province").val();
            cntn = $("#input_canton").val();
            dct = $("#input_dist").val();
            ads = $("#input_dir").val();
            AuxiliarEmisor = {
                type_id: t,
                num_id: nid,
                name_full: nfull,
                num_tel: ntel,
                mail: m,
                tradename: tname,
                user: u,
                pass: ps,
                province: pnce,
                canton: cntn,
                district: dct,
                address: ads
            };

            $.ajax({type: "POST", url: "Control_AddClient",
                data: JSON.stringify(AuxiliarEmisor),
                contentType: "application/json"}
            ).then((a) =>
            {
                // AuxiliarEmisor = JSON.parse(JSON.stringify(a));

                alert("Registro Exitoso de " + AuxiliarEmisor.name_full + ". Gracias por preferirnos");

            }
            );
            ;

        }
);
/*
 var logueado = (function () {
 
 var AuxiliarEmisor = {type_id: 1, num_id: "", name_full: "", num_tel: "", mail: "", tradename: "", user: $("#input_idUser").val(), pass: "", province: "", canton: "", district: "", address: ""
 };
 Ubication = {idUbication: 0, province: "", canton: "", distrito: "", address: ""};
 User = {user: $("#input_idUser").val(), pass: $("#input_password").val(), status: 1, rol: 1};
 Emisor = {tradename: "", User, products: "", dni: "", name: "", telephone: ""
 , e_mail: "", id_type: "", Ubication};
 $.ajax({type: "POST", url: "Control_Logueado",
 data: JSON.stringify(AuxiliarEmisor),
 contentType: "application/json"}
 ).then((emisor) =>
 {
 
 }
 
 );
 }());
 */
var cargarPerfilUsuario = (function () {
    if (Emisor) {
        $('#Bienvenido').append($('<H1>').val(Emisor.name).text(Emisor.name));
        $('#Perfilinput_dni').val(Emisor.dni);
        $('#Perfilinput_nom').val(Emisor.name);
        $('#Perfilinput_tel').val(Emisor.telephone);
        $('#Perfilinput_email').val(Emisor.e_mail);
        $('#Perfilinput_negocio').val(Emisor.tradename);
        $('#Perfilinput_province').val(Emisor.location.province);
        $('#Perfilinput_canton').val(Emisor.location.canton);
        $('#Perfilinput_dist').val(Emisor.location.distrito);
        $('#Perfilinput_dir').val(Emisor.location.address);
        (error) => {
            alert(errorMessage(error.status));
        };
    } else
        console.log("Sin iniciar sesion");

}());

/*
 * 
 * localStorage stores key-value pairs. So to store a entire javascript object we need to serialize it first (with JSON.stringify, for example):
 
 localStorage.setItem('user', JSON.stringify(user));
 
 Then to retrieve it from the store and convert to an object again:
 
 var user = JSON.parse(localStorage.getItem('user'));
 
 If we need to delete all entries of the store we can simply do:
 
 localStorage.clear();
 */