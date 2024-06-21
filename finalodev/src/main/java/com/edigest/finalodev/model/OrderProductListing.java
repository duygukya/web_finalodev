package com.edigest.finalodev.model;

public class OrderProductListing {
    private int orderId;
    private int productId;
    private int amount;

    public OrderProductListing() {
    }

    public OrderProductListing(int orderId, int productId, int amount) {
        this.orderId = orderId;
        this.productId = productId;
        this.amount = amount;
    }

    // Getters and setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
