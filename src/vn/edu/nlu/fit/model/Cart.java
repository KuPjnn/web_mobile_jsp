package vn.edu.nlu.fit.model;

import java.util.ArrayList;

public class Cart {
    private Product pro;
    private int total;


    public Cart(Product pro, int total) {
        this.pro = pro;
        this.total = total;
    }

    public Cart() {

    }

    public Product getPro() {
        return pro;
    }

    public void setPro(Product pro) {
        this.pro = pro;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }


}
