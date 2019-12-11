package vn.edu.nlu.fit.util;

import javax.servlet.http.Part;
import java.io.File;

public class UploadFile {
    public static String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public static File getFolderUpload(String folder) {
        File folderUpload = new File("D:\\Intellij\\web_mobile\\web\\img\\" + folder);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
}
