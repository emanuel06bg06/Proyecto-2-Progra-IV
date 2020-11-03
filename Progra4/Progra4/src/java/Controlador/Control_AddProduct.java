package Controlador;

import DAO.DAO_Product;
import Model.List.List_category;
import Modelo.Producto;
import Modelo.Emisor;
import Modelo.User;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Control_AddProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        int category = Integer.valueOf(request.getParameter("category"));
        Producto p = gson.fromJson(reader, Producto.class);
        DAO_Product dao = new DAO_Product();
        HttpSession session = request.getSession(false);
        if (session != null) {
            Emisor emisor = (Emisor) session.getAttribute("emisor");
            if (emisor != null) {
                List_category categories = (List_category) session.getAttribute("categories");
                Producto producto = new Producto(p.getId(), p.getDetail(), p.getPrice(), categories.get(category));
                if (dao.create(producto, emisor.getDni())) {
                    response.sendRedirect("mensajes.jsp?msj=Ingresado&link=view_addProduct.jsp");
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json; charset=UTF-8");
                    out.write(gson.toJson(producto));
                    response.setStatus(200); // ok with content
                    request.getSession(true).setAttribute("usuario", emisor);

                } else {
                    response.sendRedirect("mensajes.jsp?msj=No se pudo relacionar su producto a su cuenta"
                            + "&link=view_addProduct.jsp");
                }
            } else {
                response.sendRedirect("mensajes.jsp?msj=El emisor no se encuentra"
                        + "&link=view_addProduct.jsp");
            }
        } else {
            response.sendRedirect("mensajes.jsp?msj=Error en sesion&link=view_addProduct.jsp");
        }
    }

    protected int status(Exception e) {
        if (e.getMessage().startsWith("404")) {
            return 404;
        }
        if (e.getMessage().startsWith("406")) {
            return 406;
        }
        return 400;
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
