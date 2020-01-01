package vn.edu.nlu.fit.model;

import java.util.Date;

public class Comment {
    private String id_comment, username, id_product, content;
    private Date date_comment;
    private int active;

    public Comment() {
    }

    public Comment(String id_comment, String username, String id_product, String content, Date date_comment, int active) {
        this.id_comment = id_comment;
        this.username = username;
        this.id_product = id_product;
        this.content = content;
        this.date_comment = date_comment;
        this.active = active;
    }

    public String getId_comment() {
        return id_comment;
    }

    public void setId_comment(String id_comment) {
        this.id_comment = id_comment;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId_product() {
        return id_product;
    }

    public void setId_product(String id_product) {
        this.id_product = id_product;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate_comment() {
        return date_comment;
    }

    public void setDate_comment(Date date_comment) {
        this.date_comment = date_comment;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}

