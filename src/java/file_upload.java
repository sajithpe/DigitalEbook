/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mpatric.mp3agic.ID3v2;
import com.mpatric.mp3agic.Mp3File;
import dbpack.db_connection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;

/**
 *
 * @author SajithPe
 */
public class file_upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String title = null;
            String fileName = System.currentTimeMillis() + ".";
            String tmbName = null;
            String bkName = null;
            String bkAuthor = null;
            String bkType = null;
            String bkCat = null;
            String bkFile = null;
            String fileext = null;
            Mp3File mp3file = null;
            String AimgName = null;

            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
//ape request 1ke enne enctype="multipart/form-data" widihata encypt karapu ekakda balanawa
            if (isMultiPart) {
                FileItemFactory fileItemFactory = new DiskFileItemFactory();
                ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
                List<Object> items = servletFileUpload.parseRequest(request);

                for (Object element : items) {
                    FileItem fileItem = (FileItem) element;

                    if (fileItem.isFormField()) {
                        if (fileItem.getFieldName().equals("bkname")) {
                            bkName = fileItem.getString();

                        } else if (fileItem.getFieldName().equals("bkauth")) {
                            bkAuthor = fileItem.getString();

                        } else if (fileItem.getFieldName().equals("bktype")) {
                            bkType = fileItem.getString();

                        } else if (fileItem.getFieldName().equals("bkcat")) {
                            bkCat = fileItem.getString();

                        }
                    } else {
                        
                        if (fileItem.getFieldName().equals("bkfile")) {
                            fileext = fileItem.getName().substring(fileItem.getName().length() - 3);
                            fileName = fileName + fileext;
                            tmbName = fileName.substring(0, fileName.length() - 4) + ".jpg";

                            File savedFile = new File(request.getServletContext().getRealPath("/") + "bks/" + fileName);
                            fileItem.write(savedFile);
                            
                            
                            
                        }

//                        if ("abk".equals(bkCat) && fileItem.getFieldName().equals("bkimg")) {
//                            fileext = fileItem.getName().substring(fileItem.getName().length() - 3);
//                            AimgName = fileName+fileext;
//                            File savedFile2 = new File(request.getServletContext().getRealPath("/") + "tmbs/" + AimgName);
//                            fileItem.write(savedFile2);
////
//                            
//                            ;
//                        }

                    }
                }

                //pdf to image part--start
                if ("ebk".equals(bkType)) {

                    File pdffile = new File(request.getServletContext().getRealPath("/") + "bks/" + fileName);
                    try (PDDocument document = PDDocument.load(pdffile)) {
                        PDFRenderer renderer = new PDFRenderer(document);
                        BufferedImage image = renderer.renderImage(0);
                        File saveimg = new File(request.getServletContext().getRealPath("/") + "tmbs/" + tmbName);
                        ImageIO.write(image, "JPEG", saveimg);
                        document.close();
//                pdf to image part--end
                    }
                } else if ("abk".equals(bkCat)) {

                }
            }

            db_connection.updater("insert into bk_dtl (bk_name,bk_author,bk_type,cats_id,bk_file,bk_tmb)"
                    + "values('" + bkName + "','" + bkAuthor + "','" + bkType + "','" + bkCat + "','bks/" + fileName + "','tmbs/" + tmbName + "')");
            
            out.println(tmbName);
//            HttpSession session = request.getSession(false);
//            session.setAttribute("varName", "bkOk");
//            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            throw new ServletException(e);
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
