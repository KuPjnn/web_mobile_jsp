package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Configure;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConfigureDAO {

    public Configure getConfigure(String id_product) throws SQLException, ClassNotFoundException {
        Configure conf = new Configure();
        String get = "SELECT * FROM `webmobile`.`configuration` WHERE `ID_PRODUCT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(get);
        ps.setString(1, id_product);
        ResultSet rs = ps.executeQuery();
        rs.last();
        int row = rs.getRow();
        if (row == 1) {
            rs.first();
            conf.setDisplay(rs.getString(2));
            conf.setCamera_font(rs.getString(3));
            conf.setCamera_back(rs.getString(4));
            conf.setRam(rs.getString(5));
            conf.setRom(rs.getString(6));
            conf.setCpu(rs.getString(7));
            conf.setGpu(rs.getString(8));
            conf.setBattery(rs.getString(9));
            conf.setOs(rs.getString(10));
            conf.setSim(rs.getString(11));
        }
        return conf;
    }

    public boolean addConfigure(String id_pro, String display, String cam_font, String cam_back, String ram, String rom,
                                String cpu, String gpu, String battery, String os, String sim) throws SQLException, ClassNotFoundException {
        boolean addConf = false;
        String add = "INSERT INTO `webmobile`.`configuration`(`ID_PRODUCT`, `DISPLAY`, `CAMERA_FRONT`, `CAMERA_BACK`, `RAM`, `ROM`, `CPU`, `GPU`, `BATTERY`, `OS`, `SIM`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = DBConect.getPreparedStatement(add);
        ps.setString(1, id_pro);
        ps.setString(2, display);
        ps.setString(3, cam_font);
        ps.setString(4, cam_back);
        ps.setString(5, ram);
        ps.setString(6, rom);
        ps.setString(7, cpu);
        ps.setString(8, gpu);
        ps.setString(9, battery);
        ps.setString(10, os);
        ps.setString(11, sim);
        int row = ps.executeUpdate();
        if (row == 1)
            addConf = true;
        return addConf;
    }

    public boolean updateConfigure(String id_pro, String display, String cam_font, String cam_back, String ram, String rom,
                                   String cpu, String gpu, String battery, String os, String sim) throws SQLException, ClassNotFoundException {
        boolean updateConf = false;
        String update = "UPDATE `webmobile`.`configuration` SET `DISPLAY` = ?, `CAMERA_FRONT` = ?, `CAMERA_BACK` = ?, `RAM` = ?, `ROM` = ?, `CPU` = ?, `GPU` = ?, `BATTERY` = ?, `OS` = ?, `SIM` = ? WHERE `ID_PRODUCT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(update);

        ps.setString(1, display);
        ps.setString(2, cam_font);
        ps.setString(3, cam_back);
        ps.setString(4, ram);
        ps.setString(5, rom);
        ps.setString(6, cpu);
        ps.setString(7, gpu);
        ps.setString(8, battery);
        ps.setString(9, os);
        ps.setString(10, sim);
        ps.setString(11, id_pro);
        int row = ps.executeUpdate();
        if (row == 1)
            updateConf = true;
        return updateConf;
    }
}
