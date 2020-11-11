package Controlador;
//prueb git

import DAO.DAO_Emisor;
import DAO.DAO_Ubication;
import DAO.DAO_User;
import Modelo.AuxiliarEmisor;
import Modelo.Emisor;
import Modelo.Ubication;
import Modelo.User;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlRegistrar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            AuxiliarEmisor a = gson.fromJson(reader, AuxiliarEmisor.class);

            /* 
            if (num_id == "" || name_full == "" || num_tel == "" || mail == ""
                    || tradename == "" || user == "" || pass == "" || province == "") {
                String msj = "Todos los campos deben ser rellenados";
                response.sendRedirect(String.format("mensajes.jsp?msj=%s", msj));
            } else {*/
            Emisor emisor = new Emisor(
                    a.getTradename(),
                    new User(a.getUser(), a.getPass()),
                    null, a.getNum_id(), a.getName_full(), a.getNum_tel(), a.getMail(), a.getType_id(),
                    new Ubication(
                            0, a.getProvince(), a.getCanton(), a.getDistrict(), a.getAddress())
            );
            DAO_Ubication ubi = new DAO_Ubication();
            if (ubi.create(emisor.getLocation())) {
                DAO_User i_u = new DAO_User();
                if (i_u.create(emisor.getUser())) {
                    DAO_Emisor emi = new DAO_Emisor();
                    if (emi.create(emisor)) {
                        PrintWriter out = response.getWriter();
                        response.setContentType("application/json; charset=UTF-8");
                        out.write(gson.toJson(a));
                        response.setStatus(200); // ok with content
                        // response.sendRedirect("mensajes.jsp?msj=Registro completo");
                    } else {
                        i_u.delete(a.getUser());
                        //response.sendRedirect("mensajes.jsp?msj=Error al registrar la info");
                    }
                } else {
                    // response.sendRedirect("mensajes.jsp?msj=Error al registrar el user");
                }
            } else {
                // response.sendRedirect("mensajes.jsp?msj=Error al registrar el usuario");
            }

        } catch (NumberFormatException ex) {
            String msj = "Todos los campos deben ser rellenados";
            response.sendRedirect(String.format("mensajes.jsp?msj=%s", msj));
            System.err.println(Arrays.toString(ex.getStackTrace()));
        } catch (IOException | SQLException ex) {
            if (ex instanceof SQLIntegrityConstraintViolationException) {
                // response.sendRedirect("mensajes.jsp?msj=El usuario ya existe&&link=index.jsp");
            }
            Logger.getLogger(ControlRegistrar.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
