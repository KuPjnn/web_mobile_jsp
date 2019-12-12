package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Supplier;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO {
    public List<Supplier> listSupplier() throws SQLException, ClassNotFoundException {
        List<Supplier> list = new ArrayList<>();

        String query = "SELECT * FROM `supplier`";

        PreparedStatement st = DBConect.getPreparedStatement(query);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String id = rs.getString(1);
            String name = rs.getString(2);
            int active = rs.getInt(3);
            list.add(new Supplier(id, name, active));
        }
        return list;
    }

    public Supplier getSupplier(String id) {
        return null;
    }
}
