package vn.edu.nlu.fit.model;

import java.util.ArrayList;

public class ListCart {

    public ArrayList<Cart> list_cart;

    public ListCart() {
        list_cart = new ArrayList<>();
    }

    public double totalPrice() {
        double sum = 0;
        if (list_cart.isEmpty()) return sum;
        else {
            for (Cart list : list_cart) {
                sum += list.getPro().getPrice() * list.getTotal();
            }
        }
        return sum;
    }
}
