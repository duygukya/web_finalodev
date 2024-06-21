package com.edigest.finalodev.model;

import java.io.Serializable;

public class Cart implements Serializable {
    private int id;
    private int userId;

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
