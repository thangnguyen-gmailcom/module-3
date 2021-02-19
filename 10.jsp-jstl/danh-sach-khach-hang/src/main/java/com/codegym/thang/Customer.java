package com.codegym.thang;

import java.sql.Date;

public class Customer {
    private String name;
    private Date dayOfBirth;
    private String address;
    private String image;

    public Customer(String name, Date dayOfBirth, String address, String image) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(Date dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
