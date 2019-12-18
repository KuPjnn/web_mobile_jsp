package vn.edu.nlu.fit.model;

public class Configure {
    private String id_product, display, camera_font, camera_back, ram, rom, cpu, gpu, battery, os, sim;

    public Configure() {
    }

    public Configure(String id_product, String display, String camera_font,
                     String camera_back, String ram, String rom, String cpu, String gpu, String battery, String os, String sim) {
        this.id_product = id_product;
        this.display = display;
        this.camera_font = camera_font;
        this.camera_back = camera_back;
        this.ram = ram;
        this.rom = rom;
        this.cpu = cpu;
        this.gpu = gpu;
        this.battery = battery;
        this.os = os;
        this.sim = sim;
    }

    public String getId_product() {
        return id_product;
    }

    public void setId_product(String id_product) {
        this.id_product = id_product;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getCamera_font() {
        return camera_font;
    }

    public void setCamera_font(String camera_font) {
        this.camera_font = camera_font;
    }

    public String getCamera_back() {
        return camera_back;
    }

    public void setCamera_back(String camera_back) {
        this.camera_back = camera_back;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getRom() {
        return rom;
    }

    public void setRom(String rom) {
        this.rom = rom;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getGpu() {
        return gpu;
    }

    public void setGpu(String gpu) {
        this.gpu = gpu;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }
}
