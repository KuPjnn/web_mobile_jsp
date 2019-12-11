package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Slide;

import java.sql.SQLException;
import java.util.List;

public interface ISlideDAO {

    public List<Slide> getSlide() throws SQLException, ClassNotFoundException;

    public boolean hideSlide(String id_slide) throws SQLException, ClassNotFoundException;

    public boolean active(String id_slide) throws SQLException, ClassNotFoundException;

    public boolean uploadSlide(String slide) throws SQLException, ClassNotFoundException;

    public boolean delSlide(String id_slide) throws SQLException, ClassNotFoundException;
}
