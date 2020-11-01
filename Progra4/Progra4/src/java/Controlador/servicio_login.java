/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Emisor;
import DAO.DAO_User;
import Modelo.Emisor;
import Modelo.User;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Emanuel Barrantes Guzmán
 */
@WebServlet(name = "servicio_login", urlPatterns = {"/servicio_login/login"})
public class servicio_login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/servicio_login/login":
                this.login(request, response);
                break;

        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        User user = gson.fromJson(reader, User.class);
        System.out.println(user.getUser());
        DAO_User dao = new DAO_User();
        User u = dao.validate(user.getUser(), user.getPass());
        if (u != null) {
            if (u.getRol() == 1) {
                if (u.getStatus() != 1) {
                    String msj = "Su perfil todavia no se ha habilitado";
                    response.sendRedirect("mensajes.jsp?msj=" + msj + "&link=index.jsp");
                } else {
                    DAO_Emisor dao_e = new DAO_Emisor();
                    Emisor emisor = dao_e.search(user.getUser());
                   System.out.println("Llegó");
                    if (emisor != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("emisor", emisor);
                        response.setContentType("application/json; charset=UTF-8");
                        response.setStatus(200);
                        request.getRequestDispatcher("view_principal.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                }
            } else {
                response.sendRedirect("view_admin.jsp");
            }
        } else {
            request.getRequestDispatcher("view_singin.jsp").forward(request, response);
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

    protected int status(Exception e) {
        if (e.getMessage().startsWith("404")) {
            return 404;
        }
        if (e.getMessage().startsWith("406")) {
            return 406;
        }
        return 400;
    }
}
