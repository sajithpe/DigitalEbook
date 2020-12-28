/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbpack.db_connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SajithPe
 */
@WebServlet(urlPatterns = {"/UserSearch"})
public class UserSearch extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            try {

                String rs_id = request.getParameter("search_id");

                ResultSet rs = db_connection.search("SELECT * FROM users WHERE user_id='" + rs_id + "'");

                String rs_un = "";
                String rs_mail = "";
                String rs_pass = "";
                while (rs.next()) {

                    rs_un = rs.getString("user_name");
                    rs_mail = rs.getString("user_email");
                    rs_pass = rs.getString("user_pass");
                    
                    
                }
                 out.println("<div class=\"form-group col-sm-3\">\n"
                       
                        + "                            <input value='" + rs_id + "' type=\"hidden\" class=\"form-control\" id=\"prouid\" name=\"prouid\">\n"
                        + "                        </div>");
                out.println("<div class=\"form-group \">\n"
                        + "                            <label for=\"uname\">Username:</label>\n"
                        + "                            <input value='" + rs_un + "' readonly type=\"text\" class=\"form-control\" id=\"prouname\" placeholder=\"User name\" name=\"pro_uname\">\n"
                        + "                        </div>");
                out.println("<div class=\"form-group\">\n"
                        + "                            <label for=\"email\">Email:</label>\n"
                        + "                            <input value='" + rs_mail + "' readonly type=\"email\" class=\"form-control\" id=\"proemail\" placeholder=\"Enter email\" name=\"pro_email\">\n"
                        + "                        </div>");
                out.println("<div class=\"form-group\">\n"
                        + "                            <label for=\"name1\">Password:</label>\n"
                        + "                            <input value='" + rs_pass + "' readonly type=\"password\" class=\"form-control\" id=\"propw\" placeholder=\"Enter your first name\" name=\"pro_pw\">\n"
                        + "                        </div>");
//                out.println("<button class=\"btn btn-success\" onclick=\"update_user_btn();return false;\">Update</button>");
//                out.println("<button type=\"reset\" class=\"btn btn-warning ml-5\" onclick=\"user_icon_btn();return false;\">Cancel</button>");
                out.println("<div class=\"btn-group\">\n" +
"            <button disabled id=\"usr_updt\" class=\"btn btn-success\" onclick=\"update_user_btn();return false;\">Update</button>\n" +
"            <button disabled id=\"usr_cnsl\" type=\"reset\" class=\"btn btn-warning ml-5\" onclick=\"user_icon_btn();return false;\">Cancel</button>\n" +
"        </div>");
            } catch (Exception ex) {

            } finally {
                out.close();
            }

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
