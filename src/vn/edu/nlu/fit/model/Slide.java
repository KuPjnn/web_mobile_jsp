package vn.edu.nlu.fit.model;

public class Slide {
    private int id;
    private String img;

    public Slide() {
    }

    public Slide(int id, String img) {
        this.id = id;
        this.img = img;
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
}
