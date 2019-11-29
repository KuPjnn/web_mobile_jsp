package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Slide;

import java.sql.SQLException;
import java.util.List;

public interface SlideDAO {

    public List<Slide> getSlide() throws SQLException, ClassNotFoundException;

}
