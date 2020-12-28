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
public class RdLtrForList extends HttpServlet {

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

            String activeUser = request.getParameter("s_usr");

            ResultSet rs = db_connection.search("SELECT * FROM ((user_readlater LEFT JOIN bk_dtl ON user_readlater.bk_id = bk_dtl.bk_id)LEFT JOIN book_cats ON bk_dtl.cats_id = book_cats.cats_id) WHERE bk_dtl.bk_del = 'n' AND user_readlater.user_id = '" + activeUser + "' ");
            

            out.println("<table id=\"rLlist\" class=\"table table-bordered table-hover\">\n"
                    + "                <thead class=\"thead-dark\">\n"
                    + "                    <tr>\n"
                    + "                    <th>Book Title</th>\n"
                    + "                    <th>Author</th>\n"
                    + "                    <th>Book type</th>\n"
                    + "                    <th>Category</th>\n"
                    + "\n"
                    + "                    </tr>\n"
                    + "                </thead>\n"
                    + "\n"
                    + "                <tbody id=\"trlbody1\" class=\"\">");
            while (rs.next()) {
                String rs_tit = rs.getString("bk_dtl.bk_name");
                String rs_auth = rs.getString("bk_dtl.bk_author");
                String rs_catn = rs.getString("cat_name");
                String rs_bkid = rs.getString("user_readlater.bk_id");
                String rs_type = rs.getString("bk_dtl.bk_type");
                String rs_bkfile = rs.getString("bk_dtl.bk_file");
                String rs_bktmb = rs.getString("bk_dtl.bk_tmb");
                
                if(rs_type=="abk"){
                    rs_type = "Audio Book";
                }else{
                    rs_type = "Ebook";
                }
                
               

                out.println("<tr onclick=\"rLbk_row('"+rs_bkid+"','"+ rs_bkfile +"','"+ rs_bktmb +"','"+ rs_tit +"');\n" +
"                        return false;\">\n" +
"                    <td>"+rs_tit+"</td>\n" +
"                    <td>"+rs_auth+"</td>\n" +
"                    <td>"+rs_type+"</td>\n" +
"                    <td>"+rs_catn+"</td>\n" +

"\n" +
"                                </tr>");
                                    }
            
                                    out.println(" </tbody>\n" +
"            </table>");

        } catch (Exception ex) {
            Logger.getLogger(RdLtrForList.class.getName()).log(Level.SEVERE, null, ex);
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
