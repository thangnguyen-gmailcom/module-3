package model;

public class Country {
    private int id;
    private String countryName;

    public Country(String countryName) {
        this.countryName = countryName;
    }

    public Country(int id) {
        this.id = id;
    }

    public Country(int id, String countryName) {
        this.id = id;
        this.countryName = countryName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
