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
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SajithPe
 */
public class UsersForList extends HttpServlet {

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
           
             String filter = request.getParameter("s_text");
             
            ResultSet rs = db_connection.search("SELECT * FROM users");
                                    int count = 0;
                                    
                                    out.println("<table id=\"ulist\" class=\"table table-bordered table-hover\">\n" +
"                <thead class=\"thead-dark\">\n" +
"                    <tr>\n" +
"                        <th>User ID</th>\n" +
"                        <th>Username</th>\n" +
"                        <th>Email</th>\n" +
"                        <th>User type</th>\n" +
"                        <th>Status</th>\n" +
"\n" +
"                    </tr>\n" +
"                </thead>\n" +
"\n" +
"                <tbody id=\"tubody1\" class=\"\">");
                                    while (rs.next()) {
                                        String rs_un = rs.getString("user_name");
                                        String rs_email = rs.getString("user_email");
                                        String rs_pass = rs.getString("user_pass");
                                        String rs_type = rs.getString("user_type");
                                        String rs_id = rs.getString("user_id");
                                        String del = rs.getString("user_del");
                                        if (rs_type.equals("a")) {

                                            rs_type = "Admin";
                                        } else {
                                            rs_type = "User";
                                        }

                                        if (del.equals("n")) {
                                            del = "Active";
                                        } else {
                                            del = "InActive";
                                        }
                                        count++;
                                        String hun = "h" + count;
            
            out.println("<tr onclick=\"edit_row('"+rs_id+"','"+rs_un+"','"+rs_email+"','"+rs_type+"','"+rs_pass+"','"+del+"');\n" +
"                                        return false;\">\n" +
"                                    <td>"+rs_id+"</td>\n" +
"                                    <td>"+rs_un+"</td>\n" +
"                                    <td>"+rs_email+"</td>\n" +
"                                    <td>"+rs_type+"</td>\n" +
"                                    <td>\n" +
"                                        <input type=\"hidden\" name=\"hpw\" value="+ rs_pass +"/>\n" +
"                                        "+ del +"</td>\n" +
"\n" +
"                                </tr>");
                                    }
            
                                    out.println(" </tbody>\n" +
"            </table>");
            
            
            
            
            
        } catch (Exception ex) {
            Logger.getLogger(UsersForList.class.getName()).log(Level.SEVERE, null, ex);
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
