/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbpack.db_connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SajithPe
 */
public class AdminUpdateUser extends HttpServlet {

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
            
            String up_un = request.getParameter("up_un2");
            String up_em = request.getParameter("up_em2");
            String up_id = request.getParameter("up_id2");
            String up_pw = request.getParameter("up_pw2");
            String up_del = request.getParameter("up_del2");
            String up_type = request.getParameter("up_type2");
            String rs_mail = "";
            
           

            try {

                ResultSet rs = db_connection.search("SELECT * FROM users WHERE user_email='" + up_em + "' AND user_id!='" + up_id + "' ");
                while (rs.next()) {
                    rs_mail = rs.getString("user_email");
                    
                }
               if ("".equals(rs_mail)) {

                    db_connection.updater("UPDATE users SET user_name='" + up_un + "',user_email='" + up_em + "' ,user_pass='" + up_pw + "' ,"
                            + "user_type='" + up_type + "' ,user_del='" + up_del + "' WHERE user_id= '" + up_id + "'");
                    
                    out.println("<div class=\"p-3 my-3 border\">\n" +
"                <jsp:include page=\"adminArea.jsp\"/>\n" +
"            </div> ");
                    
                } else if(up_em.equals(rs_mail)){
                    out.println(0);
                }
            } catch (Exception e) {

                e.printStackTrace();
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
