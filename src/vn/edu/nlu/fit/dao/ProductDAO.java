package vn.edu.nlu.fit.dao;

import org.apache.commons.collections.iterators.ObjectArrayIterator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.nlu.fit.db.DBConect;
import vn.edu.nlu.fit.model.Product;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public Product getProduct(String ID_PRODUCT) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM `product` WHERE ID_PRODUCT=?";
        PreparedStatement preparedStatement = DBConect.getPreparedStatement(query);
        preparedStatement.setString(1, ID_PRODUCT);
        ResultSet rs = preparedStatement.executeQuery();

        rs.last();
        int row = rs.getRow();

        Product pro = new Product();
        if (rs != null && row == 1) {
            rs.first();
            pro.setId_product(rs.getString(1));
            pro.setId_items(rs.getString(2));
            pro.setId_supplier(rs.getString(3));
            pro.setProduct_name(rs.getString(4));
            pro.setPrice(rs.getDouble(5));
            pro.setImg(rs.getString(6));
            pro.setTotal(rs.getInt(7));
        }
        return pro;
    }

    public ArrayList<Product> listProduct() throws SQLException, ClassNotFoundException {

        ArrayList<Product> list = new ArrayList<>();

        String product = "SELECT * FROM product ";

        PreparedStatement ps = DBConect.getPreparedStatement(product);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String id_product = rs.getString(1);
            String id_item = rs.getString(2);
            String id_supplier = rs.getString(3);
            String product_name = rs.getString(4);
            double price = rs.getDouble(5);
            String img = rs.getString(6);
            int total = rs.getInt(7);
            int active = rs.getInt(8);
            list.add(new Product(id_product, id_item, id_supplier, product_name, price, img, total, active));
        }
        return list;
    }

    public boolean hideProduct(String id_product) throws SQLException, ClassNotFoundException {
        boolean hide = false;
        String hi = "UPDATE `webmobile`.`product` SET `ACTIVE` = 0 WHERE `ID_PRODUCT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hi);
        ps.setString(1, id_product);
        int i = ps.executeUpdate();
        if (i == 1)
            hide = true;
        return hide;
    }

    public boolean activeProduct(String id_product) throws SQLException, ClassNotFoundException {
        boolean active = false;
        String hi = "UPDATE `webmobile`.`product` SET `ACTIVE` = 1 WHERE `ID_PRODUCT` = ?";
        PreparedStatement ps = DBConect.getPreparedStatement(hi);
        ps.setString(1, id_product);
        int i = ps.executeUpdate();
        if (i == 1)
            active = true;
        return active;
    }

    public boolean delProduct(String id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String del = "DELETE FROM `webmobile`.`product` WHERE `ID_PRODUCT` = ?";
        String del_configure = "DELETE FROM `webmobile`.`configuration` WHERE `ID_PRODUCT` = ?";

        PreparedStatement conf = DBConect.getPreparedStatement(del_configure);
        conf.setString(1, id);
        int row = conf.executeUpdate();
        if (row == 1) {
            PreparedStatement ps = DBConect.getPreparedStatement(del);
            ps.setString(1, id);
            int index = ps.executeUpdate();
            if (index == 1)
                result = true;
        }
        return result;
    }

    public boolean addProduct(String id_product, String id_items, String id_supplier, String name_pro,
                              double price, String img, int total, int active) throws SQLException, ClassNotFoundException {
        boolean result = false;
        String add = "INSERT INTO `webmobile`.`product`(`ID_PRODUCT`, `ID_ITEMS`, `ID_SUPPLIER`, `PRODUCT_NAME`, `PRICE`, `IMG`, `TOTAL`,`ACTIVE`) " +
                " VALUES (?, ?, ?, ?, ?, ?, ?,?)";

        PreparedStatement ps = DBConect.getPreparedStatement(add);
        ps.setString(1, id_product);
        ps.setString(2, id_items);
        ps.setString(3, id_supplier);
        ps.setString(4, name_pro);
        ps.setDouble(5, price);
        ps.setString(6, img);
        ps.setInt(7, total);
        ps.setInt(8, active);

        int row = ps.executeUpdate();
        if (row == 1)
            result = true;
        return result;
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

    public String uploadImgProduct(HttpServletRequest request) throws Exception {
        String upload = "";

        if (ServletFileUpload.isMultipartContent(request)) {
            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

            System.out.println("truoc for");
            for (FileItem item : multiparts) {
                System.out.println("trc if");
                if (!item.isFormField()) {
                    String name = new File(item.getName()).getName();
                    System.out.println("dang for" + item.getName());
                    item.write(new File("D:\\Intellij\\web_mobile\\web\\img\\slide" + File.separator + name));
                }
            }
        }
        return upload;
    }

}
