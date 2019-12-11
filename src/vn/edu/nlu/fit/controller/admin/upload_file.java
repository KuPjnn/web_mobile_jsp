package vn.edu.nlu.fit.controller.admin;

import vn.edu.nlu.fit.dao.SlideDAOImpl;
import vn.edu.nlu.fit.model.Slide;
import vn.edu.nlu.fit.util.UploadFile;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/upload_file")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

public class upload_file extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        for (Part part : request.getParts()) {
            String fileName = UploadFile.extractFileName(part);
            fileName = new File(fileName).getName();
            part.write(UploadFile.getFolderUpload("slide").getAbsolutePath() + File.separator + fileName);
            try {
                boolean upload = new SlideDAOImpl().uploadSlide(fileName);
                if (upload == true)
                    request.getRequestDispatcher("slide").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
