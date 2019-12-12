package vn.edu.nlu.fit.model;

public class Supplier {
    private String id, name;
    private int active;

    public Supplier() {
    }

    public Supplier(String id, String name, int active) {
        this.id = id;
        this.name = name;
        this.active = active;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
