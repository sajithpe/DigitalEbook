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
public class RateBook extends HttpServlet {

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

            String bkid = request.getParameter("bk_id");
            String bkrate = request.getParameter("rate");
            String rs_rateid = "";
            String rs_bkid = "";
            String rs_bkrate = "";
            String rs_ratecount = "";

            try {

                ResultSet rs = db_connection.search("SELECT * FROM bk_rating WHERE bk_id='" + bkid + "' ");
                while (rs.next()) {
                    rs_rateid = rs.getString("rate_id");
                    rs_bkid = rs.getString("bk_id");
                    rs_bkrate = rs.getString("bk_rate");
                    rs_ratecount = rs.getString("rate_count");
                }
                if (rs_bkid.equals("")) {
                    
                    db_connection.updater("INSERT INTO bk_rating(bk_id,bk_rate,rate_count)"
                        + "VALUES('"+bkid+"','"+bkrate+"','1')");
                    out.print("1");

                }else if(rs_bkid.equals(bkid)){
                    
                    int newrate = Integer.parseInt(rs_bkrate)+Integer.parseInt(bkrate);
                    int newcount = Integer.parseInt(rs_ratecount)+1;
                    
                    
                    db_connection.updater("UPDATE bk_rating SET bk_rate='" + newrate + "',rate_count='" + newcount + "' WHERE bk_id= '" + bkid + "'");
                    out.print("1");
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
