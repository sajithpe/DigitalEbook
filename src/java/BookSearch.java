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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SajithPe
 */
public class BookSearch extends HttpServlet {

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
            String rs_tit = "";
            String rs_auth = "";
            String rs_cat = "";
            String rs_bkfile = "";
            String rs_tmb = "";
            int rs_rate = 0;
            String rs_bkid = "";
            String starimg = null;
            String cats_id = "";
            String oprtr = "";

            /*Cehck if input text includes special characters*/
            String my_str = filter;
            Pattern my_pattern = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
            Matcher my_match = my_pattern.matcher(my_str);
            boolean check = my_match.find();

            if (check) {

                filter = "%";
            } else {

                filter = "%" + filter + "%";
            }

            String q1 = "SELECT *, TRUNCATE(bk_rating.bk_rate / bk_rating.rate_count,0) AS rate"
                    + " FROM ((bk_dtl LEFT JOIN book_cats ON bk_dtl.cats_id = book_cats.cats_id) "
                    + "LEFT JOIN bk_rating ON bk_dtl.bk_id = bk_rating.bk_id) WHERE bk_del='n' AND bk_dtl.bk_name LIKE '" + filter + "' ORDER BY rate DESC ";

            String q2 = "SELECT *, TRUNCATE(bk_rating.bk_rate / bk_rating.rate_count,0) AS rate"
                    + " FROM ((bk_dtl LEFT JOIN book_cats ON bk_dtl.cats_id = book_cats.cats_id) "
                    + "LEFT JOIN bk_rating ON bk_dtl.bk_id = bk_rating.bk_id) WHERE bk_del='n' AND bk_dtl.bk_name LIKE '" + filter + "' "
                    + "OR bk_dtl.bk_author LIKE '" + filter + "' OR book_cats.cat_name LIKE '" + filter + "' ORDER BY rate DESC ";

            if (filter.equals("%")) {

                oprtr = q1;

            } else {

                oprtr = q2;
            }

            ResultSet rs = db_connection.search(oprtr);
            while (rs.next()) {

                rs_tit = rs.getString("bk_name");
                rs_auth = rs.getString("bk_author");
                rs_cat = rs.getString("cat_name");
                rs_bkfile = rs.getString("bk_file");
                rs_tmb = rs.getString("bk_tmb");
                rs_rate = rs.getInt("rate");
                rs_bkid = rs.getString("bk_id");
                starimg = null;
                cats_id = rs.getString("bk_dtl.cats_id");

                if (rs_rate == 0) {
                    starimg = "images/Star_0.png";
                } else if (rs_rate == 1) {
                    starimg = "images/Star_rating_1.png";
                } else if (rs_rate == 2) {
                    starimg = "images/Star_rating_2.png";
                } else if (rs_rate == 3) {
                    starimg = "images/Star_rating_3.png";
                } else if (rs_rate == 4) {
                    starimg = "images/Star_rating_4.png";
                } else if (rs_rate == 5) {
                    starimg = "images/Star_rating_5.png";
                }
                out.println("<div id=\"\" class=\"col-11 col-lg-3 card-deck\">\n"
                        + "            <div name=" + cats_id + "' class=\"card mb-3\" style=\"max-width: 540px\">\n"
                        + "                <img id=\"bookimgS\" class=\"card-img-top\" src='" + rs_tmb + "' alt=\"Card image cap\">\n"
                        + "\n"
                        + "\n"
                        + "                <div class=\"card-header text-center\">\n"
                        + "                    <a href=\"product.html\" title=\"View Product\" id=\"bkTitleS\">\n"
                        + "                        " + rs_tit + "</a>\n"
                        + "                </div>\n"
                        + "                <div class=\"card-body text-success text-center\">\n"
                        + "                    " + rs_auth + "\n"
                        + "                </div>\n"
                        + "                <div class=\"card-footer text-info text-center mb-1\">\n"
                        + "                    " + rs_cat + "\n"
                        + "                </div>\n"
                        + "                <div class=\"row my-1\">\n"
                        + "                    <div class=\"col mx-2\">\n"
                        + "                        <h3 onclick=\"download_bk('" + rs_bkfile + "','" + rs_tit + "','" + rs_tmb + "');\" class=\"btn btn-danger btn-block\">Download</h3>"
                        + "                    </div>\n"
                        + "                    <div class=\"col mx-2\">\n"
                        + "                        <h3 onclick=\"readlater_bk('"+rs_bkid+"','bksearch');\" class=\"btn btn-primary btn-block\">Read later</h3>\n"
                        + "                    </div>\n"
                        + "\n"
                        + "                </div>\n"
                        + "\n"
                        + "                <div class=\"row my-1 text-center\">\n"
                        + "                    <div class=\"my-2 btn-sm btn-light mx-auto d-block\" style=\"max-width: 50%\">\n"
                        + "                        <input id=\"rateValueS\" type=\"text\" hidden=\"true\" value=" + rs_rate + ">\n"
                        + "                        <input id=\"bookidS\" type=\"text\" hidden=\"true\" value=" + rs_bkid + ">\n"
                        + "                        <img class=\"img-fluid mx-auto d-block\" src=" + starimg + " onclick=\"rate_thisS('" + rs_bkid + "', '" + rs_tmb + "', '" + rs_tit + "', '" + rs_auth + "');\">\n"
                        + "                       <button style=\"display: none\"id=\"starRateS\" data-toggle=\"modal\" data-target=\"#RateWinS\"></button>\n"
                        + "                    </div>\n"
                        + "                </div>\n"
                        + "\n"
                        + "            </div>\n"
                        + "        </div><br>");

            }

        } catch (Exception ex) {
            Logger.getLogger(BookSearch.class.getName()).log(Level.SEVERE, null, ex);
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
