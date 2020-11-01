package Controlador;

import DAO.DAO_Emisor;
import DAO.DAO_User;
import Modelo.Emisor;

import javax.servlet.http.HttpSession;
import Modelo.User;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Control_Login extends HttpServlet {

    /*   */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            User x = gson.fromJson(reader, User.class);
            DAO_User dao = new DAO_User();
            User u = dao.validate(x.getUser(), x.getPass());
            DAO_Emisor dao_e = new DAO_Emisor();
            Emisor emisor = dao_e.search(x.getUser());
            if (emisor != null) {
                PrintWriter out = response.getWriter();
                response.setContentType("application/json; charset=UTF-8");
                request.getSession(true).setAttribute("usuario", emisor);
                out.write(gson.toJson(emisor));
                response.setStatus(200); // ok with content
                HttpSession session = request.getSession();
                session.setAttribute("emisor", emisor);
            }
        } catch (JsonIOException | JsonSyntaxException | IOException e) {
            response.setStatus(status(e));
        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /* 
                        DAO_Emisor dao_e = new DAO_Emisor();
                        Emisor emisor = dao_e.search(user.getUser());
                        if (emisor != null) {
                            HttpSession session = request.getSession();
                            session.setAttribute("emisor", emisor);
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
            }*/
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            User x = gson.fromJson(reader, User.class);
            PrintWriter out = response.getWriter();
            //List<User> personas = Model.instance().personaSearch(persona.getNombre());
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(x));
            response.setStatus(200); // ok with content
        } catch (JsonIOException | JsonSyntaxException | IOException e) {
            response.setStatus(status(e));
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
