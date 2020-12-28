/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author SajithPe
 */
public class BkAudioImgUpload extends HttpServlet {

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

            try {

               String title = null;
                String fileName = title;
                String fileext = null;
                String bid = null;

                boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
//ape request 1ke enne enctype="multipart/form-data" widihata encypt karapu ekakda balanawa
                if (isMultiPart) {
                    FileItemFactory fileItemFactory = new DiskFileItemFactory();
                    ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
                    List<Object> items = servletFileUpload.parseRequest(request);

                    for (Object element : items) {
                        FileItem fileItem = (FileItem) element;
                        if (fileItem.isFormField()) {
//txtfield,combo,radio wage ekakda balanawa

                            if (fileItem.getFieldName().equals("bkimgn")) {
                                title = fileItem.getString();
                               
                              
                            }
                        } else {
                            
                            File savedFile = new File(request.getServletContext().getRealPath("/") + "tmbs/" + title);

                            fileItem.write(savedFile);
                            
                           

                        }
                    }

//                    HttpSession session = request.getSession();
//                    session.setAttribute("bedited", "beok");
//                    response.sendRedirect("index.jsp");
                }

            } catch (Exception e) {
                throw new ServletException(e);
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
