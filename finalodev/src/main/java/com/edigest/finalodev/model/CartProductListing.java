package com.edigest.finalodev.model;

public class CartProductListing {

    private int quantity;
    private Product product;

    public CartProductListing() {
    }

    public CartProductListing(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
