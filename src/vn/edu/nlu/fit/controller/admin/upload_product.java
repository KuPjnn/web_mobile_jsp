package vn.edu.nlu.fit.controller.admin;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.nlu.fit.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

@WebServlet("/admin/upload_product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class upload_product extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        String ajaxUpdateResult = ""; //test value các input nhập vào
        String urlImg = ""; //Nối chuỗi link ảnh để lưu vào CSDL
        String[] value = new String[20]; /*Lưu các giá trị nhận được từ input*/
        int i = 0;
        try {
            if (ServletFileUpload.isMultipartContent(request)) {
                List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        item.write(new File("D:\\Intellij\\web_mobile\\web\\img\\phone" + File.separator + name));
                        urlImg += "http://localhost:8080/web_mobile/img/phone/" + name + "~";
//                        ajaxUpdateResult += "File | " + name + "  | uploaded done.\n\r";
                    } else {
                        ajaxUpdateResult += item.getFieldName() + " = " + item.getString() + "\n\r";
                        value[i] = item.getString();
                        System.out.println(value[i]);
                        i++;
                    }
                }
            }
        } catch (FileUploadException e) {
            throw new ServletException("File upload failed.", e);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int active = 0;
        if (value[5].equals("1"))
            active = 1;
        try {
            Random random = new Random();
            String id_random = ("No." + (random.nextFloat() - 1)).replace("0.", "");

            boolean upload = new ProductDAO().addProduct(id_random, value[0], value[1],
                    value[2], Double.parseDouble(value[3]), urlImg, Integer.parseInt(value[4]), active);
            if (upload == true) {
                boolean add_configure = new ProductDAO().addConfigure(id_random, value[7], value[8],
                        value[9], value[10], value[11], value[12], value[13], value[14], value[6], value[15]);
                if (add_configure == true) {
                    ajaxUpdateResult += urlImg;
                    response.getWriter().print(ajaxUpdateResult);
                }
            } else {
                response.getWriter().print("Lỗi thêm sản phẩm.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

}
