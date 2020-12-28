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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SajithPe
 */
@WebServlet(urlPatterns = {"/LogUser"})
public class LogUser extends HttpServlet {

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
           
            String p_em = request.getParameter("em1");
            String p_pw = request.getParameter("pw1");

            String rs_mail = "";
            String rs_pw = "";
            String rs_un = "";
            String rs_type = "";
            int rs_id = 0;
            try {

                ResultSet rs = db_connection.search("SELECT * FROM users WHERE user_email='" + p_em + "'");

                while (rs.next()) {

                    rs_mail = rs.getString("user_email");
                    rs_pw = rs.getString("user_pass");
                    rs_un = rs.getString("user_name");
                    rs_type = rs.getString("user_type");
                    rs_id = Integer.parseInt(rs.getString("user_id"));

                }

             if(rs_mail.equals(p_em) && rs_pw.equals(p_pw) ){
                 
                   out.print("1"+"&"+rs_un+"&"+rs_type+"&"+rs_id);      
                   

            }else{
                
                 out.print("0");
                 
                
            } } catch (Exception ex) {
                Logger.getLogger(CreateAcc.class.getName()).log(Level.SEVERE, null, ex);
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
