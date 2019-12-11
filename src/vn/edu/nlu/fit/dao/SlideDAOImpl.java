package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Slide;
import vn.edu.nlu.fit.util.Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SlideDAOImpl implements ISlideDAO {

    @Override
    public List<Slide> getSlide() throws SQLException, ClassNotFoundException {
        List<Slide> list = new ArrayList<>();

        String query = "SELECT * FROM `slide`";

        PreparedStatement st = DBConect.getPreparedStatement(query);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            int id = rs.getInt(1);
            String img = rs.getString(2);
            int active = rs.getInt(3);
            list.add(new Slide(id, img, active));
        }
        return list;
    }

    @Override
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

    @Override
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

    @Override
    public boolean uploadSlide(String slide) throws SQLException, ClassNotFoundException {
        boolean upload = false;
        String up = "INSERT INTO `webmobile`.`slide`(`IMG_SLIDE`, `ACTIVE`) VALUES (?, 1)";
        PreparedStatement ps = DBConect.getPreparedStatement(up);
        ps.setString(1, Util.fullPath("img/slide/" + slide));
        int index = ps.executeUpdate();
        if (index == 1)
            upload = true;
        return upload;
    }

    @Override
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
}
