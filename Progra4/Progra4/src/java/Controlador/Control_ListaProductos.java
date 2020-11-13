/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Person;
import DAO.DAO_Product;
import Model.List.List_Clients;
import Modelo.Emisor;
import Modelo.ListProduct;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Control_ListaProductos", urlPatterns = {"/Control_ListaProductos"})
public class Control_ListaProductos extends HttpServlet {

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

//listaProductos
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Emisor a = gson.fromJson(reader, Emisor.class);
        if (a != null) {
            DAO_Product daoP = new DAO_Product();
            ListProduct listaProductos = daoP.read(a.getDni());
            session.setAttribute("productos", listaProductos);
            PrintWriter out = response.getWriter();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(listaProductos));
            response.setStatus(200); // ok with content

        } else {
            String msj = "No ha iniciado sesión";
            // response.sendRedirect("mensajes.jsp?msj=" + msj + "link=index.jsp");
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
