/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

console.log("activo!!!!!");
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
               // validacionesLogin(Emisor);
                
            },
                    (error) => {
                alert(errorMessage(error.status));
            });
        }
);
function validacionesLogin(Emisor)
{
    let u = Emisor.user.user;
    let d = Emisor.dni;
    if (Emisor === null)
    {
        alert("Usuario o contraseña incorrectos");
    } else if (u === "adm" && d === "adm")
    {
        alert("Usuario :" + u);
        $(window).attr('location', 'view_admin.jsp');
    }
   /* else 
    {
        alert(Emisor);
       // $(window).attr('location', 'view_principal.jsp');
    }*/
}
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