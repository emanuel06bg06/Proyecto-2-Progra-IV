/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Emisor;

import Modelo.AuxiliarEmisor;

import Modelo.Emisor;

import Modelo.Ubication;
import Modelo.User;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Emanuel Barrantes Guzmán
 */
public class Control_Logueado extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        AuxiliarEmisor e = gson.fromJson(reader, AuxiliarEmisor.class);
        String pass = e.getPass();
        String user = e.getUser();
        String tradename = e.getTradename();
        Ubication ubication = new Ubication(0, e.getProvince(), e.getCanton(), e.getDistrict(), e.getAddress());
        User u = new User(user, pass);
        Emisor emisor = new Emisor(tradename, u, null, e.getNum_id(), e.getName_full(),
                e.getNum_tel(), e.getMail(), e.getType_id(), ubication);
        DAO_Emisor dao = new DAO_Emisor();
        emisor = dao.search(user);
        PrintWriter out = response.getWriter();
        response.setContentType("application/json; charset=UTF-8");
       
        out.write(gson.toJson(emisor));
        response.setStatus(200); // ok with content

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
