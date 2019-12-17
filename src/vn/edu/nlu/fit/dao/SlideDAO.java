package vn.edu.nlu.fit.dao;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Slide;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class SlideDAO {

    public List<Slide> getSlide() throws SQLException, ClassNotFoundException {
        List<Slide> list = new ArrayList<>();

        String query = "SELECT * FROM `slide`";

        PreparedStatement st = DBConect.getPreparedStatement(query);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            int id = rs.getInt(1);
            String img = Base64.getEncoder().encodeToString(rs.getBytes(2));
            int active = rs.getInt(3);
            list.add(new Slide(id, img, active));
        }
        return list;
    }

    public boolean hideSlide(String id_slide) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String hide = "UPDATE `webmobile`.`slide` SET `ACTIVE` = 0 WHERE `ID_SLIDE` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hide);
        ps.setString(1, id_slide);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean active(String id_slide) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String hide = "UPDATE `webmobile`.`slide` SET `ACTIVE` = 1 WHERE `ID_SLIDE` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hide);
        ps.setString(1, id_slide);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean delSlide(String id_slide) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String hide = "DELETE FROM `webmobile`.`slide` WHERE `ID_SLIDE` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hide);
        ps.setString(1, id_slide);
        int index = ps.executeUpdate();
        if (index == 1)
            result = true;
        return result;
    }

    public boolean uploadSlide(HttpServletRequest request) throws SQLException, ClassNotFoundException, IOException, FileUploadException {

        boolean upload = false;
        if (ServletFileUpload.isMultipartContent(request)) {
            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : multiparts) {
                if (!item.isFormField()) {
                    String up = "INSERT INTO `webmobile`.`slide`(`IMG_SLIDE`, `ACTIVE`) VALUES (?, 1)";
                    PreparedStatement ps = DBConect.getPreparedStatement(up);
                    ps.setBlob(1, item.getInputStream());
                    int index = ps.executeUpdate();
                    if (index == 1)
                        upload = true;
                }
            }
        }
        return upload;
    }
}
