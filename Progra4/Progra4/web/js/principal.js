/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

console.log("activo!!!!!");
var Emisor = JSON.parse(localStorage.getItem('user'));
var Clientes = JSON.parse(localStorage.getItem('clients'));
var listaProductos = JSON.parse(localStorage.getItem('listaProductos'));
var facturas = JSON.parse(localStorage.getItem('facturas'));
//listaProductos
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
                cargarListaClientes();
                cargarListaP();
                cargarListaFacturas();

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
            //console.log(Emisor);
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
            //console.log(AuxiliarEmisor);

            $.ajax({type: "POST", url: "Control_Perfil", data: JSON.stringify(AuxiliarEmisor),
                contentType: "application/json"}).then((emisor) =>
            {
                AuxiliarEmisor = JSON.parse(JSON.stringify(emisor));
                localStorage.setItem('user', JSON.stringify(emisor));
                Emisor = JSON.parse(localStorage.getItem('user'));
                //console.log(emisor);
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
                });


                $(window).attr('location', 'view_principal.jsp');


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


        }
);

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


var mostrarListaClientes = (function () {


    //
    for (var i = 0; i < Clientes.clientes.length; i++) {

        type = Clientes.clientes[i].id_type;
        if (type === 1) {
            type = "Físico";
        } else if (type === 2) {
            type = "Jurídico";
        }
        dni = Clientes.clientes[i].dni;
        name = Clientes.clientes[i].name;
        telephone = Clientes.clientes[i].telephone;
        e_mail = Clientes.clientes[i].e_mail;
        province = Clientes.clientes[i].location.province;
        canton = Clientes.clientes[i].location.canton;
        distrito = Clientes.clientes[i].location.distrito;
        direccion = Clientes.clientes[i].location.address;

        var newElement = '<input type="submit" value="Agregar Cliente" name=btnAddC_' + i + '>';
        $('#tableMain').append("<tr><td>" + type + "</td><td>" + dni + "</td><td>" +
                name + "</td><td>" + telephone + "</td><td>" + e_mail + "</td><td>" + province +
                "</td><td>" + canton + "</td><td>" + distrito + "</td> <td>"
                + Clientes.clientes[i].location.address + "</td>" + " <td>" + newElement + "</td></tr>"
                );
    }

}());
function cargarListaP() {

    console.log(Emisor);
    $.ajax({type: "POST", url: "Control_ListaProductos",
        data: JSON.stringify(Emisor),
        contentType: "application/json"}
    ).then((listaProductos) =>
    {
        localStorage.setItem('listaProductos', JSON.stringify(listaProductos));

    }
    );

}

var mostrarListaP = (function () {

    for (var i = 0; i < listaProductos.length; i++) {

        id = listaProductos[i].id;
        detail = listaProductos[i].detail;
        price = listaProductos[i].price;
        descripcion = listaProductos[i].category.descripcion;
        iva = (listaProductos[i].category.iva) * 100;
        cantidad = listaProductos[i].cantidad;
        var step = '<input name=cantidad_' + i + ' type="number" min="0" step="1">';
        var c = '<input name=btnAdd_' + i + ' type="submit" value="Agregar">';
        $('#tablaProductos').append("<tr><td>" + descripcion + "</td><td>" + detail + "</td><td>" +
                price + "</td><td>" + iva + "</td><td>" + step + "</td><td>" + c + "</td></tr>"
                );
    }

}());





function cargarListaClientes() {
    //$('#div_principal').append($('<H2>').val(Emisor.name).text(Emisor.name));
    console.log(Emisor);
    $.ajax({type: "POST", url: "ControlB_Facturar",
        data: JSON.stringify(Emisor),
        contentType: "application/json"}
    ).then((clientes) =>
    {
        localStorage.setItem('clients', JSON.stringify(clientes));
    }
    );
}

function cargarListaFacturas() {
    //$('#div_principal').append($('<H2>').val(Emisor.name).text(Emisor.name));
    console.log(Emisor);
    $.ajax({type: "POST", url: "Control_ListaFacturas",
        data: JSON.stringify(Emisor),
        contentType: "application/json"}
    ).then((facturas) =>
    {
        localStorage.setItem('facturas', JSON.stringify(facturas));
    }
    );
}
var mostrarListaF = (function () {
    
  
    for (var i = 0; i < facturas.facturas.length; i++) {
        var botones='<form action="Control_Fac_List" method="POST"><input type="submit" name=verPdf_'
                + i+' value="Ver PDF"></form></td><td><form action="Control_XML" method="POST"><input type="submit" name=verXML_'+ 
                i+' value="Ver XML"></form></td> ';
        id = facturas.facturas[i].id;
        dni = facturas.facturas[i].cliente.dni;
        name = facturas.facturas[i].cliente.name;
        c = facturas.facturas[0].productos[0].cantidad;
        total = 0;
       
 $("#tabla_list_facturas").append('<tr><td>'+id+'</td><td>'
        +dni+'</td><td>'+name+
        '</td><td>'+botones+'</td></tr>');


    }

}());

var cargarPerfilUsuario = (function () {
    if (!Clientes)
    {
        console.log("Lista clientes nula");
    } else
    {
        //console.log(Clientes);
    }


}());




$(document).ready(function () {
    //=================================================================
    //click on table body
    //$("#tableMain tbody tr").click(function () {
    $('#tableMain tbody').on('click', 'tr', function () {
        //get row contents into an array
        var tableData = $(this).children("td").map(function () {
            return $(this).text();
        }).get();
        var td = tableData[0] + tableData[1]
                + tableData[2]
                + tableData[3] + tableData[4]
                + tableData[5] + tableData[6]
                + tableData[7] + tableData[8]
                + tableData[9];

        Emisor.dni = tableData[1];
        Emisor.name = tableData[2];
        Emisor.telephone = tableData[3];
        Emisor.e_mail = tableData[4];
        Emisor.tradename = tableData[5];
        Emisor.location.province = tableData[6];
        Emisor.location.canton = tableData[7];
        Emisor.location.distrito = tableData[8];
        Emisor.location.address = tableData[9];

    });

});

