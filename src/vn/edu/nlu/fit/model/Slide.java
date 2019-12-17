package vn.edu.nlu.fit.model;

import java.sql.Blob;

public class Slide {
    private int id;
    private String img;
    private int active;


    public Slide() {
    }

    public Slide(int id, String img, int active) {
        this.id = id;
        this.img = img;
        this.active = active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}

