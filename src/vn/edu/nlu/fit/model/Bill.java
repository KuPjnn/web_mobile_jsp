package vn.edu.nlu.fit.model;

import java.util.Date;

public class Bill {
    private int id;
    private String userName, phone, address, status;
    private Date date;
    private double total;

    public Bill() {
    }

    public Bill(int id, String userName, Date date, String phone, String address, double total, String status) {
        this.id = id;
        this.userName = userName;
        this.date = date;
        this.phone = phone;
        this.address = address;
        this.total = total;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
