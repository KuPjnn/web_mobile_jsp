package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Comment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

    public List getList() throws SQLException, ClassNotFoundException {
        List<Comment> list = new ArrayList<>();
        String comm = "SELECT * FROM `webmobile`.`comment`";
        PreparedStatement ps = DBConect.getPreparedStatement(comm);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Comment com = new Comment();
            com.setId_comment(rs.getString(1));
            com.setUsername(rs.getString(2));
            com.setId_product(rs.getString(3));
            com.setContent(rs.getString(4));
            com.setDate_comment(rs.getDate(5));
            com.setActive(rs.getInt(6));
            list.add(com);
        }
        return list;
    }

    public boolean remove(int id_comment) throws SQLException, ClassNotFoundException {
        boolean remove = false;

        String del = "DELETE FROM `webmobile`.`comment` WHERE `ID_COMMENT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(del);
        ps.setInt(1, id_comment);
        int row = ps.executeUpdate();
        if (row == 1) {
            remove = true;
        }
        return remove;
    }

    public boolean hide(int id_comment) throws SQLException, ClassNotFoundException {
        boolean hide = false;

        String del = "UPDATE `webmobile`.`comment` SET `ACTIVE` = 0 WHERE `ID_COMMENT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(del);
        ps.setInt(1, id_comment);
        int row = ps.executeUpdate();
        if (row == 1) {
            hide = true;
        }
        return hide;
    }

    public boolean active(int id_comment) throws SQLException, ClassNotFoundException {
        boolean active = false;

        String del = "UPDATE `webmobile`.`comment` SET `ACTIVE` = 1 WHERE `ID_COMMENT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(del);
        ps.setInt(1, id_comment);
        int row = ps.executeUpdate();
        if (row == 1) {
            active = true;
        }
        return active;
    }
}
