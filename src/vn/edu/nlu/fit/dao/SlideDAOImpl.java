package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Slide;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SlideDAOImpl {

    public List<Slide> getSlide() throws SQLException, ClassNotFoundException {
        List<Slide> list = new ArrayList<>();

        String query = "SELECT * FROM slide";

        PreparedStatement st = DBConect.getPreparedStatement(query);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            int id = rs.getInt(1);
            String img = rs.getString(2);
            list.add(new Slide(id, img));
        }
        return list;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        List<Slide> list = new SlideDAOImpl().getSlide();

        for (Slide s : list) {
            System.out.print(s.getId() + "\t");
            System.out.println(s.getImg());
        }
    }
}
